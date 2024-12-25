-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-5.7
-- Время создания: Дек 25 2024 г., 15:23
-- Версия сервера: 5.7.44
-- Версия PHP: 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `f1067877_opencart`
--

-- --------------------------------------------------------

--
-- Структура таблицы `oc_address`
--

CREATE TABLE `oc_address` (
  `address_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `company` varchar(60) NOT NULL,
  `address_1` varchar(128) NOT NULL,
  `address_2` varchar(128) NOT NULL,
  `city` varchar(128) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `country_id` int(11) NOT NULL DEFAULT '0',
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `custom_field` text NOT NULL,
  `default` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_address_format`
--

CREATE TABLE `oc_address_format` (
  `address_format_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `address_format` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_address_format`
--

INSERT INTO `oc_address_format` (`address_format_id`, `name`, `address_format`) VALUES
(1, 'Address Format', '{firstname} {lastname}\r\n{company}\r\n{address_1}\r\n{address_2}\r\n{city}, {zone} {postcode}\r\n{country}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_antispam`
--

CREATE TABLE `oc_antispam` (
  `antispam_id` int(11) NOT NULL,
  `keyword` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api`
--

CREATE TABLE `oc_api` (
  `api_id` int(11) NOT NULL,
  `username` varchar(64) NOT NULL,
  `key` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_api`
--

INSERT INTO `oc_api` (`api_id`, `username`, `key`, `status`, `date_added`, `date_modified`) VALUES
(1, 'Default', '74d3b24b81137632fb6ecc4d763de50079925c210fe4fbdead6c24722916f8a4a4ac9790efba572d8961ffc85874085eb80a19415e654f50d12f40398676dd20ea140fd3e6e48b511711a96c74fecabfdba00952a8843a7f288fbd183a83507a50f2037c05f5074489eb60353b7b6cc49a4294c21ca22ad14a0316717574386e', 1, '2024-12-25 09:19:08', '2024-12-25 09:19:08');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_ip`
--

CREATE TABLE `oc_api_ip` (
  `api_ip_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_api_session`
--

CREATE TABLE `oc_api_session` (
  `api_session_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article`
--

CREATE TABLE `oc_article` (
  `article_id` int(11) NOT NULL,
  `topic_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_comment`
--

CREATE TABLE `oc_article_comment` (
  `article_comment_id` int(11) NOT NULL,
  `article_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `status` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_description`
--

CREATE TABLE `oc_article_description` (
  `article_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_layout`
--

CREATE TABLE `oc_article_to_layout` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_article_to_store`
--

CREATE TABLE `oc_article_to_store` (
  `article_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute`
--

CREATE TABLE `oc_attribute` (
  `attribute_id` int(11) NOT NULL,
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_attribute`
--

INSERT INTO `oc_attribute` (`attribute_id`, `attribute_group_id`, `sort_order`) VALUES
(1, 6, 1),
(2, 6, 5),
(3, 6, 3),
(4, 3, 1),
(5, 3, 2),
(6, 3, 3),
(7, 3, 4),
(8, 3, 5),
(9, 3, 6),
(10, 3, 7),
(11, 3, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_description`
--

CREATE TABLE `oc_attribute_description` (
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_attribute_description`
--

INSERT INTO `oc_attribute_description` (`attribute_id`, `language_id`, `name`) VALUES
(1, 1, 'Description'),
(2, 1, 'No. of Cores'),
(3, 1, 'Clockspeed'),
(4, 1, 'test 1'),
(5, 1, 'test 2'),
(6, 1, 'test 3'),
(7, 1, 'test 4'),
(8, 1, 'test 5'),
(9, 1, 'test 6'),
(10, 1, 'test 7'),
(11, 1, 'test 8');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group`
--

CREATE TABLE `oc_attribute_group` (
  `attribute_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_attribute_group`
--

INSERT INTO `oc_attribute_group` (`attribute_group_id`, `sort_order`) VALUES
(3, 2),
(4, 1),
(5, 3),
(6, 4);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_attribute_group_description`
--

CREATE TABLE `oc_attribute_group_description` (
  `attribute_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_attribute_group_description`
--

INSERT INTO `oc_attribute_group_description` (`attribute_group_id`, `language_id`, `name`) VALUES
(3, 1, 'Memory'),
(4, 1, 'Technical'),
(5, 1, 'Motherboard'),
(6, 1, 'Processor');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner`
--

CREATE TABLE `oc_banner` (
  `banner_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_banner`
--

INSERT INTO `oc_banner` (`banner_id`, `name`, `status`) VALUES
(6, 'HP Products', 1),
(7, 'Home Page Slideshow', 1),
(8, 'Manufacturers', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_banner_image`
--

CREATE TABLE `oc_banner_image` (
  `banner_image_id` int(11) NOT NULL,
  `banner_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `link` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_banner_image`
--

INSERT INTO `oc_banner_image` (`banner_image_id`, `banner_id`, `language_id`, `title`, `link`, `image`, `sort_order`) VALUES
(79, 7, 1, 'iPhone 6', 'index.php?route=product/product&amp;path=57&amp;product_id=49', 'catalog/demo/banners/iPhone6.jpg', 0),
(80, 7, 1, 'MacBookAir', '', 'catalog/demo/banners/MacBookAir.jpg', 0),
(87, 6, 1, 'HP Banner', 'index.php?route=product/manufacturer.info&amp;manufacturer_id=7', 'catalog/demo/compaq_presario.jpg', 0),
(88, 8, 1, 'Harley Davidson', '', 'catalog/demo/manufacturer/harley.png', 0),
(89, 8, 1, 'Dell', '', 'catalog/demo/manufacturer/dell.png', 0),
(90, 8, 1, 'Disney', '', 'catalog/demo/manufacturer/disney.png', 0),
(91, 8, 1, 'Coca Cola', '', 'catalog/demo/manufacturer/cocacola.png', 0),
(92, 8, 1, 'Burger King', '', 'catalog/demo/manufacturer/burgerking.png', 0),
(93, 8, 1, 'Canon', '', 'catalog/demo/manufacturer/canon.png', 0),
(94, 8, 1, 'NFL', '', 'catalog/demo/manufacturer/nfl.png', 0),
(95, 8, 1, 'RedBull', '', 'catalog/demo/manufacturer/redbull.png', 0),
(96, 8, 1, 'Sony', '', 'catalog/demo/manufacturer/sony.png', 0),
(97, 8, 1, 'Starbucks', '', 'catalog/demo/manufacturer/starbucks.png', 0),
(98, 8, 1, 'Nintendo', '', 'catalog/demo/manufacturer/nintendo.png', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_cart`
--

CREATE TABLE `oc_cart` (
  `cart_id` int(11) NOT NULL,
  `api_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `session_id` varchar(32) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `option` text NOT NULL,
  `quantity` int(5) NOT NULL,
  `override` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category`
--

CREATE TABLE `oc_category` (
  `category_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `parent_id` int(11) NOT NULL DEFAULT '0',
  `top` tinyint(1) NOT NULL,
  `column` int(3) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_category`
--

INSERT INTO `oc_category` (`category_id`, `image`, `parent_id`, `top`, `column`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(17, '', 0, 1, 1, 4, 1, '2009-01-03 21:08:57', '2011-05-30 12:15:11'),
(18, 'catalog/demo/hp_2.jpg', 0, 1, 0, 2, 1, '2009-01-05 21:49:15', '2011-05-30 12:13:55'),
(20, 'catalog/demo/compaq_presario.jpg', 0, 1, 1, 1, 1, '2009-01-05 21:49:43', '2011-07-16 02:14:42'),
(24, '', 0, 1, 1, 5, 1, '2009-01-20 02:36:26', '2011-05-30 12:15:18'),
(25, '', 0, 1, 1, 3, 1, '2009-01-31 01:04:25', '2011-05-30 12:14:55'),
(26, '', 20, 0, 0, 1, 1, '2009-01-31 01:55:14', '2010-08-22 06:31:45'),
(27, '', 20, 0, 0, 2, 1, '2009-01-31 01:55:34', '2010-08-22 06:32:15'),
(28, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:12', '2010-08-22 06:32:46'),
(29, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:37', '2010-08-22 06:32:39'),
(30, '', 25, 0, 0, 1, 1, '2009-02-02 13:11:59', '2010-08-22 06:33:00'),
(31, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:24', '2010-08-22 06:33:06'),
(32, '', 25, 0, 0, 1, 1, '2009-02-03 14:17:34', '2010-08-22 06:33:12'),
(33, '', 0, 1, 1, 6, 1, '2009-02-03 14:17:55', '2011-05-30 12:15:25'),
(34, 'catalog/demo/ipod_touch_4.jpg', 0, 1, 4, 7, 1, '2009-02-03 14:18:11', '2011-05-30 12:15:31'),
(35, '', 28, 0, 0, 0, 1, '2010-09-17 10:06:48', '2010-09-18 14:02:42'),
(36, '', 28, 0, 0, 0, 1, '2010-09-17 10:07:13', '2010-09-18 14:02:55'),
(37, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:39', '2011-04-22 01:55:08'),
(38, '', 34, 0, 0, 0, 1, '2010-09-18 14:03:51', '2010-09-18 14:03:51'),
(39, '', 34, 0, 0, 0, 1, '2010-09-18 14:04:17', '2011-04-22 01:55:20'),
(40, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:36', '2010-09-18 14:05:36'),
(41, '', 34, 0, 0, 0, 1, '2010-09-18 14:05:49', '2011-04-22 01:55:30'),
(42, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:34', '2010-11-07 20:31:04'),
(43, '', 34, 0, 0, 0, 1, '2010-09-18 14:06:49', '2011-04-22 01:55:40'),
(44, '', 34, 0, 0, 0, 1, '2010-09-21 15:39:21', '2010-11-07 20:30:55'),
(45, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:16', '2011-04-26 08:52:11'),
(46, '', 18, 0, 0, 0, 1, '2010-09-24 18:29:31', '2011-04-26 08:52:23'),
(47, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:16', '2010-11-07 11:13:16'),
(48, '', 34, 0, 0, 0, 1, '2010-11-07 11:13:33', '2010-11-07 11:13:33'),
(49, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:04', '2010-11-07 11:14:04'),
(50, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:23', '2011-04-22 01:16:01'),
(51, '', 34, 0, 0, 0, 1, '2010-11-07 11:14:38', '2011-04-22 01:16:13'),
(52, '', 34, 0, 0, 0, 1, '2010-11-07 11:16:09', '2011-04-22 01:54:57'),
(53, '', 34, 0, 0, 0, 1, '2010-11-07 11:28:53', '2011-04-22 01:14:36'),
(54, '', 34, 0, 0, 0, 1, '2010-11-07 11:29:16', '2011-04-22 01:16:50'),
(55, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:32', '2010-11-08 10:31:32'),
(56, '', 34, 0, 0, 0, 1, '2010-11-08 10:31:50', '2011-04-22 01:16:37'),
(57, '', 0, 1, 1, 3, 1, '2011-04-26 08:53:16', '2011-05-30 12:15:05'),
(58, '', 52, 0, 0, 0, 1, '2011-05-08 13:44:16', '2011-05-08 13:44:16'),
(59, 'catalog/i.webp', 25, 0, 1, 0, 1, '2024-12-25 09:26:56', '2024-12-25 09:28:25'),
(60, 'catalog/6043244004.jpg', 25, 0, 1, 0, 1, '2024-12-25 11:37:52', '2024-12-25 11:37:52'),
(61, 'catalog/20201017154319-7233377-2.jpg', 25, 0, 1, 0, 1, '2024-12-25 11:39:23', '2024-12-25 11:39:23');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_description`
--

CREATE TABLE `oc_category_description` (
  `category_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_category_description`
--

INSERT INTO `oc_category_description` (`category_id`, `language_id`, `name`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(17, 1, 'Софт', '', 'Софт', '', ''),
(18, 1, 'Ноутбуки', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'Ноутбуки', '', ''),
(20, 1, 'Компьютеры', '&lt;p&gt;\r\n	Example of category description text&lt;/p&gt;\r\n', 'Компьютеры', 'Example of category description', ''),
(24, 1, 'Телефоны', '', 'Телефоны', '', ''),
(25, 1, 'Комплектующие', '', 'Комплектующие', '', ''),
(26, 1, 'PC', '', 'PC', '', ''),
(27, 1, 'Mac', '', 'Mac', '', ''),
(28, 1, 'Мониторы', '', 'Мониторы', '', ''),
(29, 1, 'Манипуляторы мышь', '', 'Манипуляторы мышь', '', ''),
(30, 1, 'Принтеры', '', 'Принтеры', '', ''),
(31, 1, 'Сканеры', '', 'Сканеры', '', ''),
(32, 1, 'Веб камеры', '', 'Веб камеры', '', ''),
(33, 1, 'Камеры', '', 'Камеры', '', ''),
(34, 1, 'MP3 плееры', '&lt;p&gt;\r\n	Shop Laptop feature only the best laptop deals on the market. By comparing laptop deals from the likes of PC World, Comet, Dixons, The Link and Carphone Warehouse, Shop Laptop has the most comprehensive selection of laptops on the internet. At Shop Laptop, we pride ourselves on offering customers the very best laptop deals. From refurbished laptops to netbooks, Shop Laptop ensures that every laptop - in every colour, style, size and technical spec - is featured on the site at the lowest possible price.&lt;/p&gt;\r\n', 'MP3 плееры', '', ''),
(35, 1, 'test 1', '', 'test 1', '', ''),
(36, 1, 'test 2', '', 'test 2', '', ''),
(37, 1, 'test 5', '', 'test 5', '', ''),
(38, 1, 'test 4', '', 'test 4', '', ''),
(39, 1, 'test 6', '', 'test 6', '', ''),
(40, 1, 'test 7', '', 'test 7', '', ''),
(41, 1, 'test 8', '', 'test 8', '', ''),
(42, 1, 'test 9', '', 'test 9', '', ''),
(43, 1, 'test 11', '', 'test 11', '', ''),
(44, 1, 'test 12', '', 'test 12', '', ''),
(45, 1, 'Windows', '', 'Windows', '', ''),
(46, 1, 'Macs', '', 'Macs', '', ''),
(47, 1, 'test 15', '', 'test 15', '', ''),
(48, 1, 'test 16', '', 'test 16', '', ''),
(49, 1, 'test 17', '', 'test 17', '', ''),
(50, 1, 'test 18', '', 'test 18', '', ''),
(51, 1, 'test 19', '', 'test 19', '', ''),
(52, 1, 'test 20', '', 'test 20', '', ''),
(53, 1, 'test 21', '', 'test 21', '', ''),
(54, 1, 'test 22', '', 'test 22', '', ''),
(55, 1, 'test 23', '', 'test 23', '', ''),
(56, 1, 'test 24', '', 'test 24', '', ''),
(57, 1, 'Планшеты', '', 'Планшеты', '', ''),
(58, 1, 'test 25', '', 'test 25', '', ''),
(59, 1, 'Процессоры', '&lt;p&gt;ЦП отвечают за все вычислительные операции в персональном компьютере&lt;/p&gt;', 'ЦП', 'Центральный Процессор', 'процессор'),
(60, 1, 'Видеокарты', '', 'Видеокарты', '', ''),
(61, 1, 'Материснкие платы', '', 'Motherblode', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_filter`
--

CREATE TABLE `oc_category_filter` (
  `category_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_path`
--

CREATE TABLE `oc_category_path` (
  `category_id` int(11) NOT NULL,
  `path_id` int(11) NOT NULL,
  `level` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_category_path`
--

INSERT INTO `oc_category_path` (`category_id`, `path_id`, `level`) VALUES
(17, 17, 0),
(18, 18, 0),
(20, 20, 0),
(24, 24, 0),
(25, 25, 0),
(26, 20, 0),
(26, 26, 1),
(27, 20, 0),
(27, 27, 1),
(28, 25, 0),
(28, 28, 1),
(29, 25, 0),
(29, 29, 1),
(30, 25, 0),
(30, 30, 1),
(31, 25, 0),
(31, 31, 1),
(32, 25, 0),
(32, 32, 1),
(33, 33, 0),
(34, 34, 0),
(35, 25, 0),
(35, 28, 1),
(35, 35, 2),
(36, 25, 0),
(36, 28, 1),
(36, 36, 2),
(37, 34, 0),
(37, 37, 1),
(38, 34, 0),
(38, 38, 1),
(39, 34, 0),
(39, 39, 1),
(40, 34, 0),
(40, 40, 1),
(41, 34, 0),
(41, 41, 1),
(42, 34, 0),
(42, 42, 1),
(43, 34, 0),
(43, 43, 1),
(44, 34, 0),
(44, 44, 1),
(45, 18, 0),
(45, 45, 1),
(46, 18, 0),
(46, 46, 1),
(47, 34, 0),
(47, 47, 1),
(48, 34, 0),
(48, 48, 1),
(49, 34, 0),
(49, 49, 1),
(50, 34, 0),
(50, 50, 1),
(51, 34, 0),
(51, 51, 1),
(52, 34, 0),
(52, 52, 1),
(53, 34, 0),
(53, 53, 1),
(54, 34, 0),
(54, 54, 1),
(55, 34, 0),
(55, 55, 1),
(56, 34, 0),
(56, 56, 1),
(57, 57, 0),
(58, 34, 0),
(58, 52, 1),
(58, 58, 2),
(59, 25, 0),
(59, 59, 1),
(60, 25, 0),
(60, 60, 1),
(61, 25, 0),
(61, 61, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_layout`
--

CREATE TABLE `oc_category_to_layout` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_category_to_layout`
--

INSERT INTO `oc_category_to_layout` (`category_id`, `store_id`, `layout_id`) VALUES
(59, 0, 0),
(60, 0, 0),
(61, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_category_to_store`
--

CREATE TABLE `oc_category_to_store` (
  `category_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_category_to_store`
--

INSERT INTO `oc_category_to_store` (`category_id`, `store_id`) VALUES
(17, 0),
(18, 0),
(20, 0),
(24, 0),
(25, 0),
(26, 0),
(27, 0),
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(37, 0),
(38, 0),
(39, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0),
(60, 0),
(61, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_country`
--

CREATE TABLE `oc_country` (
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `iso_code_2` varchar(2) NOT NULL,
  `iso_code_3` varchar(3) NOT NULL,
  `address_format_id` int(11) NOT NULL,
  `postcode_required` tinyint(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_country`
--

INSERT INTO `oc_country` (`country_id`, `name`, `iso_code_2`, `iso_code_3`, `address_format_id`, `postcode_required`, `status`) VALUES
(11, 'Армения', 'AM', 'ARM', 1, 0, 1),
(15, 'Азербайджан', 'AZ', 'AZE', 1, 0, 1),
(20, 'Белоруссия (Беларусь)', 'BY', 'BLR', 1, 0, 1),
(80, 'Грузия', 'GE', 'GEO', 1, 0, 1),
(109, 'Казахстан', 'KZ', 'KAZ', 1, 0, 1),
(115, 'Киргизия (Кыргызстан)', 'KG', 'KGZ', 1, 0, 1),
(176, 'Российская Федерация', 'RU', 'RUS', 1, 0, 1),
(220, 'Украина', 'UA', 'UKR', 1, 0, 1),
(226, 'Узбекистан', 'UZ', 'UZB', 1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon`
--

CREATE TABLE `oc_coupon` (
  `coupon_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(20) NOT NULL,
  `type` char(1) NOT NULL,
  `discount` decimal(15,4) NOT NULL,
  `logged` tinyint(1) NOT NULL,
  `shipping` tinyint(1) NOT NULL,
  `total` decimal(15,4) NOT NULL,
  `date_start` date NOT NULL,
  `date_end` date NOT NULL,
  `uses_total` int(11) NOT NULL,
  `uses_customer` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_coupon`
--

INSERT INTO `oc_coupon` (`coupon_id`, `name`, `code`, `type`, `discount`, `logged`, `shipping`, `total`, `date_start`, `date_end`, `uses_total`, `uses_customer`, `status`, `date_added`) VALUES
(4, '-10% Discount', '2222', 'P', 10.0000, 0, 0, 0.0000, '2014-01-01', '2020-01-01', 10, 10, 0, '2009-01-27 13:55:03'),
(5, 'Free Shipping', '3333', 'P', 0.0000, 0, 1, 100.0000, '2014-01-01', '2014-02-01', 10, 10, 0, '2009-03-14 21:13:53'),
(6, '-10.00 Discount', '1111', 'F', 10.0000, 0, 0, 10.0000, '2014-01-01', '2020-01-01', 100000, 10000, 0, '2009-03-14 21:15:18');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_category`
--

CREATE TABLE `oc_coupon_category` (
  `coupon_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_history`
--

CREATE TABLE `oc_coupon_history` (
  `coupon_history_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_coupon_product`
--

CREATE TABLE `oc_coupon_product` (
  `coupon_product_id` int(11) NOT NULL,
  `coupon_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_cron`
--

CREATE TABLE `oc_cron` (
  `cron_id` int(11) NOT NULL,
  `code` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `cycle` varchar(12) NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_cron`
--

INSERT INTO `oc_cron` (`cron_id`, `code`, `description`, `cycle`, `action`, `status`, `date_added`, `date_modified`) VALUES
(1, 'currency', '', 'day', 'cron/currency', 1, '2014-09-25 14:40:00', '2014-09-25 14:40:00'),
(2, 'gdpr', '', 'day', 'cron/gdpr', 1, '2014-09-25 14:40:00', '2014-09-25 14:40:00'),
(3, 'subscription', '', 'day', 'cron/subscription', 0, '2014-09-25 14:40:00', '2014-09-25 14:40:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_currency`
--

CREATE TABLE `oc_currency` (
  `currency_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `code` varchar(3) NOT NULL,
  `symbol_left` varchar(12) NOT NULL,
  `symbol_right` varchar(12) NOT NULL,
  `decimal_place` int(1) NOT NULL,
  `value` double(15,8) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_currency`
--

INSERT INTO `oc_currency` (`currency_id`, `title`, `code`, `symbol_left`, `symbol_right`, `decimal_place`, `value`, `status`, `date_modified`) VALUES
(1, 'Рубль', 'RUB', '', '₽', 0, 1.00000000, 1, '2022-05-24 12:00:00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer`
--

CREATE TABLE `oc_customer` (
  `customer_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `language_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `password` varchar(255) NOT NULL,
  `custom_field` text NOT NULL,
  `newsletter` tinyint(1) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `safe` tinyint(1) NOT NULL,
  `token` text NOT NULL,
  `code` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_activity`
--

CREATE TABLE `oc_customer_activity` (
  `customer_activity_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `data` text NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_affiliate`
--

CREATE TABLE `oc_customer_affiliate` (
  `customer_id` int(11) NOT NULL,
  `company` varchar(60) NOT NULL,
  `website` varchar(255) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `balance` decimal(15,4) NOT NULL,
  `commission` decimal(4,2) NOT NULL DEFAULT '0.00',
  `tax` varchar(64) NOT NULL,
  `payment_method` varchar(6) NOT NULL,
  `cheque` varchar(100) NOT NULL,
  `paypal` varchar(64) NOT NULL,
  `bank_name` varchar(64) NOT NULL,
  `bank_branch_number` varchar(64) NOT NULL,
  `bank_swift_code` varchar(64) NOT NULL,
  `bank_account_name` varchar(64) NOT NULL,
  `bank_account_number` varchar(64) NOT NULL,
  `custom_field` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_affiliate_report`
--

CREATE TABLE `oc_customer_affiliate_report` (
  `customer_affiliate_report_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_approval`
--

CREATE TABLE `oc_customer_approval` (
  `customer_approval_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `type` varchar(9) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group`
--

CREATE TABLE `oc_customer_group` (
  `customer_group_id` int(11) NOT NULL,
  `approval` int(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_customer_group`
--

INSERT INTO `oc_customer_group` (`customer_group_id`, `approval`, `sort_order`) VALUES
(1, 0, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_group_description`
--

CREATE TABLE `oc_customer_group_description` (
  `customer_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_customer_group_description`
--

INSERT INTO `oc_customer_group_description` (`customer_group_id`, `language_id`, `name`, `description`) VALUES
(1, 1, 'Default', 'test');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_history`
--

CREATE TABLE `oc_customer_history` (
  `customer_history_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_ip`
--

CREATE TABLE `oc_customer_ip` (
  `customer_ip_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_login`
--

CREATE TABLE `oc_customer_login` (
  `customer_login_id` int(11) NOT NULL,
  `email` varchar(96) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `total` int(4) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_online`
--

CREATE TABLE `oc_customer_online` (
  `ip` varchar(40) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `url` text NOT NULL,
  `referer` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_reward`
--

CREATE TABLE `oc_customer_reward` (
  `customer_reward_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `description` text NOT NULL,
  `points` int(8) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_search`
--

CREATE TABLE `oc_customer_search` (
  `customer_search_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `keyword` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `sub_category` tinyint(1) NOT NULL,
  `description` tinyint(1) NOT NULL,
  `products` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_transaction`
--

CREATE TABLE `oc_customer_transaction` (
  `customer_transaction_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `description` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_customer_wishlist`
--

CREATE TABLE `oc_customer_wishlist` (
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field`
--

CREATE TABLE `oc_custom_field` (
  `custom_field_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `value` text NOT NULL,
  `validation` varchar(255) NOT NULL,
  `location` varchar(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_custom_field`
--

INSERT INTO `oc_custom_field` (`custom_field_id`, `type`, `value`, `validation`, `location`, `status`, `sort_order`) VALUES
(1, 'select', '', '', 'account', 0, 1),
(2, 'radio', '', '', 'account', 0, 2),
(3, 'checkbox', '', '', 'account', 0, 3),
(4, 'text', '', '', 'account', 0, 4),
(5, 'textarea', '', '', 'account', 0, 5),
(6, 'file', '', '', 'account', 0, 6),
(7, 'date', '', '', 'account', 0, 7),
(8, 'time', '', '', 'account', 0, 8),
(9, 'datetime', '', '', 'account', 0, 9),
(11, 'checkbox', '', '', 'address', 0, 3),
(12, 'time', '', '', 'address', 0, 8),
(13, 'date', '', '', 'address', 0, 7),
(14, 'datetime', '', '', 'address', 0, 9),
(15, 'file', '', '', 'address', 0, 6),
(16, 'radio', '', '', 'address', 0, 2),
(17, 'select', '', '', 'address', 0, 1),
(18, 'text', '', '', 'address', 0, 4),
(19, 'textarea', '', '', 'address', 0, 5),
(20, 'checkbox', '', '', 'affiliate', 0, 3),
(21, 'date', '', '', 'affiliate', 0, 8),
(22, 'datetime', '', '', 'affiliate', 0, 9),
(23, 'file', '', '', 'affiliate', 0, 6),
(24, 'radio', '', '', 'affiliate', 0, 2),
(25, 'select', '', '', 'affiliate', 0, 1),
(26, 'text', '', '', 'affiliate', 0, 4),
(27, 'textarea', '', '', 'affiliate', 0, 5),
(28, 'time', '', '', 'affiliate', 0, 8);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_customer_group`
--

CREATE TABLE `oc_custom_field_customer_group` (
  `custom_field_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_custom_field_customer_group`
--

INSERT INTO `oc_custom_field_customer_group` (`custom_field_id`, `customer_group_id`, `required`) VALUES
(1, 1, 1),
(2, 1, 1),
(3, 1, 1),
(4, 1, 1),
(5, 1, 1),
(6, 1, 1),
(7, 1, 1),
(8, 1, 1),
(9, 1, 1),
(11, 1, 1),
(12, 1, 1),
(13, 1, 1),
(14, 1, 1),
(15, 1, 1),
(16, 1, 1),
(17, 1, 1),
(18, 1, 1),
(19, 1, 1),
(20, 1, 1),
(21, 1, 1),
(22, 1, 1),
(23, 1, 1),
(24, 1, 1),
(25, 1, 1),
(26, 1, 1),
(27, 1, 1),
(28, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_description`
--

CREATE TABLE `oc_custom_field_description` (
  `custom_field_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_custom_field_description`
--

INSERT INTO `oc_custom_field_description` (`custom_field_id`, `language_id`, `name`) VALUES
(1, 1, 'Select'),
(2, 1, 'Radio'),
(3, 1, 'Checkbox'),
(4, 1, 'Text'),
(5, 1, 'Textarea'),
(6, 1, 'File'),
(7, 1, 'Date'),
(8, 1, 'Time'),
(9, 1, 'Date &amp; Time'),
(11, 1, 'Checkbox'),
(12, 1, 'Time'),
(13, 1, 'Date'),
(14, 1, 'Date &amp; Time'),
(15, 1, 'File'),
(16, 1, 'Radio'),
(17, 1, 'Select'),
(18, 1, 'Text'),
(19, 1, 'Textarea'),
(20, 1, 'Checkbox'),
(21, 1, 'Date'),
(22, 1, 'Date &amp; Time'),
(23, 1, 'File'),
(24, 1, 'Radio'),
(25, 1, 'Select'),
(26, 1, 'Text'),
(27, 1, 'Textarea'),
(28, 1, 'Time');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value`
--

CREATE TABLE `oc_custom_field_value` (
  `custom_field_value_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_custom_field_value`
--

INSERT INTO `oc_custom_field_value` (`custom_field_value_id`, `custom_field_id`, `sort_order`) VALUES
(1, 1, 1),
(2, 1, 2),
(3, 1, 3),
(4, 2, 1),
(5, 2, 2),
(6, 2, 3),
(7, 3, 1),
(8, 3, 2),
(9, 3, 3),
(20, 11, 1),
(21, 11, 2),
(22, 11, 3),
(32, 16, 1),
(33, 16, 2),
(34, 16, 3),
(35, 17, 1),
(36, 17, 2),
(37, 17, 3),
(38, 20, 1),
(39, 20, 2),
(40, 20, 3),
(41, 24, 1),
(42, 24, 2),
(43, 24, 3),
(44, 25, 0),
(45, 25, 0),
(46, 25, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_custom_field_value_description`
--

CREATE TABLE `oc_custom_field_value_description` (
  `custom_field_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `custom_field_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_custom_field_value_description`
--

INSERT INTO `oc_custom_field_value_description` (`custom_field_value_id`, `language_id`, `custom_field_id`, `name`) VALUES
(1, 1, 1, 'Test 1'),
(2, 1, 1, 'test 2'),
(3, 1, 1, 'Test 3'),
(4, 1, 2, 'Test 1'),
(5, 1, 2, 'Test 2'),
(6, 1, 2, 'Test 3'),
(7, 1, 3, 'Test 1'),
(8, 1, 3, 'Test 2'),
(9, 1, 3, 'Test 3'),
(20, 1, 11, 'Test 1'),
(21, 1, 11, 'Test 2'),
(22, 1, 11, 'Test 3'),
(32, 1, 16, 'Test 1'),
(33, 1, 16, 'Test 2'),
(34, 1, 16, 'Test 3'),
(35, 1, 17, 'Test 1'),
(36, 1, 17, 'Test 2'),
(37, 1, 17, 'Test 3'),
(38, 1, 20, 'Test 1'),
(39, 1, 20, 'Test 2'),
(40, 1, 20, 'Test 3'),
(41, 1, 24, 'Test 1'),
(42, 1, 24, 'Test 2'),
(43, 1, 24, 'Test 3'),
(44, 1, 25, 'Test 1'),
(45, 1, 25, 'Test 2'),
(46, 1, 25, 'Test 3');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download`
--

CREATE TABLE `oc_download` (
  `download_id` int(11) NOT NULL,
  `filename` varchar(160) NOT NULL,
  `mask` varchar(128) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download_description`
--

CREATE TABLE `oc_download_description` (
  `download_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_download_report`
--

CREATE TABLE `oc_download_report` (
  `download_report_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_event`
--

CREATE TABLE `oc_event` (
  `event_id` int(11) NOT NULL,
  `code` varchar(128) NOT NULL,
  `description` text NOT NULL,
  `trigger` text NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_event`
--

INSERT INTO `oc_event` (`event_id`, `code`, `description`, `trigger`, `action`, `status`, `sort_order`) VALUES
(1, 'activity_customer_add', '', 'catalog/model/account/customer/addCustomer/after', 'event/activity.addCustomer', 1, 1),
(2, 'activity_customer_edit', '', 'catalog/model/account/customer/editCustomer/after', 'event/activity.editCustomer', 1, 1),
(3, 'activity_customer_password', '', 'catalog/model/account/customer/editPassword/after', 'event/activity.editPassword', 1, 1),
(4, 'activity_customer_forgotten', '', 'catalog/model/account/customer/editCode/after', 'event/activity.forgotten', 1, 1),
(5, 'activity_customer_login', '', 'catalog/model/account/customer/deleteLoginAttempts/after', 'event/activity.login', 1, 1),
(6, 'activity_customer_transaction', '', 'catalog/model/account/customer/addTransaction/after', 'event/activity.addTransaction', 1, 1),
(7, 'activity_address_add', '', 'catalog/model/account/address/addAddress/after', 'event/activity.addAddress', 1, 1),
(8, 'activity_address_edit', '', 'catalog/model/account/address/editAddress/after', 'event/activity.editAddress', 1, 1),
(9, 'activity_address_delete', '', 'catalog/model/account/address/deleteAddress/after', 'event/activity.deleteAddress', 1, 1),
(10, 'activity_affiliate_add', '', 'catalog/model/account/affiliate/addAffiliate/after', 'event/activity.addAffiliate', 1, 1),
(11, 'activity_affiliate_edit', '', 'catalog/model/account/affiliate/editAffiliate/after', 'event/activity.editAffiliate', 1, 1),
(12, 'activity_order_add', '', 'catalog/model/checkout/order/addHistory/before', 'event/activity.addHistory', 1, 1),
(13, 'activity_return_add', '', 'catalog/model/account/returns/addReturn/after', 'event/activity.addReturn', 1, 1),
(14, 'mail_customer_transaction', '', 'catalog/model/account/customer/addTransaction/after', 'mail/transaction', 1, 1),
(15, 'mail_customer_forgotten', '', 'catalog/model/account/customer/editCode/after', 'mail/forgotten', 1, 1),
(16, 'mail_customer_add', '', 'catalog/model/account/customer/addCustomer/after', 'mail/register', 1, 1),
(17, 'mail_customer_alert', '', 'catalog/model/account/customer/addCustomer/after', 'mail/register.alert', 1, 1),
(18, 'mail_affiliate_add', '', 'catalog/model/account/affiliate/addAffiliate/after', 'mail/affiliate', 1, 1),
(19, 'mail_affiliate_alert', '', 'catalog/model/account/affiliate/addAffiliate/after', 'mail/affiliate.alert', 1, 1),
(20, 'mail_order_alert', '', 'catalog/model/checkout/order/addHistory/before', 'mail/order.alert', 1, 1),
(21, 'mail_order_add', '', 'catalog/model/checkout/order/addHistory/before', 'mail/order', 1, 1),
(22, 'mail_gdpr', '', 'catalog/model/account/gdpr/addGdpr/after', 'mail/gdpr', 1, 1),
(23, 'mail_gdpr_delete', '', 'catalog/model/account/gdpr/editStatus/after', 'mail/gdpr.remove', 1, 1),
(24, 'mail_voucher', '', 'catalog/model/checkout/order/addHistory/after', 'mail/voucher', 1, 1),
(25, 'mail_review', '', 'catalog/model/catalog/review/addReview/after', 'mail/review', 1, 1),
(26, 'mail_subscription', '', 'catalog/model/checkout/subscription/addSubscription/after', 'mail/subscription', 1, 1),
(27, 'statistics_review_add', '', 'catalog/model/catalog/review/addReview/after', 'event/statistics.addReview', 1, 1),
(28, 'statistics_return_add', '', 'catalog/model/account/returns/addReturn/after', 'event/statistics.addReturn', 1, 1),
(29, 'statistics_return_delete', '', 'admin/model/sale/returns/deleteReturn/after', 'event/statistics.deleteReturn', 1, 1),
(30, 'statistics_order_history', '', 'catalog/model/checkout/order/addHistory/before', 'event/statistics.addHistory', 1, 1),
(31, 'admin_currency_add', '', 'admin/model/localisation/currency/addCurrency/after', 'event/currency', 1, 1),
(32, 'admin_currency_edit', '', 'admin/model/localisation/currency/editCurrency/after', 'event/currency', 1, 1),
(33, 'admin_currency_setting', '', 'admin/model/setting/setting/editSetting/after', 'event/currency', 1, 1),
(34, 'admin_mail_gdpr', '', 'admin/model/customer/gdpr/editStatus/after', 'mail/gdpr', 1, 1),
(35, 'admin_mail_affiliate_approve', '', 'admin/model/customer/customer_approval/approveAffiliate/after', 'mail/affiliate.approve', 1, 1),
(36, 'admin_mail_affiliate_deny', '', 'admin/model/customer/customer_approval/denyAffiliate/after', 'mail/affiliate.deny', 1, 1),
(37, 'admin_mail_customer_approve', '', 'admin/model/customer/customer_approval/approveCustomer/after', 'mail/customer.approve', 1, 1),
(38, 'admin_mail_customer_deny', '', 'admin/model/customer/customer_approval/denyCustomer/after', 'mail/customer.deny', 1, 1),
(39, 'admin_mail_customer_transaction', '', 'admin/model/customer/customer/addTransaction/after', 'mail/transaction', 1, 1),
(40, 'admin_mail_reward', '', 'admin/model/customer/customer/addReward/after', 'mail/reward', 1, 1),
(41, 'admin_mail_return', '', 'admin/model/sale/returns/addHistory/after', 'mail/returns', 1, 1),
(42, 'admin_mail_user_forgotten', '', 'admin/model/user/user/editCode/after', 'mail/forgotten', 1, 1),
(43, 'admin_mail_user_authorize', '', 'admin/controller/common/authorize.send/after', 'mail/authorize', 1, 1),
(44, 'admin_mail_user_authorize_reset', '', 'admin/model/user/user/editCode/after', 'mail/authorize.reset', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension`
--

CREATE TABLE `oc_extension` (
  `extension_id` int(11) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `type` varchar(32) NOT NULL,
  `code` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_extension`
--

INSERT INTO `oc_extension` (`extension_id`, `extension`, `type`, `code`) VALUES
(1, 'opencart', 'payment', 'cod'),
(2, 'opencart', 'total', 'shipping'),
(3, 'opencart', 'total', 'sub_total'),
(4, 'opencart', 'total', 'tax'),
(5, 'opencart', 'total', 'total'),
(6, 'opencart', 'module', 'banner'),
(8, 'opencart', 'total', 'credit'),
(9, 'opencart', 'shipping', 'flat'),
(10, 'opencart', 'total', 'handling'),
(11, 'opencart', 'total', 'low_order_fee'),
(12, 'opencart', 'total', 'coupon'),
(13, 'opencart', 'module', 'category'),
(14, 'opencart', 'module', 'account'),
(15, 'opencart', 'total', 'reward'),
(16, 'opencart', 'total', 'voucher'),
(17, 'opencart', 'payment', 'free_checkout'),
(18, 'opencart', 'module', 'featured'),
(20, 'opencart', 'theme', 'basic'),
(21, 'opencart', 'dashboard', 'activity'),
(22, 'opencart', 'dashboard', 'sale'),
(23, 'opencart', 'dashboard', 'recent'),
(24, 'opencart', 'dashboard', 'order'),
(25, 'opencart', 'dashboard', 'online'),
(26, 'opencart', 'dashboard', 'map'),
(27, 'opencart', 'dashboard', 'customer'),
(28, 'opencart', 'dashboard', 'chart'),
(29, 'opencart', 'report', 'sale_coupon'),
(31, 'opencart', 'report', 'customer_search'),
(32, 'opencart', 'report', 'customer_transaction'),
(33, 'opencart', 'report', 'product_purchased'),
(34, 'opencart', 'report', 'product_viewed'),
(35, 'opencart', 'report', 'sale_return'),
(36, 'opencart', 'report', 'sale_order'),
(37, 'opencart', 'report', 'sale_shipping'),
(38, 'opencart', 'report', 'sale_tax'),
(39, 'opencart', 'report', 'customer_activity'),
(40, 'opencart', 'report', 'customer_order'),
(41, 'opencart', 'report', 'customer_reward'),
(43, 'opencart', 'report', 'marketing'),
(44, 'opencart', 'report', 'customer_subscription'),
(45, 'opencart', 'report', 'customer');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension_install`
--

CREATE TABLE `oc_extension_install` (
  `extension_install_id` int(11) NOT NULL,
  `extension_id` int(11) NOT NULL,
  `extension_download_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(255) NOT NULL,
  `version` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `link` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_extension_install`
--

INSERT INTO `oc_extension_install` (`extension_install_id`, `extension_id`, `extension_download_id`, `name`, `code`, `version`, `author`, `link`, `status`, `date_added`) VALUES
(1, 0, 0, 'OpenCart Default Extensions', 'opencart', '1.0', 'OpenCart Ltd', 'http://www.opencart.com', 1, '2020-08-29 15:35:39');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_extension_path`
--

CREATE TABLE `oc_extension_path` (
  `extension_path_id` int(11) NOT NULL,
  `extension_install_id` int(11) NOT NULL,
  `path` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_extension_path`
--

INSERT INTO `oc_extension_path` (`extension_path_id`, `extension_install_id`, `path`) VALUES
(1, 1, 'opencart'),
(2, 1, 'opencart/admin'),
(3, 1, 'opencart/admin/controller'),
(4, 1, 'opencart/admin/controller/analytics'),
(5, 1, 'opencart/admin/controller/analytics/index.html'),
(6, 1, 'opencart/admin/controller/captcha'),
(7, 1, 'opencart/admin/controller/captcha/basic.php'),
(8, 1, 'opencart/admin/controller/currency'),
(9, 1, 'opencart/admin/controller/currency/ecb.php'),
(10, 1, 'opencart/admin/controller/currency/fixer.php'),
(11, 1, 'opencart/admin/controller/dashboard'),
(12, 1, 'opencart/admin/controller/dashboard/activity.php'),
(13, 1, 'opencart/admin/controller/dashboard/chart.php'),
(14, 1, 'opencart/admin/controller/dashboard/customer.php'),
(15, 1, 'opencart/admin/controller/dashboard/map.php'),
(16, 1, 'opencart/admin/controller/dashboard/online.php'),
(17, 1, 'opencart/admin/controller/dashboard/order.php'),
(18, 1, 'opencart/admin/controller/dashboard/recent.php'),
(19, 1, 'opencart/admin/controller/dashboard/sale.php'),
(20, 1, 'opencart/admin/controller/feed'),
(21, 1, 'opencart/admin/controller/feed/index.html'),
(22, 1, 'opencart/admin/controller/fraud'),
(23, 1, 'opencart/admin/controller/fraud/ip.php'),
(24, 1, 'opencart/admin/controller/module'),
(25, 1, 'opencart/admin/controller/module/account.php'),
(26, 1, 'opencart/admin/controller/module/banner.php'),
(27, 1, 'opencart/admin/controller/module/bestseller.php'),
(28, 1, 'opencart/admin/controller/module/category.php'),
(29, 1, 'opencart/admin/controller/module/featured.php'),
(30, 1, 'opencart/admin/controller/module/filter.php'),
(31, 1, 'opencart/admin/controller/module/html.php'),
(32, 1, 'opencart/admin/controller/module/information.php'),
(33, 1, 'opencart/admin/controller/module/latest.php'),
(34, 1, 'opencart/admin/controller/module/special.php'),
(35, 1, 'opencart/admin/controller/module/store.php'),
(36, 1, 'opencart/admin/controller/payment'),
(37, 1, 'opencart/admin/controller/payment/bank_transfer.php'),
(38, 1, 'opencart/admin/controller/payment/cheque.php'),
(39, 1, 'opencart/admin/controller/payment/cod.php'),
(40, 1, 'opencart/admin/controller/payment/free_checkout.php'),
(41, 1, 'opencart/admin/controller/report'),
(42, 1, 'opencart/admin/controller/report/customer.php'),
(43, 1, 'opencart/admin/controller/report/customer_activity.php'),
(44, 1, 'opencart/admin/controller/report/customer_order.php'),
(45, 1, 'opencart/admin/controller/report/customer_reward.php'),
(46, 1, 'opencart/admin/controller/report/customer_search.php'),
(47, 1, 'opencart/admin/controller/report/customer_subscription.php'),
(48, 1, 'opencart/admin/controller/report/customer_transaction.php'),
(49, 1, 'opencart/admin/controller/report/marketing.php'),
(50, 1, 'opencart/admin/controller/report/product_purchased.php'),
(51, 1, 'opencart/admin/controller/report/product_viewed.php'),
(52, 1, 'opencart/admin/controller/report/sale_coupon.php'),
(53, 1, 'opencart/admin/controller/report/sale_order.php'),
(54, 1, 'opencart/admin/controller/report/sale_return.php'),
(55, 1, 'opencart/admin/controller/report/sale_shipping.php'),
(56, 1, 'opencart/admin/controller/report/sale_tax.php'),
(57, 1, 'opencart/admin/controller/shipping'),
(58, 1, 'opencart/admin/controller/shipping/flat.php'),
(59, 1, 'opencart/admin/controller/shipping/free.php'),
(60, 1, 'opencart/admin/controller/shipping/item.php'),
(61, 1, 'opencart/admin/controller/shipping/pickup.php'),
(62, 1, 'opencart/admin/controller/shipping/weight.php'),
(63, 1, 'opencart/admin/controller/theme'),
(64, 1, 'opencart/admin/controller/theme/basic.php'),
(65, 1, 'opencart/admin/controller/total'),
(66, 1, 'opencart/admin/controller/total/coupon.php'),
(67, 1, 'opencart/admin/controller/total/credit.php'),
(68, 1, 'opencart/admin/controller/total/handling.php'),
(69, 1, 'opencart/admin/controller/total/low_order_fee.php'),
(70, 1, 'opencart/admin/controller/total/reward.php'),
(71, 1, 'opencart/admin/controller/total/shipping.php'),
(72, 1, 'opencart/admin/controller/total/sub_total.php'),
(73, 1, 'opencart/admin/controller/total/tax.php'),
(74, 1, 'opencart/admin/controller/total/total.php'),
(75, 1, 'opencart/admin/controller/total/voucher.php'),
(76, 1, 'opencart/admin/language'),
(77, 1, 'opencart/admin/language/en-gb'),
(78, 1, 'opencart/admin/language/en-gb/captcha'),
(79, 1, 'opencart/admin/language/en-gb/captcha/basic.php'),
(80, 1, 'opencart/admin/language/en-gb/currency'),
(81, 1, 'opencart/admin/language/en-gb/currency/ecb.php'),
(82, 1, 'opencart/admin/language/en-gb/currency/fixer.php'),
(83, 1, 'opencart/admin/language/en-gb/dashboard'),
(84, 1, 'opencart/admin/language/en-gb/dashboard/activity.php'),
(85, 1, 'opencart/admin/language/en-gb/dashboard/chart.php'),
(86, 1, 'opencart/admin/language/en-gb/dashboard/customer.php'),
(87, 1, 'opencart/admin/language/en-gb/dashboard/map.php'),
(88, 1, 'opencart/admin/language/en-gb/dashboard/online.php'),
(89, 1, 'opencart/admin/language/en-gb/dashboard/order.php'),
(90, 1, 'opencart/admin/language/en-gb/dashboard/recent.php'),
(91, 1, 'opencart/admin/language/en-gb/dashboard/sale.php'),
(92, 1, 'opencart/admin/language/en-gb/fraud'),
(93, 1, 'opencart/admin/language/en-gb/fraud/ip.php'),
(94, 1, 'opencart/admin/language/en-gb/module'),
(95, 1, 'opencart/admin/language/en-gb/module/account.php'),
(96, 1, 'opencart/admin/language/en-gb/module/banner.php'),
(97, 1, 'opencart/admin/language/en-gb/module/bestseller.php'),
(98, 1, 'opencart/admin/language/en-gb/module/category.php'),
(99, 1, 'opencart/admin/language/en-gb/module/featured.php'),
(100, 1, 'opencart/admin/language/en-gb/module/filter.php'),
(101, 1, 'opencart/admin/language/en-gb/module/html.php'),
(102, 1, 'opencart/admin/language/en-gb/module/information.php'),
(103, 1, 'opencart/admin/language/en-gb/module/latest.php'),
(104, 1, 'opencart/admin/language/en-gb/module/special.php'),
(105, 1, 'opencart/admin/language/en-gb/module/store.php'),
(106, 1, 'opencart/admin/language/en-gb/payment'),
(107, 1, 'opencart/admin/language/en-gb/payment/bank_transfer.php'),
(108, 1, 'opencart/admin/language/en-gb/payment/cheque.php'),
(109, 1, 'opencart/admin/language/en-gb/payment/cod.php'),
(110, 1, 'opencart/admin/language/en-gb/payment/free_checkout.php'),
(111, 1, 'opencart/admin/language/en-gb/report'),
(112, 1, 'opencart/admin/language/en-gb/report/customer.php'),
(113, 1, 'opencart/admin/language/en-gb/report/customer_activity.php'),
(114, 1, 'opencart/admin/language/en-gb/report/customer_order.php'),
(115, 1, 'opencart/admin/language/en-gb/report/customer_reward.php'),
(116, 1, 'opencart/admin/language/en-gb/report/customer_search.php'),
(117, 1, 'opencart/admin/language/en-gb/report/customer_subscription.php'),
(118, 1, 'opencart/admin/language/en-gb/report/customer_transaction.php'),
(119, 1, 'opencart/admin/language/en-gb/report/marketing.php'),
(120, 1, 'opencart/admin/language/en-gb/report/product_purchased.php'),
(121, 1, 'opencart/admin/language/en-gb/report/product_viewed.php'),
(122, 1, 'opencart/admin/language/en-gb/report/sale_coupon.php'),
(123, 1, 'opencart/admin/language/en-gb/report/sale_order.php'),
(124, 1, 'opencart/admin/language/en-gb/report/sale_return.php'),
(125, 1, 'opencart/admin/language/en-gb/report/sale_shipping.php'),
(126, 1, 'opencart/admin/language/en-gb/report/sale_tax.php'),
(127, 1, 'opencart/admin/language/en-gb/shipping'),
(128, 1, 'opencart/admin/language/en-gb/shipping/flat.php'),
(129, 1, 'opencart/admin/language/en-gb/shipping/free.php'),
(130, 1, 'opencart/admin/language/en-gb/shipping/item.php'),
(131, 1, 'opencart/admin/language/en-gb/shipping/pickup.php'),
(132, 1, 'opencart/admin/language/en-gb/shipping/weight.php'),
(133, 1, 'opencart/admin/language/en-gb/theme'),
(134, 1, 'opencart/admin/language/en-gb/theme/basic.php'),
(135, 1, 'opencart/admin/language/en-gb/total'),
(136, 1, 'opencart/admin/language/en-gb/total/coupon.php'),
(137, 1, 'opencart/admin/language/en-gb/total/credit.php'),
(138, 1, 'opencart/admin/language/en-gb/total/handling.php'),
(139, 1, 'opencart/admin/language/en-gb/total/low_order_fee.php'),
(140, 1, 'opencart/admin/language/en-gb/total/reward.php'),
(141, 1, 'opencart/admin/language/en-gb/total/shipping.php'),
(142, 1, 'opencart/admin/language/en-gb/total/sub_total.php'),
(143, 1, 'opencart/admin/language/en-gb/total/tax.php'),
(144, 1, 'opencart/admin/language/en-gb/total/total.php'),
(145, 1, 'opencart/admin/language/en-gb/total/voucher.php'),
(146, 1, 'opencart/admin/language/ru-ru'),
(147, 1, 'opencart/admin/language/ru-ru/captcha'),
(148, 1, 'opencart/admin/language/ru-ru/captcha/basic.php'),
(149, 1, 'opencart/admin/language/ru-ru/currency'),
(150, 1, 'opencart/admin/language/ru-ru/currency/ecb.php'),
(151, 1, 'opencart/admin/language/ru-ru/currency/fixer.php'),
(152, 1, 'opencart/admin/language/ru-ru/dashboard'),
(153, 1, 'opencart/admin/language/ru-ru/dashboard/activity.php'),
(154, 1, 'opencart/admin/language/ru-ru/dashboard/chart.php'),
(155, 1, 'opencart/admin/language/ru-ru/dashboard/customer.php'),
(156, 1, 'opencart/admin/language/ru-ru/dashboard/map.php'),
(157, 1, 'opencart/admin/language/ru-ru/dashboard/online.php'),
(158, 1, 'opencart/admin/language/ru-ru/dashboard/order.php'),
(159, 1, 'opencart/admin/language/ru-ru/dashboard/recent.php'),
(160, 1, 'opencart/admin/language/ru-ru/dashboard/sale.php'),
(161, 1, 'opencart/admin/language/ru-ru/fraud'),
(162, 1, 'opencart/admin/language/ru-ru/fraud/ip.php'),
(163, 1, 'opencart/admin/language/ru-ru/module'),
(164, 1, 'opencart/admin/language/ru-ru/module/account.php'),
(165, 1, 'opencart/admin/language/ru-ru/module/banner.php'),
(166, 1, 'opencart/admin/language/ru-ru/module/bestseller.php'),
(167, 1, 'opencart/admin/language/ru-ru/module/category.php'),
(168, 1, 'opencart/admin/language/ru-ru/module/featured.php'),
(169, 1, 'opencart/admin/language/ru-ru/module/filter.php'),
(170, 1, 'opencart/admin/language/ru-ru/module/html.php'),
(171, 1, 'opencart/admin/language/ru-ru/module/information.php'),
(172, 1, 'opencart/admin/language/ru-ru/module/latest.php'),
(173, 1, 'opencart/admin/language/ru-ru/module/special.php'),
(174, 1, 'opencart/admin/language/ru-ru/module/store.php'),
(175, 1, 'opencart/admin/language/ru-ru/payment'),
(176, 1, 'opencart/admin/language/ru-ru/payment/bank_transfer.php'),
(177, 1, 'opencart/admin/language/ru-ru/payment/cheque.php'),
(178, 1, 'opencart/admin/language/ru-ru/payment/cod.php'),
(179, 1, 'opencart/admin/language/ru-ru/payment/free_checkout.php'),
(180, 1, 'opencart/admin/language/ru-ru/report'),
(181, 1, 'opencart/admin/language/ru-ru/report/customer.php'),
(182, 1, 'opencart/admin/language/ru-ru/report/customer_activity.php'),
(183, 1, 'opencart/admin/language/ru-ru/report/customer_order.php'),
(184, 1, 'opencart/admin/language/ru-ru/report/customer_reward.php'),
(185, 1, 'opencart/admin/language/ru-ru/report/customer_search.php'),
(186, 1, 'opencart/admin/language/ru-ru/report/customer_transaction.php'),
(187, 1, 'opencart/admin/language/ru-ru/report/customer_subscription.php'),
(188, 1, 'opencart/admin/language/ru-ru/report/marketing.php'),
(189, 1, 'opencart/admin/language/ru-ru/report/product_purchased.php'),
(190, 1, 'opencart/admin/language/ru-ru/report/product_viewed.php'),
(191, 1, 'opencart/admin/language/ru-ru/report/sale_coupon.php'),
(192, 1, 'opencart/admin/language/ru-ru/report/sale_order.php'),
(193, 1, 'opencart/admin/language/ru-ru/report/sale_return.php'),
(194, 1, 'opencart/admin/language/ru-ru/report/sale_shipping.php'),
(195, 1, 'opencart/admin/language/ru-ru/report/sale_tax.php'),
(196, 1, 'opencart/admin/language/ru-ru/shipping'),
(197, 1, 'opencart/admin/language/ru-ru/shipping/flat.php'),
(198, 1, 'opencart/admin/language/ru-ru/shipping/free.php'),
(199, 1, 'opencart/admin/language/ru-ru/shipping/item.php'),
(200, 1, 'opencart/admin/language/ru-ru/shipping/pickup.php'),
(201, 1, 'opencart/admin/language/ru-ru/shipping/weight.php'),
(202, 1, 'opencart/admin/language/ru-ru/theme'),
(203, 1, 'opencart/admin/language/ru-ru/theme/basic.php'),
(204, 1, 'opencart/admin/language/ru-ru/total'),
(205, 1, 'opencart/admin/language/ru-ru/total/coupon.php'),
(206, 1, 'opencart/admin/language/ru-ru/total/credit.php'),
(207, 1, 'opencart/admin/language/ru-ru/total/handling.php'),
(208, 1, 'opencart/admin/language/ru-ru/total/low_order_fee.php'),
(209, 1, 'opencart/admin/language/ru-ru/total/reward.php'),
(210, 1, 'opencart/admin/language/ru-ru/total/shipping.php'),
(211, 1, 'opencart/admin/language/ru-ru/total/sub_total.php'),
(212, 1, 'opencart/admin/language/ru-ru/total/tax.php'),
(213, 1, 'opencart/admin/language/ru-ru/total/total.php'),
(214, 1, 'opencart/admin/language/ru-ru/total/voucher.php'),
(215, 1, 'opencart/admin/model'),
(216, 1, 'opencart/admin/model/dashboard'),
(217, 1, 'opencart/admin/model/dashboard/map.php'),
(218, 1, 'opencart/admin/model/fraud'),
(219, 1, 'opencart/admin/model/fraud/ip.php'),
(220, 1, 'opencart/admin/model/module'),
(221, 1, 'opencart/admin/model/module/bestseller.php'),
(222, 1, 'opencart/admin/model/report'),
(223, 1, 'opencart/admin/model/report/activity.php'),
(224, 1, 'opencart/admin/model/report/coupon.php'),
(225, 1, 'opencart/admin/model/report/customer.php'),
(226, 1, 'opencart/admin/model/report/customer_subscription.php'),
(227, 1, 'opencart/admin/model/report/customer_transaction.php'),
(228, 1, 'opencart/admin/model/report/marketing.php'),
(229, 1, 'opencart/admin/model/report/product_purchased.php'),
(230, 1, 'opencart/admin/model/report/product_viewed.php'),
(231, 1, 'opencart/admin/model/report/returns.php'),
(232, 1, 'opencart/admin/model/report/sale.php'),
(233, 1, 'opencart/admin/view'),
(234, 1, 'opencart/admin/view/template'),
(235, 1, 'opencart/admin/view/image'),
(236, 1, 'opencart/admin/view/image/basic.png'),
(237, 1, 'opencart/admin/view/template/captcha'),
(238, 1, 'opencart/admin/view/template/captcha/basic.twig'),
(239, 1, 'opencart/admin/view/template/currency'),
(240, 1, 'opencart/admin/view/template/currency/ecb.twig'),
(241, 1, 'opencart/admin/view/template/currency/fixer.twig'),
(242, 1, 'opencart/admin/view/template/dashboard'),
(243, 1, 'opencart/admin/view/template/dashboard/activity_form.twig'),
(244, 1, 'opencart/admin/view/template/dashboard/activity_info.twig'),
(245, 1, 'opencart/admin/view/template/dashboard/chart_form.twig'),
(246, 1, 'opencart/admin/view/template/dashboard/chart_info.twig'),
(247, 1, 'opencart/admin/view/template/dashboard/customer_form.twig'),
(248, 1, 'opencart/admin/view/template/dashboard/customer_info.twig'),
(249, 1, 'opencart/admin/view/template/dashboard/map_form.twig'),
(250, 1, 'opencart/admin/view/template/dashboard/map_info.twig'),
(251, 1, 'opencart/admin/view/template/dashboard/online_form.twig'),
(252, 1, 'opencart/admin/view/template/dashboard/online_info.twig'),
(253, 1, 'opencart/admin/view/template/dashboard/order_form.twig'),
(254, 1, 'opencart/admin/view/template/dashboard/order_info.twig'),
(255, 1, 'opencart/admin/view/template/dashboard/recent_form.twig'),
(256, 1, 'opencart/admin/view/template/dashboard/recent_info.twig'),
(257, 1, 'opencart/admin/view/template/dashboard/sale_form.twig'),
(258, 1, 'opencart/admin/view/template/dashboard/sale_info.twig'),
(259, 1, 'opencart/admin/view/template/fraud'),
(260, 1, 'opencart/admin/view/template/fraud/ip.twig'),
(261, 1, 'opencart/admin/view/template/fraud/ip_ip.twig'),
(262, 1, 'opencart/admin/view/template/module'),
(263, 1, 'opencart/admin/view/template/module/account.twig'),
(264, 1, 'opencart/admin/view/template/module/banner.twig'),
(265, 1, 'opencart/admin/view/template/module/bestseller.twig'),
(266, 1, 'opencart/admin/view/template/module/bestseller_report.twig'),
(267, 1, 'opencart/admin/view/template/module/category.twig'),
(268, 1, 'opencart/admin/view/template/module/featured.twig'),
(269, 1, 'opencart/admin/view/template/module/filter.twig'),
(270, 1, 'opencart/admin/view/template/module/html.twig'),
(271, 1, 'opencart/admin/view/template/module/information.twig'),
(272, 1, 'opencart/admin/view/template/module/latest.twig'),
(273, 1, 'opencart/admin/view/template/module/special.twig'),
(274, 1, 'opencart/admin/view/template/module/store.twig'),
(275, 1, 'opencart/admin/view/template/payment'),
(276, 1, 'opencart/admin/view/template/payment/bank_transfer.twig'),
(277, 1, 'opencart/admin/view/template/payment/cheque.twig'),
(278, 1, 'opencart/admin/view/template/payment/cod.twig'),
(279, 1, 'opencart/admin/view/template/payment/free_checkout.twig'),
(280, 1, 'opencart/admin/view/template/report'),
(281, 1, 'opencart/admin/view/template/report/affiliate.twig'),
(282, 1, 'opencart/admin/view/template/report/affiliate_form.twig'),
(283, 1, 'opencart/admin/view/template/report/customer.twig'),
(284, 1, 'opencart/admin/view/template/report/customer_activity.twig'),
(285, 1, 'opencart/admin/view/template/report/customer_activity_form.twig'),
(286, 1, 'opencart/admin/view/template/report/customer_activity_list.twig'),
(287, 1, 'opencart/admin/view/template/report/customer_form.twig'),
(288, 1, 'opencart/admin/view/template/report/customer_list.twig'),
(289, 1, 'opencart/admin/view/template/report/customer_order.twig'),
(290, 1, 'opencart/admin/view/template/report/customer_order_form.twig'),
(291, 1, 'opencart/admin/view/template/report/customer_order_list.twig'),
(292, 1, 'opencart/admin/view/template/report/customer_reward.twig'),
(293, 1, 'opencart/admin/view/template/report/customer_reward_form.twig'),
(294, 1, 'opencart/admin/view/template/report/customer_reward_list.twig'),
(295, 1, 'opencart/admin/view/template/report/customer_search.twig'),
(296, 1, 'opencart/admin/view/template/report/customer_search_form.twig'),
(297, 1, 'opencart/admin/view/template/report/customer_search_list.twig'),
(298, 1, 'opencart/admin/view/template/report/customer_subscription.twig'),
(299, 1, 'opencart/admin/view/template/report/customer_subscription_form.twig'),
(300, 1, 'opencart/admin/view/template/report/customer_subscription_list.twig'),
(301, 1, 'opencart/admin/view/template/report/customer_transaction.twig'),
(302, 1, 'opencart/admin/view/template/report/customer_transaction_form.twig'),
(303, 1, 'opencart/admin/view/template/report/customer_transaction_list.twig'),
(304, 1, 'opencart/admin/view/template/report/marketing.twig'),
(305, 1, 'opencart/admin/view/template/report/marketing_form.twig'),
(306, 1, 'opencart/admin/view/template/report/marketing_list.twig'),
(307, 1, 'opencart/admin/view/template/report/product_purchased.twig'),
(308, 1, 'opencart/admin/view/template/report/product_purchased_form.twig'),
(309, 1, 'opencart/admin/view/template/report/product_purchased_list.twig'),
(310, 1, 'opencart/admin/view/template/report/product_viewed.twig'),
(311, 1, 'opencart/admin/view/template/report/product_viewed_form.twig'),
(312, 1, 'opencart/admin/view/template/report/product_viewed_list.twig'),
(313, 1, 'opencart/admin/view/template/report/sale_coupon.twig'),
(314, 1, 'opencart/admin/view/template/report/sale_coupon_form.twig'),
(315, 1, 'opencart/admin/view/template/report/sale_coupon_list.twig'),
(316, 1, 'opencart/admin/view/template/report/sale_order.twig'),
(317, 1, 'opencart/admin/view/template/report/sale_order_form.twig'),
(318, 1, 'opencart/admin/view/template/report/sale_order_list.twig'),
(319, 1, 'opencart/admin/view/template/report/sale_return.twig'),
(320, 1, 'opencart/admin/view/template/report/sale_return_form.twig'),
(321, 1, 'opencart/admin/view/template/report/sale_return_list.twig'),
(322, 1, 'opencart/admin/view/template/report/sale_shipping.twig'),
(323, 1, 'opencart/admin/view/template/report/sale_shipping_form.twig'),
(324, 1, 'opencart/admin/view/template/report/sale_shipping_list.twig'),
(325, 1, 'opencart/admin/view/template/report/sale_tax.twig'),
(326, 1, 'opencart/admin/view/template/report/sale_tax_form.twig'),
(327, 1, 'opencart/admin/view/template/report/sale_tax_list.twig'),
(328, 1, 'opencart/admin/view/template/shipping'),
(329, 1, 'opencart/admin/view/template/shipping/flat.twig'),
(330, 1, 'opencart/admin/view/template/shipping/free.twig'),
(331, 1, 'opencart/admin/view/template/shipping/item.twig'),
(332, 1, 'opencart/admin/view/template/shipping/pickup.twig'),
(333, 1, 'opencart/admin/view/template/shipping/weight.twig'),
(334, 1, 'opencart/admin/view/template/theme'),
(335, 1, 'opencart/admin/view/template/theme/basic.twig'),
(336, 1, 'opencart/admin/view/template/total'),
(337, 1, 'opencart/admin/view/template/total/coupon.twig'),
(338, 1, 'opencart/admin/view/template/total/credit.twig'),
(339, 1, 'opencart/admin/view/template/total/handling.twig'),
(340, 1, 'opencart/admin/view/template/total/low_order_fee.twig'),
(341, 1, 'opencart/admin/view/template/total/reward.twig'),
(342, 1, 'opencart/admin/view/template/total/shipping.twig'),
(343, 1, 'opencart/admin/view/template/total/sub_total.twig'),
(344, 1, 'opencart/admin/view/template/total/tax.twig'),
(345, 1, 'opencart/admin/view/template/total/total.twig'),
(346, 1, 'opencart/admin/view/template/total/voucher.twig'),
(347, 1, 'opencart/catalog'),
(348, 1, 'opencart/catalog/controller'),
(349, 1, 'opencart/catalog/controller/captcha'),
(350, 1, 'opencart/catalog/controller/captcha/basic.php'),
(351, 1, 'opencart/catalog/controller/currency'),
(352, 1, 'opencart/catalog/controller/currency/ecb.php'),
(353, 1, 'opencart/catalog/controller/currency/fixer.php'),
(354, 1, 'opencart/catalog/controller/module'),
(355, 1, 'opencart/catalog/controller/module/account.php'),
(356, 1, 'opencart/catalog/controller/module/banner.php'),
(357, 1, 'opencart/catalog/controller/module/bestseller.php'),
(358, 1, 'opencart/catalog/controller/module/category.php'),
(359, 1, 'opencart/catalog/controller/module/featured.php'),
(360, 1, 'opencart/catalog/controller/module/filter.php'),
(361, 1, 'opencart/catalog/controller/module/html.php'),
(362, 1, 'opencart/catalog/controller/module/information.php'),
(363, 1, 'opencart/catalog/controller/module/latest.php'),
(364, 1, 'opencart/catalog/controller/module/special.php'),
(365, 1, 'opencart/catalog/controller/module/store.php'),
(366, 1, 'opencart/catalog/controller/payment'),
(367, 1, 'opencart/catalog/controller/payment/bank_transfer.php'),
(368, 1, 'opencart/catalog/controller/payment/cheque.php'),
(369, 1, 'opencart/catalog/controller/payment/cod.php'),
(370, 1, 'opencart/catalog/controller/payment/free_checkout.php'),
(371, 1, 'opencart/catalog/controller/total'),
(372, 1, 'opencart/catalog/controller/total/coupon.php'),
(373, 1, 'opencart/catalog/controller/total/reward.php'),
(374, 1, 'opencart/catalog/controller/total/shipping.php'),
(375, 1, 'opencart/catalog/controller/total/voucher.php'),
(376, 1, 'opencart/catalog/language'),
(377, 1, 'opencart/catalog/language/en-gb'),
(378, 1, 'opencart/catalog/language/en-gb/captcha'),
(379, 1, 'opencart/catalog/language/en-gb/captcha/basic.php'),
(380, 1, 'opencart/catalog/language/en-gb/module'),
(381, 1, 'opencart/catalog/language/en-gb/module/account.php'),
(382, 1, 'opencart/catalog/language/en-gb/module/bestseller.php'),
(383, 1, 'opencart/catalog/language/en-gb/module/category.php'),
(384, 1, 'opencart/catalog/language/en-gb/module/featured.php'),
(385, 1, 'opencart/catalog/language/en-gb/module/filter.php'),
(386, 1, 'opencart/catalog/language/en-gb/module/information.php'),
(387, 1, 'opencart/catalog/language/en-gb/module/latest.php'),
(388, 1, 'opencart/catalog/language/en-gb/module/special.php'),
(389, 1, 'opencart/catalog/language/en-gb/module/store.php'),
(390, 1, 'opencart/catalog/language/en-gb/payment'),
(391, 1, 'opencart/catalog/language/en-gb/payment/bank_transfer.php'),
(392, 1, 'opencart/catalog/language/en-gb/payment/cheque.php'),
(393, 1, 'opencart/catalog/language/en-gb/payment/cod.php'),
(394, 1, 'opencart/catalog/language/en-gb/payment/free_checkout.php'),
(395, 1, 'opencart/catalog/language/en-gb/shipping'),
(396, 1, 'opencart/catalog/language/en-gb/shipping/flat.php'),
(397, 1, 'opencart/catalog/language/en-gb/shipping/free.php'),
(398, 1, 'opencart/catalog/language/en-gb/shipping/item.php'),
(399, 1, 'opencart/catalog/language/en-gb/shipping/pickup.php'),
(400, 1, 'opencart/catalog/language/en-gb/shipping/weight.php'),
(401, 1, 'opencart/catalog/language/en-gb/total'),
(402, 1, 'opencart/catalog/language/en-gb/total/coupon.php'),
(403, 1, 'opencart/catalog/language/en-gb/total/credit.php'),
(404, 1, 'opencart/catalog/language/en-gb/total/handling.php'),
(405, 1, 'opencart/catalog/language/en-gb/total/low_order_fee.php'),
(406, 1, 'opencart/catalog/language/en-gb/total/reward.php'),
(407, 1, 'opencart/catalog/language/en-gb/total/shipping.php'),
(408, 1, 'opencart/catalog/language/en-gb/total/sub_total.php'),
(409, 1, 'opencart/catalog/language/en-gb/total/total.php'),
(410, 1, 'opencart/catalog/language/en-gb/total/voucher.php'),
(411, 1, 'opencart/catalog/language/ru-ru'),
(412, 1, 'opencart/catalog/language/ru-ru/captcha'),
(413, 1, 'opencart/catalog/language/ru-ru/captcha/basic.php'),
(414, 1, 'opencart/catalog/language/ru-ru/module'),
(415, 1, 'opencart/catalog/language/ru-ru/module/account.php'),
(416, 1, 'opencart/catalog/language/ru-ru/module/bestseller.php'),
(417, 1, 'opencart/catalog/language/ru-ru/module/category.php'),
(418, 1, 'opencart/catalog/language/ru-ru/module/featured.php'),
(419, 1, 'opencart/catalog/language/ru-ru/module/filter.php'),
(420, 1, 'opencart/catalog/language/ru-ru/module/information.php'),
(421, 1, 'opencart/catalog/language/ru-ru/module/latest.php'),
(422, 1, 'opencart/catalog/language/ru-ru/module/special.php'),
(423, 1, 'opencart/catalog/language/ru-ru/module/store.php'),
(424, 1, 'opencart/catalog/language/ru-ru/payment'),
(425, 1, 'opencart/catalog/language/ru-ru/payment/bank_transfer.php'),
(426, 1, 'opencart/catalog/language/ru-ru/payment/cheque.php'),
(427, 1, 'opencart/catalog/language/ru-ru/payment/cod.php'),
(428, 1, 'opencart/catalog/language/ru-ru/payment/free_checkout.php'),
(429, 1, 'opencart/catalog/language/ru-ru/shipping'),
(430, 1, 'opencart/catalog/language/ru-ru/shipping/flat.php'),
(431, 1, 'opencart/catalog/language/ru-ru/shipping/free.php'),
(432, 1, 'opencart/catalog/language/ru-ru/shipping/item.php'),
(433, 1, 'opencart/catalog/language/ru-ru/shipping/pickup.php'),
(434, 1, 'opencart/catalog/language/ru-ru/shipping/weight.php'),
(435, 1, 'opencart/catalog/language/ru-ru/total'),
(436, 1, 'opencart/catalog/language/ru-ru/total/coupon.php'),
(437, 1, 'opencart/catalog/language/ru-ru/total/credit.php'),
(438, 1, 'opencart/catalog/language/ru-ru/total/handling.php'),
(439, 1, 'opencart/catalog/language/ru-ru/total/low_order_fee.php'),
(440, 1, 'opencart/catalog/language/ru-ru/total/reward.php'),
(441, 1, 'opencart/catalog/language/ru-ru/total/shipping.php'),
(442, 1, 'opencart/catalog/language/ru-ru/total/sub_total.php'),
(443, 1, 'opencart/catalog/language/ru-ru/total/total.php'),
(444, 1, 'opencart/catalog/language/ru-ru/total/voucher.php'),
(445, 1, 'opencart/catalog/model'),
(446, 1, 'opencart/catalog/model/fraud'),
(447, 1, 'opencart/catalog/model/fraud/ip.php'),
(448, 1, 'opencart/catalog/model/module'),
(449, 1, 'opencart/catalog/model/module/bestseller.php'),
(450, 1, 'opencart/catalog/model/module/latest.php'),
(451, 1, 'opencart/catalog/model/payment'),
(452, 1, 'opencart/catalog/model/payment/bank_transfer.php'),
(453, 1, 'opencart/catalog/model/payment/cheque.php'),
(454, 1, 'opencart/catalog/model/payment/cod.php'),
(455, 1, 'opencart/catalog/model/payment/free_checkout.php'),
(456, 1, 'opencart/catalog/model/shipping'),
(457, 1, 'opencart/catalog/model/shipping/flat.php'),
(458, 1, 'opencart/catalog/model/shipping/free.php'),
(459, 1, 'opencart/catalog/model/shipping/item.php'),
(460, 1, 'opencart/catalog/model/shipping/pickup.php'),
(461, 1, 'opencart/catalog/model/shipping/weight.php'),
(462, 1, 'opencart/catalog/model/total'),
(463, 1, 'opencart/catalog/model/total/coupon.php'),
(464, 1, 'opencart/catalog/model/total/credit.php'),
(465, 1, 'opencart/catalog/model/total/handling.php'),
(466, 1, 'opencart/catalog/model/total/low_order_fee.php'),
(467, 1, 'opencart/catalog/model/total/reward.php'),
(468, 1, 'opencart/catalog/model/total/shipping.php'),
(469, 1, 'opencart/catalog/model/total/sub_total.php'),
(470, 1, 'opencart/catalog/model/total/tax.php'),
(471, 1, 'opencart/catalog/model/total/total.php'),
(472, 1, 'opencart/catalog/model/total/voucher.php'),
(473, 1, 'opencart/catalog/view'),
(474, 1, 'opencart/catalog/view/template'),
(475, 1, 'opencart/catalog/view/template/captcha'),
(476, 1, 'opencart/catalog/view/template/captcha/basic.twig'),
(477, 1, 'opencart/catalog/view/template/module'),
(478, 1, 'opencart/catalog/view/template/module/account.twig'),
(479, 1, 'opencart/catalog/view/template/module/banner.twig'),
(480, 1, 'opencart/catalog/view/template/module/bestseller.twig'),
(481, 1, 'opencart/catalog/view/template/module/category.twig'),
(482, 1, 'opencart/catalog/view/template/module/featured.twig'),
(483, 1, 'opencart/catalog/view/template/module/filter.twig'),
(484, 1, 'opencart/catalog/view/template/module/html.twig'),
(485, 1, 'opencart/catalog/view/template/module/information.twig'),
(486, 1, 'opencart/catalog/view/template/module/latest.twig'),
(487, 1, 'opencart/catalog/view/template/module/special.twig'),
(488, 1, 'opencart/catalog/view/template/module/store.twig'),
(489, 1, 'opencart/catalog/view/template/payment'),
(490, 1, 'opencart/catalog/view/template/payment/bank_transfer.twig'),
(491, 1, 'opencart/catalog/view/template/payment/cheque.twig'),
(492, 1, 'opencart/catalog/view/template/payment/cod.twig'),
(493, 1, 'opencart/catalog/view/template/payment/free_checkout.twig'),
(494, 1, 'opencart/catalog/view/template/total'),
(495, 1, 'opencart/catalog/view/template/total/coupon.twig'),
(496, 1, 'opencart/catalog/view/template/total/reward.twig'),
(497, 1, 'opencart/catalog/view/template/total/shipping.twig'),
(498, 1, 'opencart/catalog/view/template/total/voucher.twig'),
(499, 1, 'opencart/install.json');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter`
--

CREATE TABLE `oc_filter` (
  `filter_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_description`
--

CREATE TABLE `oc_filter_description` (
  `filter_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `filter_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group`
--

CREATE TABLE `oc_filter_group` (
  `filter_group_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_filter_group_description`
--

CREATE TABLE `oc_filter_group_description` (
  `filter_group_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_gdpr`
--

CREATE TABLE `oc_gdpr` (
  `gdpr_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `code` varchar(40) NOT NULL,
  `email` varchar(96) NOT NULL,
  `action` varchar(6) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_geo_zone`
--

CREATE TABLE `oc_geo_zone` (
  `geo_zone_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_geo_zone`
--

INSERT INTO `oc_geo_zone` (`geo_zone_id`, `name`, `description`, `date_added`, `date_modified`) VALUES
(3, 'Зона НДС', 'Облагаемые НДС', '2009-01-06 23:26:25', '2022-05-24 22:33:24');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information`
--

CREATE TABLE `oc_information` (
  `information_id` int(11) NOT NULL,
  `bottom` int(1) NOT NULL DEFAULT '0',
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_information`
--

INSERT INTO `oc_information` (`information_id`, `bottom`, `sort_order`, `status`) VALUES
(1, 1, 3, 1),
(2, 1, 1, 1),
(3, 1, 4, 1),
(4, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_description`
--

CREATE TABLE `oc_information_description` (
  `information_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `description` mediumtext NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_information_description`
--

INSERT INTO `oc_information_description` (`information_id`, `language_id`, `title`, `description`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(1, 1, 'О нас', '&lt;p&gt;\r\n	About Us&lt;/p&gt;\r\n', 'О нас', '', ''),
(2, 1, 'Условия соглашения', '&lt;p&gt;\r\n	Terms &amp;amp; Conditions&lt;/p&gt;\r\n', 'Условия соглашения', '', ''),
(3, 1, 'Политика Безопасности', '&lt;p&gt;\r\n	Privacy Policy&lt;/p&gt;\r\n', 'Политика Безопасности', '', ''),
(4, 1, 'Доставка', '&lt;p&gt;\r\n	Delivery Information&lt;/p&gt;\r\n', 'Доставка', '', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_layout`
--

CREATE TABLE `oc_information_to_layout` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_information_to_store`
--

CREATE TABLE `oc_information_to_store` (
  `information_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_information_to_store`
--

INSERT INTO `oc_information_to_store` (`information_id`, `store_id`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_language`
--

CREATE TABLE `oc_language` (
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `code` varchar(5) NOT NULL,
  `locale` varchar(255) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_language`
--

INSERT INTO `oc_language` (`language_id`, `name`, `code`, `locale`, `extension`, `sort_order`, `status`) VALUES
(1, 'Russian', 'ru-ru', 'ru_RU.UTF-8,ru_RU,russian,ru', '', 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout`
--

CREATE TABLE `oc_layout` (
  `layout_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_layout`
--

INSERT INTO `oc_layout` (`layout_id`, `name`) VALUES
(1, 'Главная / Home'),
(2, 'Товар / Product'),
(3, 'Категория / Category'),
(4, 'По умолчанию / Default'),
(5, 'Производитель / Manufacturer'),
(6, 'Личный кабинет / Account'),
(7, 'Оформление заказа / Checkout'),
(8, 'Контакты / Contact'),
(9, 'Карта сайта / Sitemap'),
(10, 'Партнер / Affiliate'),
(11, 'Статья / Information'),
(12, 'Сравнение / Compare'),
(13, 'Поиск / Search');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_module`
--

CREATE TABLE `oc_layout_module` (
  `layout_module_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `position` varchar(14) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_layout_module`
--

INSERT INTO `oc_layout_module` (`layout_module_id`, `layout_id`, `code`, `position`, `sort_order`) VALUES
(1, 10, 'opencart.account', 'column_right', 1),
(2, 6, 'opencart.account', 'column_right', 1),
(3, 1, 'opencart.banner.3', 'content_top', 1),
(4, 1, 'opencart.featured.2', 'content_top', 2),
(5, 1, 'opencart.banner.4', 'content_bottom', 1),
(6, 3, 'opencart.category', 'column_left', 1),
(7, 3, 'opencart.banner.1', 'column_left', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_layout_route`
--

CREATE TABLE `oc_layout_route` (
  `layout_route_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_layout_route`
--

INSERT INTO `oc_layout_route` (`layout_route_id`, `layout_id`, `store_id`, `route`) VALUES
(1, 6, 0, 'account/%'),
(2, 6, 0, 'information/gdpr'),
(3, 10, 0, 'affiliate/%'),
(4, 3, 0, 'product/category'),
(5, 1, 0, 'common/home'),
(6, 2, 0, 'product/product'),
(7, 11, 0, 'information/information'),
(8, 7, 0, 'checkout/%'),
(9, 8, 0, 'information/contact'),
(10, 9, 0, 'information/sitemap'),
(11, 4, 0, ''),
(12, 5, 0, 'product/manufacturer'),
(13, 12, 0, 'product/compare'),
(14, 13, 0, 'product/search');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class`
--

CREATE TABLE `oc_length_class` (
  `length_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_length_class`
--

INSERT INTO `oc_length_class` (`length_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 10.00000000),
(3, 0.39370000);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_length_class_description`
--

CREATE TABLE `oc_length_class_description` (
  `length_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_length_class_description`
--

INSERT INTO `oc_length_class_description` (`length_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Сантиметр', 'см'),
(2, 1, 'Миллиметр', 'мм');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_location`
--

CREATE TABLE `oc_location` (
  `location_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `address` text NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `geocode` varchar(32) NOT NULL,
  `image` varchar(255) NOT NULL,
  `open` text NOT NULL,
  `comment` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer`
--

CREATE TABLE `oc_manufacturer` (
  `manufacturer_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_manufacturer`
--

INSERT INTO `oc_manufacturer` (`manufacturer_id`, `name`, `image`, `sort_order`) VALUES
(5, 'HTC', 'catalog/demo/htc_logo.jpg', 0),
(6, 'Palm', 'catalog/demo/palm_logo.jpg', 0),
(7, 'Hewlett-Packard', 'catalog/demo/hp_logo.jpg', 0),
(8, 'Apple', 'catalog/demo/apple_logo.jpg', 0),
(9, 'Canon', 'catalog/demo/canon_logo.jpg', 0),
(10, 'Sony', 'catalog/demo/sony_logo.jpg', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_layout`
--

CREATE TABLE `oc_manufacturer_to_layout` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_manufacturer_to_store`
--

CREATE TABLE `oc_manufacturer_to_store` (
  `manufacturer_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_manufacturer_to_store`
--

INSERT INTO `oc_manufacturer_to_store` (`manufacturer_id`, `store_id`) VALUES
(5, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_marketing`
--

CREATE TABLE `oc_marketing` (
  `marketing_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL,
  `description` text NOT NULL,
  `code` varchar(64) NOT NULL,
  `clicks` int(5) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_marketing_report`
--

CREATE TABLE `oc_marketing_report` (
  `marketing_report_id` int(11) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_module`
--

CREATE TABLE `oc_module` (
  `module_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `code` varchar(64) NOT NULL,
  `setting` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_module`
--

INSERT INTO `oc_module` (`module_id`, `name`, `code`, `setting`) VALUES
(1, 'Category Banner', 'opencart.banner', '{\"name\":\"Category Banner\",\"banner_id\":\"6\",\"effect\":\"fade\",\"items\":\"1\",\"controls\":\"0\",\"indicators\":\"0\",\"interval\":\"5000\",\"width\":\"200\",\"height\":\"180\",\"status\":\"1\"}'),
(2, 'Featured', 'opencart.featured', '{\"name\":\"Featured\",\"product_name\":\"\",\"product\":[\"43\",\"40\",\"42\",\"30\"],\"axis\":\"horizontal\",\"limit\":\"4\",\"width\":\"200\",\"height\":\"200\",\"status\":\"1\"}'),
(3, 'Homepage Slideshow', 'opencart.banner', '{\"name\":\"Homepage Slideshow\",\"banner_id\":\"7\",\"effect\":\"slide\",\"items\":\"1\",\"controls\":\"1\",\"indicators\":\"1\",\"interval\":\"5000\",\"width\":\"1140\",\"height\":\"380\",\"status\":\"1\"}'),
(4, 'Homepage Manufacturers', 'opencart.banner', '{\"name\":\"Homepage Manufacturers\",\"banner_id\":\"8\",\"effect\":\"slide\",\"items\":\"5\",\"controls\":\"1\",\"indicators\":\"1\",\"interval\":\"5000\",\"width\":\"130\",\"height\":\"100\",\"status\":\"1\"}');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_notification`
--

CREATE TABLE `oc_notification` (
  `notification_id` int(11) NOT NULL,
  `title` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `status` tinyint(11) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option`
--

CREATE TABLE `oc_option` (
  `option_id` int(11) NOT NULL,
  `type` varchar(32) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_option`
--

INSERT INTO `oc_option` (`option_id`, `type`, `sort_order`) VALUES
(1, 'radio', 1),
(2, 'checkbox', 2),
(4, 'text', 3),
(5, 'select', 4),
(6, 'textarea', 5),
(7, 'file', 6),
(8, 'date', 7),
(9, 'time', 8),
(10, 'datetime', 9),
(11, 'select', 10),
(12, 'date', 11);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_description`
--

CREATE TABLE `oc_option_description` (
  `option_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_option_description`
--

INSERT INTO `oc_option_description` (`option_id`, `language_id`, `name`) VALUES
(1, 1, 'Radio'),
(2, 1, 'Checkbox'),
(4, 1, 'Text'),
(5, 1, 'Select'),
(6, 1, 'Textarea'),
(7, 1, 'File'),
(8, 1, 'Date'),
(9, 1, 'Time'),
(10, 1, 'Date &amp; Time'),
(11, 1, 'Size'),
(12, 1, 'Delivery Date');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value`
--

CREATE TABLE `oc_option_value` (
  `option_value_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_option_value`
--

INSERT INTO `oc_option_value` (`option_value_id`, `option_id`, `image`, `sort_order`) VALUES
(23, 2, '', 1),
(24, 2, '', 2),
(31, 1, '', 2),
(32, 1, '', 1),
(39, 5, '', 1),
(40, 5, '', 2),
(41, 5, '', 3),
(42, 5, '', 4),
(43, 1, '', 3),
(44, 2, '', 3),
(45, 2, '', 4),
(46, 11, '', 1),
(47, 11, '', 2),
(48, 11, '', 3);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_option_value_description`
--

CREATE TABLE `oc_option_value_description` (
  `option_value_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_option_value_description`
--

INSERT INTO `oc_option_value_description` (`option_value_id`, `language_id`, `option_id`, `name`) VALUES
(23, 1, 2, 'Checkbox 1'),
(24, 1, 2, 'Checkbox 2'),
(31, 1, 1, 'Medium'),
(32, 1, 1, 'Small'),
(39, 1, 5, 'Red'),
(40, 1, 5, 'Blue'),
(41, 1, 5, 'Green'),
(42, 1, 5, 'Yellow'),
(43, 1, 1, 'Large'),
(44, 1, 2, 'Checkbox 3'),
(45, 1, 2, 'Checkbox 4'),
(46, 1, 11, 'Small'),
(47, 1, 11, 'Medium'),
(48, 1, 11, 'Large');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order`
--

CREATE TABLE `oc_order` (
  `order_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `invoice_no` int(11) NOT NULL DEFAULT '0',
  `invoice_prefix` varchar(26) NOT NULL,
  `transaction_id` varchar(100) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `store_name` varchar(64) NOT NULL,
  `store_url` varchar(255) NOT NULL,
  `customer_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `custom_field` text NOT NULL,
  `payment_address_id` int(11) NOT NULL,
  `payment_firstname` varchar(32) NOT NULL,
  `payment_lastname` varchar(32) NOT NULL,
  `payment_company` varchar(60) NOT NULL,
  `payment_address_1` varchar(128) NOT NULL,
  `payment_address_2` varchar(128) NOT NULL,
  `payment_city` varchar(128) NOT NULL,
  `payment_postcode` varchar(10) NOT NULL,
  `payment_country` varchar(128) NOT NULL,
  `payment_country_id` int(11) NOT NULL,
  `payment_zone` varchar(128) NOT NULL,
  `payment_zone_id` int(11) NOT NULL,
  `payment_address_format` text NOT NULL,
  `payment_custom_field` text NOT NULL,
  `payment_method` text NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `shipping_firstname` varchar(32) NOT NULL,
  `shipping_lastname` varchar(32) NOT NULL,
  `shipping_company` varchar(60) NOT NULL,
  `shipping_address_1` varchar(128) NOT NULL,
  `shipping_address_2` varchar(128) NOT NULL,
  `shipping_city` varchar(128) NOT NULL,
  `shipping_postcode` varchar(10) NOT NULL,
  `shipping_country` varchar(128) NOT NULL,
  `shipping_country_id` int(11) NOT NULL,
  `shipping_zone` varchar(128) NOT NULL,
  `shipping_zone_id` int(11) NOT NULL,
  `shipping_address_format` text NOT NULL,
  `shipping_custom_field` text NOT NULL,
  `shipping_method` text NOT NULL,
  `comment` text NOT NULL,
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `order_status_id` int(11) NOT NULL DEFAULT '0',
  `affiliate_id` int(11) NOT NULL,
  `commission` decimal(15,4) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `language_code` varchar(5) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `currency_code` varchar(3) NOT NULL,
  `currency_value` decimal(15,8) NOT NULL DEFAULT '1.00000000',
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_history`
--

CREATE TABLE `oc_order_history` (
  `order_history_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_option`
--

CREATE TABLE `oc_order_option` (
  `order_option_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_option_value_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `type` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_product`
--

CREATE TABLE `oc_order_product` (
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `total` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `tax` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `reward` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_status`
--

CREATE TABLE `oc_order_status` (
  `order_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_order_status`
--

INSERT INTO `oc_order_status` (`order_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Ожидание'),
(2, 1, 'В обработке'),
(3, 1, 'Доставлено'),
(5, 1, 'Сделка завершена'),
(7, 1, 'Отменено'),
(8, 1, 'Возврат'),
(9, 1, 'Отмена и аннулирование'),
(10, 1, 'Неудавшийся'),
(11, 1, 'Возмещенный'),
(12, 1, 'Полностью измененный'),
(13, 1, 'Полный возврат'),
(14, 1, 'Просроченный'),
(15, 1, 'Обработанный'),
(16, 1, 'Аннулированный');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_subscription`
--

CREATE TABLE `oc_order_subscription` (
  `order_subscription_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_tax` decimal(15,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_remaining` smallint(6) NOT NULL,
  `trial_status` tinyint(1) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `tax` decimal(15,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `cycle` smallint(6) NOT NULL,
  `duration` smallint(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_total`
--

CREATE TABLE `oc_order_total` (
  `order_total_id` int(10) NOT NULL,
  `order_id` int(11) NOT NULL,
  `extension` varchar(255) NOT NULL,
  `code` varchar(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_order_voucher`
--

CREATE TABLE `oc_order_voucher` (
  `order_voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `description` varchar(255) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product`
--

CREATE TABLE `oc_product` (
  `product_id` int(11) NOT NULL,
  `master_id` int(11) NOT NULL DEFAULT '0',
  `model` varchar(64) NOT NULL,
  `sku` varchar(64) NOT NULL,
  `upc` varchar(12) NOT NULL,
  `ean` varchar(14) NOT NULL,
  `jan` varchar(13) NOT NULL,
  `isbn` varchar(17) NOT NULL,
  `mpn` varchar(64) NOT NULL,
  `location` varchar(128) NOT NULL,
  `variant` text NOT NULL,
  `override` text NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `stock_status_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `manufacturer_id` int(11) NOT NULL,
  `shipping` tinyint(1) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `points` int(8) NOT NULL DEFAULT '0',
  `tax_class_id` int(11) NOT NULL,
  `date_available` date NOT NULL,
  `weight` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `weight_class_id` int(11) NOT NULL DEFAULT '0',
  `length` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `width` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `height` decimal(15,8) NOT NULL DEFAULT '0.00000000',
  `length_class_id` int(11) NOT NULL DEFAULT '0',
  `subtract` tinyint(1) NOT NULL DEFAULT '1',
  `minimum` int(11) NOT NULL DEFAULT '1',
  `rating` int(1) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product`
--

INSERT INTO `oc_product` (`product_id`, `master_id`, `model`, `sku`, `upc`, `ean`, `jan`, `isbn`, `mpn`, `location`, `variant`, `override`, `quantity`, `stock_status_id`, `image`, `manufacturer_id`, `shipping`, `price`, `points`, `tax_class_id`, `date_available`, `weight`, `weight_class_id`, `length`, `width`, `height`, `length_class_id`, `subtract`, `minimum`, `rating`, `sort_order`, `status`, `date_added`, `date_modified`) VALUES
(28, 0, 'Product 1', '', '', '', '', '', '', '', '', '', 939, 7, 'catalog/demo/htc_touch_hd_1.jpg', 5, 1, 100.0000, 200, 9, '2009-02-03', 146.40000000, 2, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0, 1, '2009-02-03 16:06:50', '2011-09-30 01:05:39'),
(29, 0, 'Product 2', '', '', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/palm_treo_pro_1.jpg', 6, 1, 279.9900, 0, 9, '2009-02-03', 133.00000000, 2, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 0, 1, '2009-02-03 16:42:17', '2011-09-30 01:06:08'),
(30, 0, 'Product 3', '', '', '', '', '', '', '', '', '', 7, 6, 'catalog/demo/canon_eos_5d_1.jpg', 9, 1, 100.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0, 1, '2009-02-03 16:59:00', '2011-09-30 01:05:23'),
(31, 0, 'Product 4', '', '', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/nikon_d300_1.jpg', 0, 1, 80.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 3, 1, 1, 0, 0, 1, '2009-02-03 17:00:10', '2011-09-30 01:06:00'),
(32, 0, 'Product 5', '', '', '', '', '', '', '', '', '', 999, 6, 'catalog/demo/ipod_touch_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0, 1, '2009-02-03 17:07:26', '2011-09-30 01:07:22'),
(33, 0, 'Product 6', '', '', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/samsung_syncmaster_941bw.jpg', 0, 1, 200.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 0, 1, '2009-02-03 17:08:31', '2011-09-30 01:06:29'),
(34, 0, 'Product 7', '', '', '', '', '', '', '', '', '', 1000, 6, 'catalog/demo/ipod_shuffle_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 0, 1, '2009-02-03 18:07:54', '2011-09-30 01:07:17'),
(35, 0, 'Product 8', '', '', '', '', '', '', '', '', '', 1000, 5, '', 0, 0, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0, 1, '2009-02-03 18:08:31', '2011-09-30 01:06:17'),
(36, 0, 'Product 9', '', '', '', '', '', '', '', '', '', 994, 6, 'catalog/demo/ipod_nano_1.jpg', 8, 0, 100.0000, 100, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 0, 1, '2009-02-03 18:09:19', '2011-09-30 01:07:12'),
(40, 0, 'product 11', '', '', '', '', '', '', '', '', '', 970, 5, 'catalog/demo/iphone_1.jpg', 8, 1, 101.0000, 0, 9, '2009-02-03', 10.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0, 1, '2009-02-03 21:07:12', '2011-09-30 01:06:53'),
(41, 0, 'Product 14', '', '', '', '', '', '', '', '', '', 977, 5, 'catalog/demo/imac_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-03', 5.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 0, 1, '2009-02-03 21:07:26', '2011-09-30 01:06:44'),
(42, 0, 'Product 15', '', '', '', '', '', '', '', '', '', 990, 5, 'catalog/demo/apple_cinema_30.jpg', 8, 1, 100.0000, 400, 9, '2009-02-04', 12.50000000, 1, 1.00000000, 2.00000000, 3.00000000, 1, 1, 2, 0, 0, 1, '2009-02-03 21:07:37', '2011-09-30 00:46:19'),
(43, 0, 'Product 16', '', '', '', '', '', '', '', '', '', 929, 5, 'catalog/demo/macbook_1.jpg', 8, 0, 500.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 0, 1, '2009-02-03 21:07:49', '2011-09-30 01:05:46'),
(44, 0, 'Product 17', '', '', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/macbook_air_1.jpg', 8, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 0, 1, '2009-02-03 21:08:00', '2011-09-30 01:05:53'),
(45, 0, 'Product 18', '', '', '', '', '', '', '', '', '', 998, 5, 'catalog/demo/macbook_pro_1.jpg', 8, 1, 2000.0000, 0, 100, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 0, 1, '2009-02-03 21:08:17', '2011-09-15 22:22:01'),
(46, 0, 'Product 19', '', '', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/sony_vaio_1.jpg', 10, 1, 1000.0000, 0, 9, '2009-02-03', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 0, 1, '2009-02-03 21:08:29', '2011-09-30 01:06:39'),
(47, 0, 'Product 21', '', '', '', '', '', '', '', '', '', 1000, 5, 'catalog/demo/hp_1.jpg', 7, 1, 100.0000, 400, 9, '2009-02-03', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 0, 1, 0, 0, 1, '2009-02-03 21:08:40', '2011-09-30 01:05:28'),
(48, 0, 'product 20', 'test 1', '', '', '', '', '', 'test 2', '', '', 995, 5, 'catalog/demo/ipod_classic_1.jpg', 8, 1, 100.0000, 0, 9, '2009-02-08', 1.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 2, 1, 1, 0, 0, 1, '2009-02-08 17:21:51', '2011-09-30 01:07:06'),
(49, 0, 'SAM1', '', '', '', '', '', '', '', '', '', 0, 8, 'catalog/demo/samsung_tab_1.jpg', 0, 1, 199.9900, 0, 9, '2011-04-25', 0.00000000, 1, 0.00000000, 0.00000000, 0.00000000, 1, 1, 1, 0, 1, 1, '2011-04-26 08:57:34', '2011-09-30 01:06:23'),
(50, 0, '12400f', '001', '0001', '', '', '', '', '', '', '', 10, 7, 'catalog/200e4a08e74afcc3cf1d54d47b758cbbf14c71973a64009553347d2b234b5af4.jpg.webp', 0, 1, 12199.0000, 0, 0, '2024-12-25', 50.00000000, 2, 4.00000000, 4.00000000, 0.20000000, 1, 1, 1, 0, 1, 1, '2024-12-25 09:34:40', '2024-12-25 09:34:40'),
(51, 0, 'Athlon 3000G BOX', '003', '0003', '', '', '', '', '', '', '', 1, 7, 'catalog/processori/d2458872f78e2259bb1f4d2ebced5a738ae8d95cdf3306d6c7e97a01a389d6ea.jpg.webp', 0, 1, 7199.0000, 0, 0, '2024-12-25', 50.00000000, 2, 4.00000000, 4.00000000, 0.20000000, 1, 1, 1, 0, 1, 1, '2024-12-25 11:43:43', '2024-12-25 11:48:15'),
(52, 0, 'FX-4300', '003', '0003', '', '', '', '', '', '', '', 1, 7, 'catalog/154bdb8245785a167af639ee0d9f4443c1c5126ba41b6bbc7da8155141d7592c.jpg.webp', 0, 1, 1999.0000, 0, 0, '2024-12-25', 50.00000000, 2, 4.00000000, 4.00000000, 0.20000000, 1, 1, 1, 0, 1, 1, '2024-12-25 11:54:49', '2024-12-25 11:54:49'),
(53, 0, 'Pentium Gold G6400 OEM', '004', '0004', '', '', '', '', '', '', '', 2, 7, 'catalog/processori/648c3f251880638bf4a4f1c4ebc4201ba8238afb0a0468e862298d214c3d7478.jpg.webp', 0, 1, 7499.0000, 0, 0, '2024-12-25', 50.00000000, 2, 4.00000000, 4.00000000, 0.20000000, 1, 1, 1, 0, 1, 1, '2024-12-25 11:58:28', '2024-12-25 11:58:28'),
(54, 0, '14400F BOX', '005', '0005', '', '', '', '', '', '', '', 7, 7, 'catalog/processori/397a64253c0a47f7b045612bac04683da4a803bbedb6f233a87ad9340796ddf5.jpg.webp', 0, 1, 24499.0000, 0, 0, '2024-12-25', 50.00000000, 2, 4.00000000, 4.00000000, 0.20000000, 1, 1, 1, 0, 1, 1, '2024-12-25 12:02:14', '2024-12-25 12:02:14'),
(55, 0, 'G41CPL3', '006', '0006', '', '', '', '', '', '', '', 10, 7, 'catalog/processori/c8e470a41ad73b6329c8f6d3b6ee297aa7fb367f3188bebee790872ca4c6a90f.jpg.webp', 0, 1, 4499.0000, 0, 0, '2024-12-25', 500.00000000, 2, 400.00000000, 400.00000000, 20.00000000, 2, 1, 1, 0, 1, 1, '2024-12-25 12:06:23', '2024-12-25 12:06:23'),
(56, 0, 'B450M K', '007', '0007', '', '', '', '', '', '', '', 1, 7, 'catalog/mat/1a13c7cd498c8cd8f7c1426d372990d9c355c1a202044b5d2c4bc6becb5a1b7c.jpg.webp', 0, 1, 7199.0000, 0, 0, '2024-12-25', 500.00000000, 2, 450.00000000, 400.00000000, 20.00000000, 2, 1, 1, 0, 1, 1, '2024-12-25 12:10:02', '2024-12-25 12:10:02'),
(57, 0, 'BATTLE-AX H610M-E WIFI V20', '007', '0007', '', '', '', '', '', '', '', 11, 7, 'catalog/mat/df4991156de8e29605265997531615cb0ff92d13a5886c82eee0bd75c7f699e4.jpg.webp', 0, 1, 9699.0000, 0, 0, '2024-12-25', 500.00000000, 2, 450.00000000, 400.00000000, 20.00000000, 2, 1, 1, 0, 1, 1, '2024-12-25 12:13:28', '2024-12-25 12:13:28'),
(58, 0, 'GA-G41M-COMBO-GQ (rev.3)', '008', '0008', '', '', '', '', '', '', '', 5, 7, 'catalog/mat/fe7a35b508925d6398d4e071e2dbc930ecf73fdb55117f3d11ec42c75fb70c93.jpg.webp', 0, 1, 9899.0000, 0, 0, '2024-12-25', 500.00000000, 2, 400.00000000, 400.00000000, 20.00000000, 2, 1, 1, 0, 1, 1, '2024-12-25 12:16:42', '2024-12-25 12:16:42'),
(59, 0, 'ROG MAXIMUS Z890 EXTREME', '009', '0009', '', '', '', '', '', '', '', 2, 7, 'catalog/mat/2399fa45703f49413b6540d97dc6a31852a2f209a1398519e4fe35f59f9833a9.jpg.webp', 0, 1, 179999.0000, 0, 0, '2024-12-25', 750.00000000, 2, 450.00000000, 450.00000000, 40.00000000, 2, 1, 1, 0, 1, 1, '2024-12-25 12:19:53', '2024-12-25 12:19:53');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_attribute`
--

CREATE TABLE `oc_product_attribute` (
  `product_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_attribute`
--

INSERT INTO `oc_product_attribute` (`product_id`, `attribute_id`, `language_id`, `text`) VALUES
(42, 3, 1, '100mhz'),
(43, 2, 1, '1'),
(43, 4, 1, '8gb'),
(47, 2, 1, '4'),
(47, 4, 1, '16GB');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_description`
--

CREATE TABLE `oc_product_description` (
  `product_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `tag` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_description`
--

INSERT INTO `oc_product_description` (`product_id`, `language_id`, `name`, `description`, `tag`, `meta_title`, `meta_description`, `meta_keyword`) VALUES
(28, 1, 'HTC Touch HD', '&lt;p&gt;\r\n	HTC Touch - in High Definition. Watch music videos and streaming content in awe-inspiring high definition clarity for a mobile experience you never thought possible. Seductively sleek, the HTC Touch HD provides the next generation of mobile functionality, all at a simple touch. Fully integrated with Windows Mobile Professional 6.1, ultrafast 3.5G, GPS, 5MP camera, plus lots more - all delivered on a breathtakingly crisp 3.8&amp;quot; WVGA touchscreen - you can take control of your mobile world with the HTC Touch HD.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Processor Qualcomm&amp;reg; MSM 7201A&amp;trade; 528 MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Operating System&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Memory: 512 MB ROM, 288 MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Dimensions: 115 mm x 62.8 mm x 12 mm / 146.4 grams&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.8-inch TFT-LCD flat touch-sensitive screen with 480 x 800 WVGA resolution&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/WCDMA: Europe/Asia: 900/2100 MHz; Up to 2 Mbps up-link and 7.2 Mbps down-link speeds&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM/GPRS/EDGE: Europe/Asia: 850/900/1800/1900 MHz (Band frequency, HSUPA availability, and data speed are operator dependent.)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Device Control via HTC TouchFLO&amp;trade; 3D &amp;amp; Touch-sensitive front panel buttons&lt;/li&gt;\r\n	&lt;li&gt;\r\n		GPS and A-GPS ready&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth&amp;reg; 2.0 with Enhanced Data Rate and A2DP for wireless stereo headsets&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wi-Fi&amp;reg;: IEEE 802.11 b/g&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HTC ExtUSB&amp;trade; (11-pin mini-USB 2.0)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		5 megapixel color camera with auto focus&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VGA CMOS color camera&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in 3.5 mm audio jack, microphone, speaker, and FM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Ring tone formats: AAC, AAC+, eAAC+, AMR-NB, AMR-WB, QCP, MP3, WMA, WAV&lt;/li&gt;\r\n	&lt;li&gt;\r\n		40 polyphonic and standard MIDI format 0 and 1 (SMF)/SP MIDI&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Rechargeable Lithium-ion or Lithium-ion polymer 1350 mAh battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Expansion Slot: microSD&amp;trade; memory card (SD 2.0 compatible)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AC Adapter Voltage range/frequency: 100 ~ 240V AC, 50/60 Hz DC output: 5V and 1A&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Special Features: FM Radio, G-Sensor&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', '	 HTC Touch HD', '', ''),
(29, 1, 'Palm Treo Pro', '&lt;p&gt;\r\n	Redefine your workday with the Palm Treo Pro smartphone. Perfectly balanced, you can respond to business and personal email, stay on top of appointments and contacts, and use Wi-Fi or GPS when you&amp;rsquo;re out and about. Then watch a video on YouTube, catch up with news and sports on the web, or listen to a few songs. Balance your work and play the way you like it, with the Palm Treo Pro.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Features&lt;/strong&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Windows Mobile&amp;reg; 6.1 Professional Edition&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Qualcomm&amp;reg; MSM7201 400MHz Processor&lt;/li&gt;\r\n	&lt;li&gt;\r\n		320x320 transflective colour TFT touchscreen&lt;/li&gt;\r\n	&lt;li&gt;\r\n		HSDPA/UMTS/EDGE/GPRS/GSM radio&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Tri-band UMTS &amp;mdash; 850MHz, 1900MHz, 2100MHz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Quad-band GSM &amp;mdash; 850/900/1800/1900&lt;/li&gt;\r\n	&lt;li&gt;\r\n		802.11b/g with WPA, WPA2, and 801.1x authentication&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in GPS&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Bluetooth Version: 2.0 + Enhanced Data Rate&lt;/li&gt;\r\n	&lt;li&gt;\r\n		256MB storage (100MB user available), 128MB RAM&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2.0 megapixel camera, up to 8x digital zoom and video capture&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Removable, rechargeable 1500mAh lithium-ion battery&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Up to 5.0 hours talk time and up to 250 hours standby&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroSDHC card expansion (up to 32GB supported)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MicroUSB 2.0 for synchronization and charging&lt;/li&gt;\r\n	&lt;li&gt;\r\n		3.5mm stereo headset jack&lt;/li&gt;\r\n	&lt;li&gt;\r\n		60mm (W) x 114mm (L) x 13.5mm (D) / 133g&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Palm Treo Pro', '', ''),
(30, 1, 'Canon EOS 5D', '&lt;p&gt;\r\n	Canon\'s press material for the EOS 5D states that it \'defines (a) new D-SLR category\', while we\'re not typically too concerned with marketing talk this particular statement is clearly pretty accurate. The EOS 5D is unlike any previous digital SLR in that it combines a full-frame (35 mm sized) high resolution sensor (12.8 megapixels) with a relatively compact body (slightly larger than the EOS 20D, although in your hand it feels noticeably \'chunkier\'). The EOS 5D is aimed to slot in between the EOS 20D and the EOS-1D professional digital SLR\'s, an important difference when compared to the latter is that the EOS 5D doesn\'t have any environmental seals. While Canon don\'t specifically refer to the EOS 5D as a \'professional\' digital SLR it will have obvious appeal to professionals who want a high quality digital SLR in a body lighter than the EOS-1D. It will also no doubt appeal to current EOS 20D owners (although lets hope they\'ve not bought too many EF-S lenses...) äë&lt;/p&gt;\r\n', '', 'sdf', '', ''),
(31, 1, 'Nikon D300', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		Engineered with pro-level features and performance, the 12.3-effective-megapixel D300 combines brand new technologies with advanced features inherited from Nikon&amp;#39;s newly announced D3 professional digital SLR camera to offer serious photographers remarkable performance combined with agility.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		Similar to the D3, the D300 features Nikon&amp;#39;s exclusive EXPEED Image Processing System that is central to driving the speed and processing power needed for many of the camera&amp;#39;s new features. The D300 features a new 51-point autofocus system with Nikon&amp;#39;s 3D Focus Tracking feature and two new LiveView shooting modes that allow users to frame a photograph using the camera&amp;#39;s high-resolution LCD monitor. The D300 shares a similar Scene Recognition System as is found in the D3; it promises to greatly enhance the accuracy of autofocus, autoexposure, and auto white balance by recognizing the subject or scene being photographed and applying this information to the calculations for the three functions.&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 reacts with lightning speed, powering up in a mere 0.13 seconds and shooting with an imperceptible 45-millisecond shutter release lag time. The D300 is capable of shooting at a rapid six frames per second and can go as fast as eight frames per second when using the optional MB-D10 multi-power battery pack. In continuous bursts, the D300 can shoot up to 100 shots at full 12.3-megapixel resolution. (NORMAL-LARGE image setting, using a SanDisk Extreme IV 1GB CompactFlash card.)&lt;br /&gt;\r\n		&lt;br /&gt;\r\n		The D300 incorporates a range of innovative technologies and features that will significantly improve the accuracy, control, and performance photographers can get from their equipment. Its new Scene Recognition System advances the use of Nikon&amp;#39;s acclaimed 1,005-segment sensor to recognize colors and light patterns that help the camera determine the subject and the type of scene being photographed before a picture is taken. This information is used to improve the accuracy of autofocus, autoexposure, and auto white balance functions in the D300. For example, the camera can track moving subjects better and by identifying them, it can also automatically select focus points faster and with greater accuracy. It can also analyze highlights and more accurately determine exposure, as well as infer light sources to deliver more accurate white balance detection.&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'Nikon D300', '', ''),
(32, 1, 'iPod Touch', '&lt;p&gt;\r\n	&lt;strong&gt;Revolutionary multi-touch interface.&lt;/strong&gt;&lt;br /&gt;\r\n	iPod touch features the same multi-touch screen technology as iPhone. Pinch to zoom in on a photo. Scroll through your songs and videos with a flick. Flip through your library by album artwork with Cover Flow.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Gorgeous 3.5-inch widescreen display.&lt;/strong&gt;&lt;br /&gt;\r\n	Watch your movies, TV shows, and photos come alive with bright, vivid color on the 320-by-480-pixel display.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Music downloads straight from iTunes.&lt;/strong&gt;&lt;br /&gt;\r\n	Shop the iTunes Wi-Fi Music Store from anywhere with Wi-Fi.1 Browse or search to find the music youre looking for, preview it, and buy it with just a tap.&lt;/p&gt;\r\n&lt;p&gt;\r\n	&lt;strong&gt;Surf the web with Wi-Fi.&lt;/strong&gt;&lt;br /&gt;\r\n	Browse the web using Safari and watch YouTube videos on the first iPod with Wi-Fi built in&lt;br /&gt;\r\n	&amp;nbsp;&lt;/p&gt;\r\n', '', '	 iPod Touch', '', ''),
(33, 1, 'Samsung SyncMaster 941BW', '&lt;div&gt;\r\n	Imagine the advantages of going big without slowing down. The big 19&amp;quot; 941BW monitor combines wide aspect ratio with fast pixel response time, for bigger images, more room to work and crisp motion. In addition, the exclusive MagicBright 2, MagicColor and MagicTune technologies help deliver the ideal image in every situation, while sleek, narrow bezels and adjustable stands deliver style just the way you want it. With the Samsung 941BW widescreen analog/digital LCD monitor, it&amp;#39;s not hard to imagine.&lt;/div&gt;\r\n', '', 'Samsung SyncMaster 941BW', '', ''),
(34, 1, 'iPod Shuffle', '&lt;div&gt;\r\n	&lt;strong&gt;Born to be worn.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Clip on the worlds most wearable music player and take up to 240 songs with you anywhere. Choose from five colors including four new hues to make your musical fashion statement.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Random meets rhythm.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With iTunes autofill, iPod shuffle can deliver a new musical experience every time you sync. For more randomness, you can shuffle songs during playback with the slide of a switch.&lt;/p&gt;\r\n	&lt;strong&gt;Everything is easy.&lt;/strong&gt;\r\n	&lt;p&gt;\r\n		Charge and sync with the included USB dock. Operate the iPod shuffle controls with one hand. Enjoy up to 12 hours straight of skip-free music playback.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Shuffle', '', ''),
(35, 1, 'Product 8', '&lt;p&gt;\r\n	Product 8&lt;/p&gt;\r\n', '', 'Product 8', '', ''),
(36, 1, 'iPod Nano', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Video in your pocket.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Its the small iPod with one very big idea: video. The worlds most popular music player now lets you enjoy movies, TV shows, and more on a two-inch display thats 65% brighter than before.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;strong&gt;&amp;nbsp;&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;Sleek and colorful.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		With an anodized aluminum and polished stainless steel enclosure and a choice of five colors, iPod nano is dressed to impress.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;strong&gt;iTunes.&lt;/strong&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Available as a free download, iTunes makes it easy to browse and buy millions of songs, movies, TV shows, audiobooks, and games and download free podcasts all at the iTunes Store. And you can import your own music, manage your whole media library, and sync your iPod or iPhone with ease.&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'iPod Nano', '', ''),
(40, 1, 'iPhone', '&lt;p class=&quot;intro&quot;&gt;\r\n	iPhone is a revolutionary new mobile phone that allows you to make a call by simply tapping a name or number in your address book, a favorites list, or a call log. It also automatically syncs all your contacts from a PC, Mac, or Internet service. And it lets you select and listen to voicemail messages in whatever order you want just like email.&lt;/p&gt;\r\n', '', 'iPhone', '', ''),
(41, 1, 'iMac', '&lt;div&gt;\r\n	Just when you thought iMac had everything, now there&acute;s even more. More powerful Intel Core 2 Duo processors. And more memory standard. Combine this with Mac OS X Leopard and iLife &acute;08, and it&acute;s more all-in-one than ever. iMac packs amazing performance into a stunningly slim space.&lt;/div&gt;\r\n', '', 'iMac', '', ''),
(42, 1, 'Apple Cinema 30&quot;', '&lt;p&gt;\r\n	&lt;font face=&quot;helvetica,geneva,arial&quot; size=&quot;2&quot;&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The 30-inch Apple Cinema HD Display delivers an amazing 2560 x 1600 pixel resolution. Designed specifically for the creative professional, this display provides more space for easier access to all the tools and palettes needed to edit, format and composite your work. Combine this display with a Mac Pro, MacBook Pro, or PowerMac G5 and there\'s no limit to what you can achieve. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features an active-matrix liquid crystal display that produces flicker-free images that deliver twice the brightness, twice the sharpness and twice the contrast ratio of a typical CRT display. Unlike other flat panels, it\'s designed with a pure digital interface to deliver distortion-free images that never need adjusting. With over 4 million digital pixels, the display is uniquely suited for scientific and technical applications such as visualizing molecular structures or analyzing geological data. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Offering accurate, brilliant color performance, the Cinema HD delivers up to 16.7 million colors across a wide gamut allowing you to see subtle nuances between colors from soft pastels to rich jewel tones. A wide viewing angle ensures uniform color from edge to edge. Apple\'s ColorSync technology allows you to create custom profiles to maintain consistent color onscreen and in print. The result: You can confidently use this display in all your color-critical applications. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;Housed in a new aluminum design, the display has a very thin bezel that enhances visual accuracy. Each display features two FireWire 400 ports and two USB 2.0 ports, making attachment of desktop peripherals, such as iSight, iPod, digital and still cameras, hard drives, printers and scanners, even more accessible and convenient. Taking advantage of the much thinner and lighter footprint of an LCD, the new displays support the VESA (Video Electronics Standards Association) mounting interface standard. Customers with the optional Cinema Display VESA Mount Adapter kit gain the flexibility to mount their display in locations most appropriate for their work environment. &lt;br&gt;\r\n	&lt;br&gt;\r\n	&lt;/font&gt;&lt;font face=&quot;Helvetica&quot; size=&quot;2&quot;&gt;The Cinema HD features a single cable design with elegant breakout for the USB 2.0, FireWire 400 and a pure digital connection using the industry standard Digital Video Interface (DVI) interface. The DVI connection allows for a direct pure-digital connection.&lt;br&gt;\r\n	&lt;/font&gt;&lt;/font&gt;&lt;/p&gt;\r\n&lt;h3&gt;\r\n	Features:&lt;/h3&gt;\r\n&lt;p&gt;\r\n	Unrivaled display performance&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch (viewable) active-matrix liquid crystal display provides breathtaking image quality and vivid, richly saturated color.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 2560-by-1600 pixel resolution for display of high definition still and video imagery.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Wide-format design for simultaneous display of two full pages of text and graphics.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Industry standard DVI connector for direct attachment to Mac- and Windows-based desktops and notebooks&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Incredibly wide (170 degree) horizontal and vertical viewing angle for maximum visibility and color performance.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Lightning-fast pixel response for full-motion digital video playback.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for 16.7 million saturated colors, for use in all graphics-intensive applications.&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Simple setup and operation&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Single cable with elegant breakout for connection to DVI, USB and FireWire ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Built-in two-port USB 2.0 hub for easy connection of desktop peripheral devices.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports to support iSight and other desktop peripherals&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Sleek, elegant design&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Huge virtual workspace, very small footprint.&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Narrow Bezel design to minimize visual impact of using dual displays&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Unique hinge design for effortless adjustment&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Support for VESA mounting solutions (Apple Cinema Display VESA Mount Adapter sold separately)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;h3&gt;\r\n	Technical specifications&lt;/h3&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen size (diagonal viewable image size)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Apple Cinema HD Display: 30 inches (29.7-inch viewable)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen type&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Thin film transistor (TFT) active-matrix liquid crystal display (AMLCD)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Resolutions&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		2560 x 1600 pixels (optimum resolution)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		2048 x 1280&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1920 x 1200&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1280 x 800&lt;/li&gt;\r\n	&lt;li&gt;\r\n		1024 x 640&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Display colors (maximum)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16.7 million&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Viewing angle (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		170° horizontal; 170° vertical&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Brightness (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 400 cd/m2&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Contrast ratio (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		700:1&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Response time (typical)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		16 ms&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Pixel pitch&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		30-inch Cinema HD Display: 0.250 mm&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Screen treatment&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Antiglare hardcoat&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;User controls (hardware and software)&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Display Power,&lt;/li&gt;\r\n	&lt;li&gt;\r\n		System sleep, wake&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Brightness&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Monitor tilt&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Connectors and cables&lt;/b&gt;&lt;br&gt;\r\n	Cable&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		DVI (Digital Visual Interface)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		FireWire 400&lt;/li&gt;\r\n	&lt;li&gt;\r\n		USB 2.0&lt;/li&gt;\r\n	&lt;li&gt;\r\n		DC power (24 V)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	Connectors&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Two-port, self-powered USB 2.0 hub&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Two FireWire 400 ports&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Kensington security port&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;VESA mount adapter&lt;/b&gt;&lt;br&gt;\r\n	Requires optional Cinema Display VESA Mount Adapter (M9649G/A)&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Compatible with VESA FDMI (MIS-D, 100, C) compliant mounting solutions&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Electrical requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Input voltage: 100-240 VAC 50-60Hz&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum power when operating: 150W&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Energy saver mode: 3W or less&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Environmental requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Operating temperature: 50° to 95° F (10° to 35° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Storage temperature: -40° to 116° F (-40° to 47° C)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Operating humidity: 20% to 80% noncondensing&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Maximum operating altitude: 10,000 feet&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Agency approvals&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		FCC Part 15 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55022 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN55024&lt;/li&gt;\r\n	&lt;li&gt;\r\n		VCCI Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		AS/NZS 3548 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CNS 13438 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ICES-003 Class B&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ISO 13406 part 2&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MPR II&lt;/li&gt;\r\n	&lt;li&gt;\r\n		IEC 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		UL 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		CSA 60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		EN60950&lt;/li&gt;\r\n	&lt;li&gt;\r\n		ENERGY STAR&lt;/li&gt;\r\n	&lt;li&gt;\r\n		TCO \'03&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;Size and weight&lt;/b&gt;&lt;br&gt;\r\n	30-inch Apple Cinema HD Display&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Height: 21.3 inches (54.3 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Width: 27.2 inches (68.8 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Depth: 8.46 inches (21.5 cm)&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Weight: 27.5 pounds (12.5 kg)&lt;/li&gt;\r\n&lt;/ul&gt;\r\n&lt;p&gt;\r\n	&lt;b&gt;System Requirements&lt;/b&gt;&lt;/p&gt;\r\n&lt;ul&gt;\r\n	&lt;li&gt;\r\n		Mac Pro, all graphic options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		MacBook Pro&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI-X) with ATI Radeon 9650 or better or NVIDIA GeForce 6800 GT DDL or better&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Power Mac G5 (PCI Express), all graphics options&lt;/li&gt;\r\n	&lt;li&gt;\r\n		PowerBook G4 with dual-link DVI support&lt;/li&gt;\r\n	&lt;li&gt;\r\n		Windows PC and graphics card that supports DVI ports with dual-link digital bandwidth and VESA DDC standard for plug-and-play setup&lt;/li&gt;\r\n&lt;/ul&gt;\r\n', '', 'Apple Cinema 30', '', ''),
(43, 1, 'MacBook', '&lt;div&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Intel Core 2 Duo processor&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Powered by an Intel Core 2 Duo processor at speeds up to 2.16GHz, the new MacBook is the fastest ever.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;1GB memory, larger hard drives&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		The new MacBook now comes with 1GB of memory standard and larger hard drives for the entire line perfect for running more of your favorite applications and storing growing media collections.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Sleek, 1.08-inch-thin design&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		MacBook makes it easy to hit the road thanks to its tough polycarbonate case, built-in wireless technologies, and innovative MagSafe Power Adapter that releases automatically if someone accidentally trips on the cord.&lt;/p&gt;\r\n	&lt;p&gt;\r\n		&lt;b&gt;Built-in iSight camera&lt;/b&gt;&lt;/p&gt;\r\n	&lt;p&gt;\r\n		Right out of the box, you can have a video chat with friends or family,2 record a video at your desk, or take fun pictures with Photo Booth&lt;/p&gt;\r\n&lt;/div&gt;\r\n', '', 'MacBook', '', ''),
(44, 1, 'MacBook Air', '&lt;div&gt;\r\n	MacBook Air is ultrathin, ultraportable, and ultra unlike anything else. But you don&amp;rsquo;t lose inches and pounds overnight. It&amp;rsquo;s the result of rethinking conventions. Of multiple wireless innovations. And of breakthrough design. With MacBook Air, mobile computing suddenly has a new standard.&lt;/div&gt;\r\n', '', 'MacBook Air', '', ''),
(45, 1, 'MacBook Pro', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Latest Intel mobile architecture&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Powered by the most advanced mobile processors from Intel, the new Core 2 Duo MacBook Pro is over 50% faster than the original Core Duo MacBook Pro and now supports up to 4GB of RAM.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Leading-edge graphics&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			The NVIDIA GeForce 8600M GT delivers exceptional graphics processing power. For the ultimate creative canvas, you can even configure the 17-inch model with a 1920-by-1200 resolution display.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Designed for life on the road&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Innovations such as a magnetic power connection and an illuminated keyboard with ambient light sensor put the MacBook Pro in a class by itself.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Connect. Create. Communicate.&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Quickly set up a video conference with the built-in iSight camera. Control presentations and media from up to 30 feet away with the included Apple Remote. Connect to high-bandwidth peripherals with FireWire 800 and DVI.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;b&gt;Next-generation wireless&lt;/b&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Featuring 802.11n wireless technology, the MacBook Pro delivers up to five times the performance and up to twice the range of previous-generation technologies.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'MacBook Pro', '', ''),
(46, 1, 'Sony VAIO', '&lt;div&gt;\r\n	Unprecedented power. The next generation of processing technology has arrived. Built into the newest VAIO notebooks lies Intel&amp;#39;s latest, most powerful innovation yet: Intel&amp;reg; Centrino&amp;reg; 2 processor technology. Boasting incredible speed, expanded wireless connectivity, enhanced multimedia support and greater energy efficiency, all the high-performance essentials are seamlessly combined into a single chip.&lt;/div&gt;\r\n', '', 'Sony VAIO', '', ''),
(47, 1, 'HP LP3065', '&lt;p&gt;\r\n	Stop your co-workers in their tracks with the stunning new 30-inch diagonal HP LP3065 Flat Panel Monitor. This flagship monitor features best-in-class performance and presentation features on a huge wide-aspect screen while letting you work as comfortably as possible - you might even forget you&amp;#39;re at the office&lt;/p&gt;\r\n', '', 'HP LP3065', '', ''),
(48, 1, 'iPod Classic', '&lt;div class=&quot;cpt_product_description &quot;&gt;\r\n	&lt;div&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;More room to move.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			With 80GB or 160GB of storage and up to 40 hours of battery life, the new iPod classic lets you enjoy up to 40,000 songs or up to 200 hours of video or any combination wherever you go.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Cover Flow.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Browse through your music collection by flipping through album art. Select an album to turn it over and see the track list.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Enhanced interface.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Experience a whole new way to browse and view your music and video.&lt;/p&gt;\r\n		&lt;p&gt;\r\n			&lt;strong&gt;Sleeker design.&lt;/strong&gt;&lt;/p&gt;\r\n		&lt;p&gt;\r\n			Beautiful, durable, and sleeker than ever, iPod classic now features an anodized aluminum and polished stainless steel enclosure with rounded edges.&lt;/p&gt;\r\n	&lt;/div&gt;\r\n&lt;/div&gt;\r\n&lt;!-- cpt_container_end --&gt;', '', 'iPod Classic', '', ''),
(49, 1, 'Samsung Galaxy Tab 10.1', '&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1, is the world&amp;rsquo;s thinnest tablet, measuring 8.6 mm thickness, running with Android 3.0 Honeycomb OS on a 1GHz dual-core Tegra 2 processor, similar to its younger brother Samsung Galaxy Tab 8.9.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 gives pure Android 3.0 experience, adding its new TouchWiz UX or TouchWiz 4.0 &amp;ndash; includes a live panel, which lets you to customize with different content, such as your pictures, bookmarks, and social feeds, sporting a 10.1 inches WXGA capacitive touch screen with 1280 x 800 pixels of resolution, equipped with 3 megapixel rear camera with LED flash and a 2 megapixel front camera, HSPA+ connectivity up to 21Mbps, 720p HD video recording capability, 1080p HD playback, DLNA support, Bluetooth 2.1, USB 2.0, gyroscope, Wi-Fi 802.11 a/b/g/n, micro-SD slot, 3.5mm headphone jack, and SIM slot, including the Samsung Stick &amp;ndash; a Bluetooth microphone that can be carried in a pocket like a pen and sound dock with powered subwoofer.&lt;/p&gt;\r\n&lt;p&gt;\r\n	Samsung Galaxy Tab 10.1 will come in 16GB / 32GB / 64GB verities and pre-loaded with Social Hub, Reader&amp;rsquo;s Hub, Music Hub and Samsung Mini Apps Tray &amp;ndash; which gives you access to more commonly used apps to help ease multitasking and it is capable of Adobe Flash Player 10.2, powered by 6860mAh battery that gives you 10hours of video-playback time.&amp;nbsp;&amp;auml;&amp;ouml;&lt;/p&gt;\r\n', '', 'Samsung Galaxy Tab 10.1', '', ''),
(50, 1, 'Intel Core i5-12400F OEM', '&lt;p&gt;Процессор Intel Core i5-12400F OEM – отличный выбор для пользователей, желающих собрать игровой ПК или производительный универсальный компьютер. CPU имеет 6 производительных ядер. Базовая частота процессора – 2.5 ГГц. Максимальная частота в турборежиме значительно выше – 4.4 ГГц. Значительное влияние на производительность процессора оказывают 7.5-мегабайтный кэш L2 и 18-мегабайтный кэш L3. Устройство совместимо с оперативной памятью DDR4 и DDR5. Максимально поддерживаемый объем ОЗУ равен 128 ГБ.&lt;br /&gt;\r\nПроцессор Intel Core i5-12400F OEM отличается низким тепловыделением. TDP устройства – 65 Вт. Выбор системы охлаждения производится с учетом этого показателя. В комплекте кулер отсутствует. Максимальная рабочая температура процессора – 100 °C.&lt;/p&gt;', '', 'i5', '', ''),
(51, 1, 'AMD Athlon 3000G BOX', '&lt;p&gt;Процессор AMD Athlon 3000G BOX — это двухъядерная модель с четырьмя потоками, выполненная на архитектуре Zen и предназначенная для сокета AM4. Его рабочая частота составляет 3.5 ГГц, что делает его подходящим для повседневных задач, таких как серфинг в интернете, использование офисных приложений и работа с мультимедийными программами. Процессор имеет 1 МБ кэша второго уровня и 4 МБ кэша третьего уровня, что ускоряет обработку данных.&lt;br /&gt;\r\nAMD Athlon 3000G поддерживает память DDR4 с частотой до 2666 МГц и два канала передачи данных, что способствует улучшению производительности системы в целом. Также он поддерживает ECC-память, что может быть полезно для работы в системах, где важно минимизировать риск потери данных.&lt;br /&gt;\r\nЭтот процессор оснащен встроенной графикой Radeon Vega 3, которая позволяет запускать простые игры и мультимедийные приложения без отдельной видеокарты. Максимальная частота графического ядра составляет 1100 МГц, а количество потоковых процессоров — 192, что обеспечит хорошую производительность для нетребовательных графических задач.&lt;/p&gt;', '', 'AMD', '', ''),
(52, 1, 'AMD FX-4300 BOX', '&lt;p&gt;Процессор AMD FX-4300 BOX оснащен четырьмя вычислительными ядрами, обеспечивая высокую производительность при обработке требовательных ресурсов и работы в многозадачном режиме. Ядра функционируют с номинальной тактовой частотой на уровне значения 3.8 ГГц, которая способна повышаться благодаря разблокированному множителю и фирменной технологии разгона до значения 4 ГГц. Процессор AMD FX-4300 предусматривает совместное функционирование с оперативной памятью объемом не более 128 ГБ. Показатель тепловыделения на уровне 95 Вт позволяет устанавливать процессор в портативные компьютеры.&lt;/p&gt;', '', 'ЦП', 'процессор', 'процессор'),
(53, 1, 'Intel Pentium Gold G6400 OEM', '&lt;p&gt;Процессор Intel Pentium Gold G6400 OEM имеет 2-ядерную структуру Comet Lake с поддержкой многопоточности, что подразумевает его достаточно высокую производительность. Базовая частота процессора при этом составляет 4 ГГц. 2-канальная оперативная память (DDR4) объемом до 128 ГБ увеличивает мощность процессора, позволяя легко решать рабочие задачи. Встроенное в процессор графическое ядро Intel UHD Graphics 610 обеспечит возможность использовать его для работы в стандартных графических программах, просмотра видео в высоком разрешении или несложных игр.&lt;br /&gt;\r\nВ процессе работы у процессора Intel Pentium Gold G6400 OEM соблюдается довольно низкое тепловыделение, за счет чего охлаждающая система будет работать тихо. Для подключения к процессору нужных блоков используется контроллер PCI-E 3.0 с пропускной способностью 8 GT/s. Благодаря тому, что процессор поддерживает технологию виртуализации и 64-битный набор команд (EM64T), его функциональность увеличивается в разы. Ведь ПК с таким процессором может одновременно работать в двух и более операционных системах.&lt;/p&gt;', '', 'AMD', '', 'ЦП'),
(54, 1, 'Intel Core i5-14400F BOX', '&lt;p&gt;Процессор Intel Core i5-14400F BOX оснащается сокетом LGA 1700 и отличается совместимостью с широким рядом актуальных материнских плат. Модель без встроенной графики предполагает эксплуатацию в игровой машине или системном блоке домашней станции с дискретным видеопроцессором для операций с видеоконтентом. 10-ядерный ЦПУ предполагает работу с базовой тактовой частотой 2.5 ГГц и поддерживает турбо-режим для увеличения частоты до 4.7 ГГц.&lt;br /&gt;\r\nРассчитанный на использование в сборке с ОЗУ стандарта DDR4 или DDR5 центральный процессор Intel Core i5-14400F поставляется в комплектации BOX. К модели с наибольшим выделением тепловой энергии на уровне 65 Вт прилагается совместимый воздушный кулер. Радиатор системы охлаждения уже покрыт слоем термоинтерфейса для более полной передачи тепла от процессора к устройству рассеивания.&lt;/p&gt;', '', 'i5', 'цп', ''),
(55, 1, 'Esonic G41CPL3', '&lt;p&gt;Материнская плата Esonic G41CPL3 предназначена для создания компактных домашних и офисных систем. Данная модель выполнена в форм-факторе Micro-ATX, благодаря чему возможно использование миниатюрного корпуса. Плата основана на первоклассных компонентах, что обеспечивает высокую надежность и отказоустойчивость.&lt;br /&gt;\r\nМатеринская плата Esonic G41CPL3 использует в своей основе чипсет Intel G41. Установка процессора производится при помощи сокета LGA 775. Помимо этого модель поддерживает дискретную графику — для нее на плате предусмотрена 1 линия PCI-E x16. Объем оперативной памяти может достигать 8 ГБ, что обусловлено наличием 2 слотов формата DIMM. Дисковая подсистема может быть выполнена при помощи 4 разъемов SATA с пропускной способностью 3 Гбит/с.&lt;br /&gt;\r\nКоммуникационные возможности материнской платы Esonic G41CPL3 представлены модулем Realtek со скоростью передачи данных 100 Мбит/с. Для подключения периферии на корпусе расположены порты USB и VGA. Материнская плата поставляется вместе с заглушкой для задней панели, двумя кабелями SATA и диском с ПО.&lt;/p&gt;', '', 'M', '', 'Мать'),
(56, 1, 'GIGABYTE B450M K', '&lt;p&gt;Материнская плата GIGABYTE B450M K ориентирована на использование в офисных и домашних ПК. Она выполнена в форм-факторе Micro-ATX и подходит для установки в системы с ограниченным пространством. В конфигурацию модели входят разъем AM4, 2 слота под установку оперативной памяти, по одному слоту расширения PCI-E x16 и PCI-E x1 для графических карт, 1 разъем M.2 и 4 слота SATA для устройств хранения.&lt;br /&gt;\r\nПлата оборудована сетевым контроллером 1 Гбит/с для стабильного соединения с Интернетом. С помощью портов и разъемов на боковой стороне можно организовать подключение различных устройств: USB 2.0 и USB 3.2, видеовыход HDMI, разъемы аудио. Благодаря 6-фазной подсистеме питания и надежным компонентам достигается стабильная работа GIGABYTE B450M K.&lt;/p&gt;', '', 'материнка', '', 'мать'),
(57, 1, 'Colorful BATTLE-AX H610M-E WIFI V20', '&lt;p&gt;Материнская плата Colorful BATTLE-AX H610M-E WIFI V20 походит для систем разного назначения. Благодаря компактным размерам 225x194 мм она предусматривает размещение в условиях ограниченного пространства. Модель рассчитана на совместную работу с процессором Intel, 12/13/14 поколения в котором используется сокет LGA 1700. Задействовать до 64 ГБ оперативной памяти позволяют два слота DIMM DDR4. Слоты PCI-E x16 и PCI-E x1 для видеокарт и карт расширения. Для жестких дисков предлагаются 4 разъема SATA и 1 слот M.2.&lt;br /&gt;\r\nДоступ к сети Интернет выполняется по проводному контроллеру Realtek со скоростью 1 Гбит/с и беспроводному WFi 5. Интерфейсы HDMI и VGA (D-Sub) обеспечивают вывод изображения на мониторы. Разъемы USB 2.0 и USB 3.2 Gen1 позволяют подключить к плате клавиатуру, мышь и другие периферийные устройства.&lt;/p&gt;', '', 'материнка', '', 'мать'),
(58, 1, 'GIGABYTE GA-G41M-COMBO-GQ (rev.3)', '&lt;p&gt;Материнская плата GIGABYTE GA-G41M-COMBO-GQ (rev.3) предназначена для построения мультимедийной платформы. В ее основе содержится чипсет Intel G41 Express с графическим адаптером Intel GMA X4500, позволяющий продуктивно справляться с приложениями 3D. Технология Intel Clear Video обеспечивает четкость воспроизведения графики.&lt;br /&gt;\r\nПлата выполнена в форм-факторе Micro-ATX, поэтому отличается компактными размерами и подходит для установки в условиях ограниченного пространства. Для подключения комплектующих предлагаются 4 слота оперативной памяти DDR3, слоты расширения PCI-E x16 и PCI, 4 слота SATA. Из особенностей GIGABYTE GA-G41M-COMBO-GQ отмечаются 7.1-канальный аудиокодек, сетевой контроллер со скоростью 1 Гбит/с, порты USB и видеовыходы.&lt;/p&gt;', '', 'материнка', '', 'мать'),
(59, 1, 'ASUS ROG MAXIMUS Z890 EXTREME', '&lt;p&gt;ROG Maximus Z890 Extreme — это высшее выражение передовых технологий и производительности материнских плат. Откройте для себя верхние пределы процессоров Intel Core Ultra Series 2, модулей DDR5, графических карт PCIe 5.0, хранилища NVMe, USB-подключения, функциональности Thunderbolt и многого другого — все это упаковано в элегантный корпус с полноцветным 5-дюймовым ЖК-экраном, который может отображать яркие изображения или статистику системы в реальном времени в соответствии с вашими личными вкусами.&lt;/p&gt;', '', 'материнка', '', 'мать');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_discount`
--

CREATE TABLE `oc_product_discount` (
  `product_discount_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL DEFAULT '0',
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_discount`
--

INSERT INTO `oc_product_discount` (`product_discount_id`, `product_id`, `customer_group_id`, `quantity`, `priority`, `price`, `date_start`, `date_end`) VALUES
(438, 42, 1, 10, 1, 88.0000, '0000-00-00', '0000-00-00'),
(439, 42, 1, 20, 1, 77.0000, '0000-00-00', '0000-00-00'),
(440, 42, 1, 30, 1, 66.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_filter`
--

CREATE TABLE `oc_product_filter` (
  `product_id` int(11) NOT NULL,
  `filter_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_image`
--

CREATE TABLE `oc_product_image` (
  `product_image_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_image`
--

INSERT INTO `oc_product_image` (`product_image_id`, `product_id`, `image`, `sort_order`) VALUES
(1968, 43, 'catalog/demo/macbook_3.jpg', 0),
(1969, 43, 'catalog/demo/macbook_2.jpg', 0),
(1970, 43, 'catalog/demo/macbook_4.jpg', 0),
(1971, 43, 'catalog/demo/macbook_5.jpg', 0),
(1972, 44, 'catalog/demo/macbook_air_3.jpg', 0),
(1973, 44, 'catalog/demo/macbook_air_2.jpg', 0),
(1974, 44, 'catalog/demo/macbook_air_4.jpg', 0),
(1975, 45, 'catalog/demo/macbook_pro_4.jpg', 0),
(1976, 45, 'catalog/demo/macbook_pro_3.jpg', 0),
(1977, 45, 'catalog/demo/macbook_pro_2.jpg', 0),
(1978, 40, 'catalog/demo/iphone_4.jpg', 0),
(1979, 40, 'catalog/demo/iphone_3.jpg', 0),
(1980, 40, 'catalog/demo/iphone_5.jpg', 0),
(1981, 40, 'catalog/demo/iphone_2.jpg', 0),
(1982, 40, 'catalog/demo/iphone_6.jpg', 0),
(1983, 31, 'catalog/demo/nikon_d300_5.jpg', 0),
(1984, 31, 'catalog/demo/nikon_d300_4.jpg', 0),
(1985, 31, 'catalog/demo/nikon_d300_2.jpg', 0),
(1986, 31, 'catalog/demo/nikon_d300_3.jpg', 0),
(1987, 29, 'catalog/demo/palm_treo_pro_2.jpg', 0),
(1988, 29, 'catalog/demo/palm_treo_pro_3.jpg', 0),
(1989, 48, 'catalog/demo/ipod_classic_2.jpg', 0),
(1990, 48, 'catalog/demo/ipod_classic_3.jpg', 0),
(1991, 48, 'catalog/demo/ipod_classic_4.jpg', 0),
(1992, 46, 'catalog/demo/sony_vaio_3.jpg', 0),
(1993, 46, 'catalog/demo/sony_vaio_2.jpg', 0),
(1994, 46, 'catalog/demo/sony_vaio_4.jpg', 0),
(1995, 46, 'catalog/demo/sony_vaio_5.jpg', 0),
(1998, 36, 'catalog/demo/ipod_nano_3.jpg', 0),
(1999, 36, 'catalog/demo/ipod_nano_2.jpg', 0),
(2000, 36, 'catalog/demo/ipod_nano_4.jpg', 0),
(2001, 36, 'catalog/demo/ipod_nano_5.jpg', 0),
(2002, 34, 'catalog/demo/ipod_shuffle_3.jpg', 0),
(2003, 34, 'catalog/demo/ipod_shuffle_2.jpg', 0),
(2004, 34, 'catalog/demo/ipod_shuffle_4.jpg', 0),
(2005, 34, 'catalog/demo/ipod_shuffle_5.jpg', 0),
(2006, 32, 'catalog/demo/ipod_touch_4.jpg', 0),
(2007, 32, 'catalog/demo/ipod_touch_3.jpg', 0),
(2008, 32, 'catalog/demo/ipod_touch_2.jpg', 0),
(2009, 32, 'catalog/demo/ipod_touch_5.jpg', 0),
(2010, 32, 'catalog/demo/ipod_touch_6.jpg', 0),
(2011, 32, 'catalog/demo/ipod_touch_7.jpg', 0),
(2034, 28, 'catalog/demo/htc_touch_hd_3.jpg', 0),
(2035, 28, 'catalog/demo/htc_touch_hd_2.jpg', 0),
(2313, 42, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2314, 42, 'catalog/demo/canon_eos_5d_1.jpg', 0),
(2315, 42, 'catalog/demo/compaq_presario.jpg', 0),
(2316, 42, 'catalog/demo/hp_1.jpg', 0),
(2317, 42, 'catalog/demo/canon_logo.jpg', 0),
(2320, 47, 'catalog/demo/hp_2.jpg', 0),
(2321, 47, 'catalog/demo/hp_3.jpg', 0),
(2322, 49, 'catalog/demo/samsung_tab_2.jpg', 0),
(2323, 49, 'catalog/demo/samsung_tab_3.jpg', 0),
(2324, 49, 'catalog/demo/samsung_tab_4.jpg', 0),
(2325, 49, 'catalog/demo/samsung_tab_5.jpg', 0),
(2326, 49, 'catalog/demo/samsung_tab_6.jpg', 0),
(2327, 49, 'catalog/demo/samsung_tab_7.jpg', 0),
(2344, 30, 'catalog/demo/canon_eos_5d_3.jpg', 0),
(2345, 30, 'catalog/demo/canon_eos_5d_2.jpg', 0),
(2350, 41, 'catalog/demo/imac_2.jpg', 0),
(2351, 41, 'catalog/demo/imac_3.jpg', 0),
(2352, 50, 'catalog/77ce0ec8afb75a87b816b6e86c8a2ee2b4ba3a1365d1b872ffea13e24a0fc6b0.jpg.webp', 0),
(2357, 51, 'catalog/processori/06b042f705c582395426ad35178afa816286120b2a0621e61e8c9fa57ca5cfe4.jpg.webp', 0),
(2358, 51, 'catalog/b4658d0a829301e70c8001be5648a677244235ba90e8f6120c35eedba063b1b3.jpg.webp', 0),
(2359, 52, 'catalog/0a1e2199b0c1ff7cf8501516130eb4826ec306e25b1ac51433c01cee83f6ba69.jpg.webp', 0),
(2360, 52, 'catalog/b4658d0a829301e70c8001be5648a677244235ba90e8f6120c35eedba063b1b3.jpg.webp', 0),
(2361, 53, 'catalog/processori/6b29557399e4c31ae1d10b7567a7816934c5199129c6b8223d4baa6d5c2f72af.jpg.webp', 0),
(2362, 54, 'catalog/processori/39190dc9206a37788ba74676fcab0d4a0bfb90d800ddd763edc593c022984e14.jpg.webp', 0),
(2363, 54, 'catalog/processori/1299715f7ca86225c39cb37efe867684cbc3ff66cdbafdd63053c0a6f33fbf2a.jpg.webp', 0),
(2364, 55, 'catalog/mat/c48951decf71b7e71e6f92b3354997102c1b8343cd23cfc9867117f940499126.jpg.webp', 0),
(2365, 55, 'catalog/mat/fddbce42a3b87fb370a6e54c28122efb08fac385e4e722d873f3d47b9f0d2cda.jpg.webp', 0),
(2366, 56, 'catalog/mat/084dcb599700ca59237672b42e58bad761a4333904a72306046405e1465d8c7f.jpg.webp', 0),
(2367, 56, 'catalog/mat/fddbce42a3b87fb370a6e54c28122efb08fac385e4e722d873f3d47b9f0d2cda.jpg.webp', 0),
(2368, 57, 'catalog/mat/69f115743b4250f64262bd58ee84ff0661ad8b99ecc13c73e6ea465951b14367.jpg.webp', 0),
(2369, 57, 'catalog/mat/9f2d43656a8e2f5b6f0fca172a3526570528875554ce13b94fd20edcc7d11443.jpg.webp', 0),
(2370, 58, 'catalog/mat/6b86b6862653aae76fc757f7ddf1b8c4ee6c464169f8a3a7d10ffc4c944e273d.jpg.webp', 0),
(2371, 58, 'catalog/mat/d9f535c00bab85002a1179a40aed218c932f678ae7b8fbad734c06d345c9cf3d.jpg.webp', 0),
(2372, 59, 'catalog/mat/9042db65fea8c3053c4daabd1c60bd4a16fccfbb4b5722a1b724618141bc458b.jpg.webp', 0),
(2373, 59, 'catalog/mat/1145f432375a4c82d487175d24911299d938f4cdc55957f7c95e24653998295a.jpg.webp', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option`
--

CREATE TABLE `oc_product_option` (
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `required` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_option`
--

INSERT INTO `oc_product_option` (`product_option_id`, `product_id`, `option_id`, `value`, `required`) VALUES
(208, 42, 4, 'test', 1),
(209, 42, 6, '', 1),
(217, 42, 5, '', 1),
(218, 42, 1, '', 1),
(219, 42, 8, '2011-02-20', 1),
(220, 42, 10, '2011-02-20 22:25', 1),
(221, 42, 9, '22:25', 1),
(222, 42, 7, '', 1),
(223, 42, 2, '', 1),
(224, 35, 11, '', 1),
(225, 47, 12, '2011-04-22', 1),
(226, 30, 5, '', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_option_value`
--

CREATE TABLE `oc_product_option_value` (
  `product_option_value_id` int(11) NOT NULL,
  `product_option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `option_value_id` int(11) NOT NULL,
  `quantity` int(3) NOT NULL,
  `subtract` tinyint(1) NOT NULL,
  `price` decimal(15,4) NOT NULL,
  `price_prefix` varchar(1) NOT NULL,
  `points` int(8) NOT NULL,
  `points_prefix` varchar(1) NOT NULL,
  `weight` decimal(15,8) NOT NULL,
  `weight_prefix` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_option_value`
--

INSERT INTO `oc_product_option_value` (`product_option_value_id`, `product_option_id`, `product_id`, `option_id`, `option_value_id`, `quantity`, `subtract`, `price`, `price_prefix`, `points`, `points_prefix`, `weight`, `weight_prefix`) VALUES
(1, 217, 42, 5, 41, 100, 0, 1.0000, '+', 0, '+', 1.00000000, '+'),
(2, 217, 42, 5, 42, 200, 1, 2.0000, '+', 0, '+', 2.00000000, '+'),
(3, 217, 42, 5, 40, 300, 0, 3.0000, '+', 0, '+', 3.00000000, '+'),
(4, 217, 42, 5, 39, 92, 1, 4.0000, '+', 0, '+', 4.00000000, '+'),
(5, 218, 42, 1, 32, 96, 1, 10.0000, '+', 1, '+', 10.00000000, '+'),
(6, 218, 42, 1, 31, 146, 1, 20.0000, '+', 2, '-', 20.00000000, '+'),
(7, 218, 42, 1, 43, 300, 1, 30.0000, '+', 3, '+', 30.00000000, '+'),
(8, 223, 42, 2, 23, 48, 1, 10.0000, '+', 0, '+', 10.00000000, '+'),
(9, 223, 42, 2, 24, 194, 1, 20.0000, '+', 0, '+', 20.00000000, '+'),
(10, 223, 42, 2, 44, 2696, 1, 30.0000, '+', 0, '+', 30.00000000, '+'),
(11, 223, 42, 2, 45, 3998, 1, 40.0000, '+', 0, '+', 40.00000000, '+'),
(12, 224, 35, 11, 46, 0, 1, 5.0000, '+', 0, '+', 0.00000000, '+'),
(13, 224, 35, 11, 47, 10, 1, 10.0000, '+', 0, '+', 0.00000000, '+'),
(14, 224, 35, 11, 48, 15, 1, 15.0000, '+', 0, '+', 0.00000000, '+'),
(15, 226, 30, 5, 39, 2, 1, 0.0000, '+', 0, '+', 0.00000000, '+'),
(16, 226, 30, 5, 40, 5, 1, 0.0000, '+', 0, '+', 0.00000000, '+');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_related`
--

CREATE TABLE `oc_product_related` (
  `product_id` int(11) NOT NULL,
  `related_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_related`
--

INSERT INTO `oc_product_related` (`product_id`, `related_id`) VALUES
(40, 42),
(41, 42),
(42, 40),
(42, 41);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_report`
--

CREATE TABLE `oc_product_report` (
  `product_report_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `ip` varchar(40) NOT NULL,
  `country` varchar(2) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_reward`
--

CREATE TABLE `oc_product_reward` (
  `product_reward_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL DEFAULT '0',
  `customer_group_id` int(11) NOT NULL DEFAULT '0',
  `points` int(8) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_reward`
--

INSERT INTO `oc_product_reward` (`product_reward_id`, `product_id`, `customer_group_id`, `points`) VALUES
(329, 43, 1, 600),
(331, 44, 1, 700),
(333, 45, 1, 800),
(335, 40, 1, 0),
(337, 31, 1, 0),
(339, 29, 1, 0),
(343, 48, 1, 0),
(345, 33, 1, 0),
(347, 46, 1, 0),
(351, 36, 1, 0),
(353, 34, 1, 0),
(355, 32, 1, 0),
(379, 28, 1, 400),
(425, 35, 1, 0),
(515, 42, 1, 100),
(519, 47, 1, 300),
(521, 49, 1, 1000),
(539, 30, 1, 200),
(545, 41, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_special`
--

CREATE TABLE `oc_product_special` (
  `product_special_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1',
  `price` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `date_start` date NOT NULL,
  `date_end` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_special`
--

INSERT INTO `oc_product_special` (`product_special_id`, `product_id`, `customer_group_id`, `priority`, `price`, `date_start`, `date_end`) VALUES
(419, 42, 1, 1, 90.0000, '0000-00-00', '0000-00-00'),
(438, 30, 1, 1, 80.0000, '0000-00-00', '0000-00-00'),
(439, 30, 1, 2, 90.0000, '0000-00-00', '0000-00-00');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_subscription`
--

CREATE TABLE `oc_product_subscription` (
  `product_id` int(11) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `price` decimal(10,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_category`
--

CREATE TABLE `oc_product_to_category` (
  `product_id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_to_category`
--

INSERT INTO `oc_product_to_category` (`product_id`, `category_id`) VALUES
(43, 18),
(44, 18),
(45, 18),
(46, 18),
(47, 18),
(28, 20),
(29, 20),
(30, 20),
(33, 20),
(35, 20),
(40, 20),
(42, 20),
(43, 20),
(44, 20),
(46, 20),
(47, 20),
(48, 20),
(28, 24),
(29, 24),
(40, 24),
(41, 27),
(33, 28),
(42, 28),
(30, 33),
(31, 33),
(32, 34),
(34, 34),
(36, 34),
(48, 34),
(49, 57),
(50, 59),
(51, 59),
(52, 59),
(53, 59),
(54, 59),
(55, 61),
(56, 61),
(57, 61),
(58, 61),
(59, 61);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_download`
--

CREATE TABLE `oc_product_to_download` (
  `product_id` int(11) NOT NULL,
  `download_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_layout`
--

CREATE TABLE `oc_product_to_layout` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `layout_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_to_layout`
--

INSERT INTO `oc_product_to_layout` (`product_id`, `store_id`, `layout_id`) VALUES
(50, 0, 0),
(51, 0, 0),
(52, 0, 0),
(53, 0, 0),
(54, 0, 0),
(55, 0, 0),
(56, 0, 0),
(57, 0, 0),
(58, 0, 0),
(59, 0, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_to_store`
--

CREATE TABLE `oc_product_to_store` (
  `product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_product_to_store`
--

INSERT INTO `oc_product_to_store` (`product_id`, `store_id`) VALUES
(28, 0),
(29, 0),
(30, 0),
(31, 0),
(32, 0),
(33, 0),
(34, 0),
(35, 0),
(36, 0),
(40, 0),
(41, 0),
(42, 0),
(43, 0),
(44, 0),
(45, 0),
(46, 0),
(47, 0),
(48, 0),
(49, 0),
(50, 0),
(51, 0),
(52, 0),
(53, 0),
(54, 0),
(55, 0),
(56, 0),
(57, 0),
(58, 0),
(59, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_product_viewed`
--

CREATE TABLE `oc_product_viewed` (
  `product_id` int(11) NOT NULL,
  `viewed` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return`
--

CREATE TABLE `oc_return` (
  `return_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `telephone` varchar(32) NOT NULL,
  `product` varchar(255) NOT NULL,
  `model` varchar(64) NOT NULL,
  `quantity` int(4) NOT NULL,
  `opened` tinyint(1) NOT NULL,
  `return_reason_id` int(11) NOT NULL,
  `return_action_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `comment` text NOT NULL,
  `date_ordered` date NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_action`
--

CREATE TABLE `oc_return_action` (
  `return_action_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_return_action`
--

INSERT INTO `oc_return_action` (`return_action_id`, `language_id`, `name`) VALUES
(1, 1, 'Возвращены средства'),
(2, 1, 'Выдан в кредит'),
(3, 1, 'Отправлен другой товар для замены');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_history`
--

CREATE TABLE `oc_return_history` (
  `return_history_id` int(11) NOT NULL,
  `return_id` int(11) NOT NULL,
  `return_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL,
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_reason`
--

CREATE TABLE `oc_return_reason` (
  `return_reason_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_return_reason`
--

INSERT INTO `oc_return_reason` (`return_reason_id`, `language_id`, `name`) VALUES
(1, 1, 'Получен/доставлен неисправным (сломан)'),
(2, 1, 'Получен не тот (ошибочный) товар'),
(3, 1, 'Ошибочный заказ'),
(4, 1, 'Ошибка, пожалуйста укажите/приложите подробности'),
(5, 1, 'Другое (другая причина), пожалуйста укажите/приложите подробности');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_return_status`
--

CREATE TABLE `oc_return_status` (
  `return_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_return_status`
--

INSERT INTO `oc_return_status` (`return_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Рассматриваемый'),
(2, 1, 'Заказ в ожидании'),
(3, 1, 'Готов (к отправке)');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_review`
--

CREATE TABLE `oc_review` (
  `review_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `author` varchar(64) NOT NULL,
  `text` text NOT NULL,
  `rating` int(1) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_seo_url`
--

CREATE TABLE `oc_seo_url` (
  `seo_url_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` varchar(255) NOT NULL,
  `keyword` varchar(768) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_seo_url`
--

INSERT INTO `oc_seo_url` (`seo_url_id`, `store_id`, `language_id`, `key`, `value`, `keyword`, `sort_order`) VALUES
(1, 0, 1, 'product_id', '47', 'hp-lp3065', 1),
(2, 0, 1, 'product_id', '48', 'ipod-classic', 1),
(3, 0, 1, 'product_id', '28', 'htc-touch-hd', 1),
(4, 0, 1, 'product_id', '43', 'macbook', 1),
(5, 0, 1, 'product_id', '44', 'macbook-air', 1),
(6, 0, 1, 'product_id', '45', 'macbook-pro', 1),
(7, 0, 1, 'product_id', '30', 'canon-eos-5d', 1),
(8, 0, 1, 'product_id', '31', 'nikon-d300', 1),
(9, 0, 1, 'product_id', '29', 'palm-treo-pro', 1),
(10, 0, 1, 'product_id', '35', 'product-8', 1),
(11, 0, 1, 'product_id', '49', 'samsung-galaxy-tab-10-1', 1),
(12, 0, 1, 'product_id', '33', 'samsung-syncmaster-941bw', 1),
(13, 0, 1, 'product_id', '46', 'sony-vaio', 1),
(14, 0, 1, 'product_id', '41', 'imac', 1),
(15, 0, 1, 'product_id', '40', 'iphone', 1),
(16, 0, 1, 'product_id', '36', 'ipod-nano', 1),
(17, 0, 1, 'product_id', '34', 'ipod-shuffle', 1),
(18, 0, 1, 'product_id', '32', 'ipod-touch', 1),
(19, 0, 1, 'product_id', '50', 'apple-4', 1),
(20, 0, 1, 'product_id', '42', 'apple-cinema', 1),
(21, 0, 1, 'manufacturer_id', '5', 'htc', 0),
(22, 0, 1, 'manufacturer_id', '7', 'hewlett-packard', 0),
(23, 0, 1, 'manufacturer_id', '6', 'palm', 0),
(24, 0, 1, 'manufacturer_id', '10', 'sony', 0),
(25, 0, 1, 'manufacturer_id', '9', 'canon', 0),
(26, 0, 1, 'manufacturer_id', '8', 'apple', 0),
(27, 0, 1, 'path', '30', 'printer', 0),
(28, 0, 1, 'path', '20_27', 'desktops/mac', 0),
(29, 0, 1, 'path', '20_26', 'desktops/pc', 0),
(30, 0, 1, 'path', '25', 'component', 0),
(31, 0, 1, 'path', '25_29', 'component/mouse', 0),
(32, 0, 1, 'path', '33', 'cameras', 0),
(33, 0, 1, 'path', '25_28', 'component/monitor', 0),
(34, 0, 1, 'path', '25_28_35', 'component/monitor/test-1', 0),
(35, 0, 1, 'path', '25_28_36', 'component/monitor/test-2', 0),
(36, 0, 1, 'path', '25_30', 'component/printers', 0),
(37, 0, 1, 'path', '25_31', 'component/scanner', 0),
(38, 0, 1, 'path', '25_32', 'component/web-camera', 0),
(39, 0, 1, 'path', '20', 'desktops', 0),
(40, 0, 1, 'path', '18', 'laptop-notebook', 0),
(41, 0, 1, 'path', '18_46', 'laptop-notebook/macs', 0),
(42, 0, 1, 'path', '18_45', 'laptop-notebook/windows', 0),
(43, 0, 1, 'path', '34', 'mp3-players', 0),
(44, 0, 1, 'path', '34_43', 'mp3-players/test-11', 0),
(45, 0, 1, 'path', '34_44', 'mp3-players/test-12', 0),
(46, 0, 1, 'path', '34_47', 'mp3-players/test-15', 0),
(47, 0, 1, 'path', '34_48', 'mp3-players/test-16', 0),
(48, 0, 1, 'path', '34_49', 'mp3-players/test-17', 0),
(49, 0, 1, 'path', '34_50', 'mp3-players/test-18', 0),
(50, 0, 1, 'path', '34_51', 'mp3-players/test-19', 0),
(51, 0, 1, 'path', '34_52', 'mp3-players/test-20', 0),
(52, 0, 1, 'path', '34_52_58', 'mp3-players/test-20/test-25', 0),
(53, 0, 1, 'path', '34_53', 'mp3-players/test-21', 0),
(54, 0, 1, 'path', '34_54', 'mp3-players/test-22', 0),
(55, 0, 1, 'path', '34_55', 'mp3-players/test-23', 0),
(56, 0, 1, 'path', '34_56', 'mp3-players/test-24', 0),
(57, 0, 1, 'path', '34_38', 'mp3-players/test-4', 0),
(58, 0, 1, 'path', '34_37', 'mp3-players/test-5', 0),
(59, 0, 1, 'path', '34_39', 'mp3-players/test-6', 0),
(60, 0, 1, 'path', '34_40', 'mp3-players/test-7', 0),
(61, 0, 1, 'path', '34_41', 'mp3-players/test-8', 0),
(62, 0, 1, 'path', '34_42', 'mp3-players/test-9', 0),
(63, 0, 1, 'path', '24', 'smartphone', 0),
(64, 0, 1, 'path', '17', 'software', 0),
(65, 0, 1, 'path', '57', 'tablet', 0),
(66, 0, 1, 'information_id', '1', 'about-us', 0),
(67, 0, 1, 'information_id', '2', 'terms', 0),
(68, 0, 1, 'information_id', '4', 'delivery', 0),
(69, 0, 1, 'information_id', '3', 'privacy', 0),
(70, 0, 1, 'language', 'ru-ru', '', -2),
(71, 0, 1, 'route', 'information/information.info', 'info', 0),
(72, 0, 1, 'route', 'information/information', 'information', -1),
(73, 0, 1, 'route', 'product/product', 'product', -1),
(74, 0, 1, 'route', 'product/category', 'catalog', -1),
(75, 0, 1, 'route', 'product/manufacturer', 'brands', -1),
(76, 0, 1, 'route', 'product/manufacturer.info', 'brand', -1),
(77, 0, 1, 'route', 'common/home', '', 0),
(78, 0, 1, 'route', 'information/contact', 'contact', 0),
(79, 0, 1, 'route', 'information/gdpr', 'gdpr', 0),
(80, 0, 1, 'route', 'account/returns.add', 'returns-add', 0),
(81, 0, 1, 'route', 'information/sitemap', 'sitemap', 0),
(82, 0, 1, 'route', 'checkout/voucher', 'voucher', 0),
(83, 0, 1, 'route', 'account/affiliate', 'affiliate', 0),
(84, 0, 1, 'route', 'product/special', 'special', 0),
(85, 0, 1, 'route', 'account/login', 'login', 0),
(86, 0, 1, 'route', 'account/account', 'account', 0),
(87, 0, 1, 'route', 'account/order', 'order', 0),
(88, 0, 1, 'route', 'account/wishlist', 'wishlist', 0),
(89, 0, 1, 'route', 'account/newsletter', 'newsletter', 0),
(90, 0, 1, 'route', 'account/register', 'register', 0),
(91, 0, 1, 'route', 'account/forgotten', 'forgotten', 0),
(92, 0, 1, 'route', 'account/address', 'address', 0),
(93, 0, 1, 'route', 'account/download', 'download', 0),
(94, 0, 1, 'route', 'account/subscription', 'subscription', 0),
(95, 0, 1, 'route', 'account/reward', 'reward', 0),
(96, 0, 1, 'route', 'account/returns', 'returns', 0),
(97, 0, 1, 'route', 'account/transaction', 'transaction', 0),
(98, 0, 1, 'route', 'account/edit', 'edit', 0),
(99, 0, 1, 'route', 'account/password', 'password', 0),
(100, 0, 1, 'route', 'checkout/cart', 'cart', 0),
(101, 0, 1, 'route', 'checkout/checkout', 'checkout', 0),
(102, 0, 1, 'route', 'cms/blog', 'blogs', -1),
(103, 0, 1, 'route', 'cms/blog.info', 'blog', -1),
(104, 0, 1, 'route', 'product/search', 'search', 0),
(106, 0, 1, 'path', '25_59', 'component/processory', 0),
(107, 0, 1, 'product_id', '50', 'intel-core-i5-12400f-oem', 0),
(108, 0, 1, 'path', '25_60', 'component/videokarty', 0),
(109, 0, 1, 'path', '25_61', 'component/materisnkie-platy', 0),
(112, 0, 1, 'product_id', '51', 'amd-fx-4300-box', 0),
(113, 0, 1, 'product_id', '52', 'ua', 0),
(114, 0, 1, 'product_id', '53', 'intel-pentium-gold-g6400-oem', 0),
(115, 0, 1, 'product_id', '54', 'intel-core-i5-14400f-box', 0),
(116, 0, 1, 'product_id', '55', 'esonic-g41cpl3', 0),
(117, 0, 1, 'product_id', '56', 'gigabyte-b450m-k', 0),
(118, 0, 1, 'product_id', '57', 'colorful-battle-ax-h610m-e-wifi-v20', 0),
(119, 0, 1, 'product_id', '58', 'gigabyte-ga-g41m-combo-gq-rev-3', 0),
(120, 0, 1, 'product_id', '59', 'asus-rog-maximus-z890-extreme', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_session`
--

CREATE TABLE `oc_session` (
  `session_id` varchar(32) NOT NULL,
  `data` text NOT NULL,
  `expire` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_session`
--

INSERT INTO `oc_session` (`session_id`, `data`, `expire`) VALUES
('8409bb58dc921abfb1a5c13358', '{\"currency\":\"RUB\",\"user_id\":\"1\",\"user_token\":\"0ad69417576e36a69bff25efe99cd68a\",\"start_file_manager\":null,\"directory_file_manager\":\"mat\",\"page_file_manager\":null,\"review_token\":\"9f954c59b1624089df7847c5b8b9f05c\"}', '2024-12-26 12:20:13'),
('d3b9385fa70d2ca22354a4a7f4', '{\"currency\":\"RUB\"}', '2024-12-26 09:20:33');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_setting`
--

CREATE TABLE `oc_setting` (
  `setting_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0',
  `code` varchar(128) NOT NULL,
  `key` varchar(128) NOT NULL,
  `value` text NOT NULL,
  `serialized` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_setting`
--

INSERT INTO `oc_setting` (`setting_id`, `store_id`, `code`, `key`, `value`, `serialized`) VALUES
(1, 0, 'config', 'config_robots', 'abot\r\ndbot\r\nebot\r\nhbot\r\nkbot\r\nlbot\r\nmbot\r\nnbot\r\nobot\r\npbot\r\nrbot\r\nsbot\r\ntbot\r\nvbot\r\nybot\r\nzbot\r\nbot.\r\nbot/\r\n_bot\r\n.bot\r\n/bot\r\n-bot\r\n:bot\r\n(bot\r\ncrawl\r\nslurp\r\nspider\r\nseek\r\naccoona\r\nacoon\r\nadressendeutschland\r\nah-ha.com\r\nahoy\r\naltavista\r\nananzi\r\nanthill\r\nappie\r\narachnophilia\r\narale\r\naraneo\r\naranha\r\narchitext\r\naretha\r\narks\r\nasterias\r\natlocal\r\natn\r\natomz\r\naugurfind\r\nbackrub\r\nbannana_bot\r\nbaypup\r\nbdfetch\r\nbig brother\r\nbiglotron\r\nbjaaland\r\nblackwidow\r\nblaiz\r\nblog\r\nblo.\r\nbloodhound\r\nboitho\r\nbooch\r\nbradley\r\nbutterfly\r\ncalif\r\ncassandra\r\nccubee\r\ncfetch\r\ncharlotte\r\nchurl\r\ncienciaficcion\r\ncmc\r\ncollective\r\ncomagent\r\ncombine\r\ncomputingsite\r\ncsci\r\ncurl\r\ncusco\r\ndaumoa\r\ndeepindex\r\ndelorie\r\ndepspid\r\ndeweb\r\ndie blinde kuh\r\ndigger\r\nditto\r\ndmoz\r\ndocomo\r\ndownload express\r\ndtaagent\r\ndwcp\r\nebiness\r\nebingbong\r\ne-collector\r\nejupiter\r\nemacs-w3 search engine\r\nesther\r\nevliya celebi\r\nezresult\r\nfalcon\r\nfelix ide\r\nferret\r\nfetchrover\r\nfido\r\nfindlinks\r\nfireball\r\nfish search\r\nfouineur\r\nfunnelweb\r\ngazz\r\ngcreep\r\ngenieknows\r\ngetterroboplus\r\ngeturl\r\nglx\r\ngoforit\r\ngolem\r\ngrabber\r\ngrapnel\r\ngralon\r\ngriffon\r\ngromit\r\ngrub\r\ngulliver\r\nhamahakki\r\nharvest\r\nhavindex\r\nhelix\r\nheritrix\r\nhku www octopus\r\nhomerweb\r\nhtdig\r\nhtml index\r\nhtml_analyzer\r\nhtmlgobble\r\nhubater\r\nhyper-decontextualizer\r\nia_archiver\r\nibm_planetwide\r\nichiro\r\niconsurf\r\niltrovatore\r\nimage.kapsi.net\r\nimagelock\r\nincywincy\r\nindexer\r\ninfobee\r\ninformant\r\ningrid\r\ninktomisearch.com\r\ninspector web\r\nintelliagent\r\ninternet shinchakubin\r\nip3000\r\niron33\r\nisraeli-search\r\nivia\r\njack\r\njakarta\r\njavabee\r\njetbot\r\njumpstation\r\nkatipo\r\nkdd-explorer\r\nkilroy\r\nknowledge\r\nkototoi\r\nkretrieve\r\nlabelgrabber\r\nlachesis\r\nlarbin\r\nlegs\r\nlibwww\r\nlinkalarm\r\nlink validator\r\nlinkscan\r\nlockon\r\nlwp\r\nlycos\r\nmagpie\r\nmantraagent\r\nmapoftheinternet\r\nmarvin/\r\nmattie\r\nmediafox\r\nmediapartners\r\nmercator\r\nmerzscope\r\nmicrosoft url control\r\nminirank\r\nmiva\r\nmj12\r\nmnogosearch\r\nmoget\r\nmonster\r\nmoose\r\nmotor\r\nmultitext\r\nmuncher\r\nmuscatferret\r\nmwd.search\r\nmyweb\r\nnajdi\r\nnameprotect\r\nnationaldirectory\r\nnazilla\r\nncsa beta\r\nnec-meshexplorer\r\nnederland.zoek\r\nnetcarta webmap engine\r\nnetmechanic\r\nnetresearchserver\r\nnetscoop\r\nnewscan-online\r\nnhse\r\nnokia6682/\r\nnomad\r\nnoyona\r\nnutch\r\nnzexplorer\r\nobjectssearch\r\noccam\r\nomni\r\nopen text\r\nopenfind\r\nopenintelligencedata\r\norb search\r\nosis-project\r\npack rat\r\npageboy\r\npagebull\r\npage_verifier\r\npanscient\r\nparasite\r\npartnersite\r\npatric\r\npear.\r\npegasus\r\nperegrinator\r\npgp key agent\r\nphantom\r\nphpdig\r\npicosearch\r\npiltdownman\r\npimptrain\r\npinpoint\r\npioneer\r\npiranha\r\nplumtreewebaccessor\r\npogodak\r\npoirot\r\npompos\r\npoppelsdorf\r\npoppi\r\npopular iconoclast\r\npsycheclone\r\npublisher\r\npython\r\nrambler\r\nraven search\r\nroach\r\nroad runner\r\nroadhouse\r\nrobbie\r\nrobofox\r\nrobozilla\r\nrules\r\nsalty\r\nsbider\r\nscooter\r\nscoutjet\r\nscrubby\r\nsearch.\r\nsearchprocess\r\nsemanticdiscovery\r\nsenrigan\r\nsg-scout\r\nshai\'hulud\r\nshark\r\nshopwiki\r\nsidewinder\r\nsift\r\nsilk\r\nsimmany\r\nsite searcher\r\nsite valet\r\nsitetech-rover\r\nskymob.com\r\nsleek\r\nsmartwit\r\nsna-\r\nsnappy\r\nsnooper\r\nsohu\r\nspeedfind\r\nsphere\r\nsphider\r\nspinner\r\nspyder\r\nsteeler/\r\nsuke\r\nsuntek\r\nsupersnooper\r\nsurfnomore\r\nsven\r\nsygol\r\nszukacz\r\ntach black widow\r\ntarantula\r\ntempleton\r\n/teoma\r\nt-h-u-n-d-e-r-s-t-o-n-e\r\ntheophrastus\r\ntitan\r\ntitin\r\ntkwww\r\ntoutatis\r\nt-rex\r\ntutorgig\r\ntwiceler\r\ntwisted\r\nucsd\r\nudmsearch\r\nurl check\r\nupdated\r\nvagabondo\r\nvalkyrie\r\nverticrawl\r\nvictoria\r\nvision-search\r\nvolcano\r\nvoyager/\r\nvoyager-hc\r\nw3c_validator\r\nw3m2\r\nw3mir\r\nwalker\r\nwallpaper\r\nwanderer\r\nwauuu\r\nwavefire\r\nweb core\r\nweb hopper\r\nweb wombat\r\nwebbandit\r\nwebcatcher\r\nwebcopy\r\nwebfoot\r\nweblayers\r\nweblinker\r\nweblog monitor\r\nwebmirror\r\nwebmonkey\r\nwebquest\r\nwebreaper\r\nwebsitepulse\r\nwebsnarf\r\nwebstolperer\r\nwebvac\r\nwebwalk\r\nwebwatch\r\nwebwombat\r\nwebzinger\r\nwhizbang\r\nwhowhere\r\nwild ferret\r\nworldlight\r\nwwwc\r\nwwwster\r\nxenu\r\nxget\r\nxift\r\nxirq\r\nyandex\r\nyanga\r\nyeti\r\nyodao\r\nzao\r\nzippp\r\nzyborg', 0),
(2, 0, 'config', 'config_shared', '0', 0),
(3, 0, 'config', 'config_fraud_detection', '0', 0),
(4, 0, 'config', 'config_meta_title', 'Интернет магазин Opencart &quot;Русская сборка&quot;', 0),
(5, 0, 'config', 'config_session_expire', '86400', 0),
(6, 0, 'config', 'config_session_samesite', 'Strict', 0),
(7, 0, 'config', 'config_meta_description', 'Мой магазин', 0),
(8, 0, 'config', 'config_meta_keyword', '', 0),
(9, 0, 'config', 'config_theme', 'basic', 0),
(10, 0, 'config', 'config_layout_id', '4', 0),
(11, 0, 'config', 'config_country_id', '176', 0),
(12, 0, 'config', 'config_zone_id', '0', 0),
(13, 0, 'config', 'config_timezone', 'UTC', 0),
(14, 0, 'config', 'config_language', 'ru-ru', 0),
(15, 0, 'config', 'config_language_admin', 'ru-ru', 0),
(16, 0, 'config', 'config_currency', 'RUB', 0),
(17, 0, 'config', 'config_currency_auto', '0', 0),
(18, 0, 'config', 'config_currency_engine', 'ecb', 0),
(19, 0, 'config', 'config_length_class_id', '1', 0),
(20, 0, 'config', 'config_weight_class_id', '1', 0),
(21, 0, 'config', 'config_product_description_length', '100', 0),
(22, 0, 'config', 'config_pagination', '10', 0),
(23, 0, 'config', 'config_pagination_admin', '10', 0),
(24, 0, 'config', 'config_product_count', '1', 0),
(25, 0, 'config', 'config_review_status', '1', 0),
(26, 0, 'config', 'config_review_guest', '1', 0),
(27, 0, 'config', 'config_voucher_min', '1', 0),
(28, 0, 'config', 'config_voucher_max', '1000', 0),
(29, 0, 'config', 'config_cookie_id', '0', 0),
(30, 0, 'config', 'config_gdpr_id', '3', 0),
(31, 0, 'config', 'config_gdpr_limit', '180', 0),
(32, 0, 'config', 'config_tax', '0', 0),
(33, 0, 'config', 'config_tax_default', 'shipping', 0),
(34, 0, 'config', 'config_tax_customer', 'shipping', 0),
(35, 0, 'config', 'config_customer_online', '0', 0),
(36, 0, 'config', 'config_customer_online_expire', '1', 0),
(37, 0, 'config', 'config_customer_activity', '0', 0),
(38, 0, 'config', 'config_customer_search', '0', 0),
(39, 0, 'config', 'config_customer_group_id', '1', 0),
(40, 0, 'config', 'config_customer_group_display', '[\"1\"]', 1),
(41, 0, 'config', 'config_customer_price', '0', 0),
(42, 0, 'config', 'config_address_format_id', '1', 0),
(43, 0, 'config', 'config_account_id', '3', 0),
(44, 0, 'config', 'config_invoice_prefix', 'INV-2024-00', 0),
(46, 0, 'config', 'config_cart_weight', '1', 0),
(47, 0, 'config', 'config_checkout_guest', '1', 0),
(48, 0, 'config', 'config_checkout_id', '2', 0),
(49, 0, 'config', 'config_order_status_id', '1', 0),
(50, 0, 'config', 'config_processing_status', '[\"5\",\"1\",\"2\",\"12\",\"3\"]', 1),
(51, 0, 'config', 'config_complete_status', '[\"5\",\"3\"]', 1),
(52, 0, 'config', 'config_fraud_status_id', '8', 0),
(53, 0, 'config', 'config_subscription_status_id', '1', 0),
(54, 0, 'config', 'config_subscription_active_status_id', '2', 0),
(55, 0, 'config', 'config_subscription_expired_status_id', '3', 0),
(56, 0, 'config', 'config_subscription_suspended_status_id', '4', 0),
(57, 0, 'config', 'config_subscription_canceled_status_id', '5', 0),
(58, 0, 'config', 'config_subscription_failed_status_id', '6', 0),
(59, 0, 'config', 'config_subscription_denied_status_id', '7', 0),
(60, 0, 'config', 'config_stock_display', '0', 0),
(61, 0, 'config', 'config_stock_warning', '0', 0),
(62, 0, 'config', 'config_stock_checkout', '0', 0),
(63, 0, 'config', 'config_affiliate_status', '1', 0),
(64, 0, 'config', 'config_affiliate_approval', '0', 0),
(65, 0, 'config', 'config_affiliate_auto', '0', 0),
(66, 0, 'config', 'config_affiliate_commission', '5', 0),
(67, 0, 'config', 'config_affiliate_id', '4', 0),
(68, 0, 'config', 'config_return_id', '0', 0),
(69, 0, 'config', 'config_return_status_id', '2', 0),
(70, 0, 'config', 'config_logo', 'catalog/opencart-logo.png', 0),
(71, 0, 'config', 'config_image_thumb_width', '500', 0),
(72, 0, 'config', 'config_image_thumb_height', '500', 0),
(73, 0, 'config', 'config_image_popup_width', '800', 0),
(74, 0, 'config', 'config_image_popup_height', '800', 0),
(75, 0, 'config', 'config_image_category_width', '80', 0),
(76, 0, 'config', 'config_image_category_height', '80', 0),
(77, 0, 'config', 'config_article_description_length', '90', 0),
(78, 0, 'config', 'config_image_blog_width', '90', 0),
(79, 0, 'config', 'config_image_blog_height', '90', 0),
(80, 0, 'config', 'config_image_product_width', '250', 0),
(81, 0, 'config', 'config_image_product_height', '250', 0),
(82, 0, 'config', 'config_image_additional_width', '74', 0),
(83, 0, 'config', 'config_image_additional_height', '74', 0),
(84, 0, 'config', 'config_image_related_width', '250', 0),
(85, 0, 'config', 'config_image_related_height', '250', 0),
(86, 0, 'config', 'config_image_compare_width', '90', 0),
(87, 0, 'config', 'config_image_compare_height', '90', 0),
(88, 0, 'config', 'config_image_wishlist_width', '47', 0),
(89, 0, 'config', 'config_image_wishlist_height', '47', 0),
(90, 0, 'config', 'config_image_cart_height', '47', 0),
(91, 0, 'config', 'config_image_cart_width', '47', 0),
(92, 0, 'config', 'config_image_location_height', '50', 0),
(93, 0, 'config', 'config_image_location_width', '268', 0),
(94, 0, 'config', 'config_comment', '', 0),
(95, 0, 'config', 'config_open', '', 0),
(96, 0, 'config', 'config_image', '', 0),
(97, 0, 'config', 'config_fax', '', 0),
(98, 0, 'config', 'config_telephone', '495 888-88-88', 0),
(99, 0, 'config', 'config_email', 'yava_xxx@mail.ru', 0),
(100, 0, 'config', 'config_geocode', '', 0),
(101, 0, 'config', 'config_owner', 'Иванов Иван', 0),
(102, 0, 'config', 'config_address', 'г. Москва, ул. Ленина 10 оф. 32', 0),
(103, 0, 'config', 'config_name', 'Интернет магазин Opencart &quot;Русская сборка&quot;', 0),
(104, 0, 'config', 'config_seo_url', '0', 0),
(105, 0, 'config', 'config_file_max_size', '20', 0),
(106, 0, 'config', 'config_file_ext_allowed', 'zip\r\ntxt\r\npng\r\njpe\r\njpeg\r\nwebp\r\njpg\r\ngif\r\nbmp\r\nico\r\ntiff\r\ntif\r\nsvg\r\nsvgz\r\nzip\r\nrar\r\nmsi\r\ncab\r\nmp3\r\nmp4\r\nqt\r\nmov\r\npdf\r\npsd\r\nai\r\neps\r\nps\r\ndoc', 0),
(107, 0, 'config', 'config_file_mime_allowed', 'text/plain\r\nimage/png\r\nimage/webp\r\nimage/jpeg\r\nimage/gif\r\nimage/bmp\r\nimage/tiff\r\nimage/svg+xml\r\napplication/zip\r\napplication/x-zip\r\napplication/x-zip-compressed\r\napplication/rar\r\napplication/x-rar\r\napplication/x-rar-compressed\r\napplication/octet-stream\r\naudio/mpeg\r\nvideo/mp4\r\nvideo/quicktime\r\napplication/pdf', 0),
(108, 0, 'config', 'config_maintenance', '0', 0),
(110, 0, 'config', 'config_compression', '0', 0),
(111, 0, 'config', 'config_error_display', '1', 0),
(112, 0, 'config', 'config_error_log', '1', 0),
(113, 0, 'config', 'config_error_filename', 'error.log', 0),
(114, 0, 'config', 'config_mail_engine', 'mail', 0),
(115, 0, 'config', 'config_mail_parameter', '', 0),
(116, 0, 'config', 'config_mail_smtp_hostname', '', 0),
(117, 0, 'config', 'config_mail_smtp_username', '', 0),
(118, 0, 'config', 'config_mail_smtp_password', '', 0),
(119, 0, 'config', 'config_mail_smtp_port', '25', 0),
(120, 0, 'config', 'config_mail_smtp_timeout', '5', 0),
(121, 0, 'config', 'config_mail_alert_email', '', 0),
(122, 0, 'config', 'config_mail_alert', '[\"order\"]', 1),
(123, 0, 'config', 'config_captcha', 'basic', 0),
(124, 0, 'config', 'config_captcha_page', '[\"review\",\"return\",\"contact\"]', 1),
(125, 0, 'config', 'config_login_attempts', '5', 0),
(126, 0, 'developer', 'developer_sass', '1', 0),
(127, 0, 'currency_ecb', 'currency_ecb_status', '0', 0),
(128, 0, 'payment_free_checkout', 'payment_free_checkout_status', '1', 0),
(129, 0, 'payment_free_checkout', 'payment_free_checkout_order_status_id', '1', 0),
(130, 0, 'payment_free_checkout', 'payment_free_checkout_sort_order', '1', 0),
(131, 0, 'payment_cod', 'payment_cod_sort_order', '5', 0),
(132, 0, 'payment_cod', 'payment_cod_total', '0.01', 0),
(133, 0, 'payment_cod', 'payment_cod_order_status_id', '1', 0),
(134, 0, 'payment_cod', 'payment_cod_geo_zone_id', '0', 0),
(135, 0, 'payment_cod', 'payment_cod_status', '1', 0),
(136, 0, 'shipping_flat', 'shipping_flat_sort_order', '1', 0),
(137, 0, 'shipping_flat', 'shipping_flat_status', '1', 0),
(138, 0, 'shipping_flat', 'shipping_flat_geo_zone_id', '0', 0),
(139, 0, 'shipping_flat', 'shipping_flat_tax_class_id', '9', 0),
(140, 0, 'shipping_flat', 'shipping_flat_cost', '5.00', 0),
(141, 0, 'total_shipping', 'total_shipping_sort_order', '3', 0),
(142, 0, 'total_sub_total', 'total_sub_total_sort_order', '1', 0),
(143, 0, 'total_sub_total', 'total_sub_total_status', '1', 0),
(144, 0, 'total_tax', 'total_tax_sort_order', '5', 0),
(145, 0, 'total_tax', 'total_tax_status', '0', 0),
(146, 0, 'total_total', 'total_total_sort_order', '9', 0),
(147, 0, 'total_total', 'total_total_status', '1', 0),
(148, 0, 'total_credit', 'total_credit_sort_order', '7', 0),
(149, 0, 'total_credit', 'total_credit_status', '1', 0),
(150, 0, 'total_reward', 'total_reward_sort_order', '2', 0),
(151, 0, 'total_reward', 'total_reward_status', '1', 0),
(152, 0, 'total_shipping', 'total_shipping_status', '1', 0),
(153, 0, 'total_shipping', 'total_shipping_estimator', '1', 0),
(154, 0, 'total_coupon', 'total_coupon_sort_order', '4', 0),
(155, 0, 'total_coupon', 'total_coupon_status', '1', 0),
(156, 0, 'total_voucher', 'total_voucher_sort_order', '8', 0),
(157, 0, 'total_voucher', 'total_voucher_status', '1', 0),
(158, 0, 'module_category', 'module_category_status', '1', 0),
(159, 0, 'module_account', 'module_account_status', '1', 0),
(160, 0, 'theme_basic', 'theme_basic_status', '1', 0),
(161, 0, 'dashboard_activity', 'dashboard_activity_status', '1', 0),
(162, 0, 'dashboard_activity', 'dashboard_activity_sort_order', '7', 0),
(163, 0, 'dashboard_sale', 'dashboard_sale_status', '1', 0),
(164, 0, 'dashboard_sale', 'dashboard_sale_width', '3', 0),
(165, 0, 'dashboard_chart', 'dashboard_chart_status', '1', 0),
(166, 0, 'dashboard_chart', 'dashboard_chart_width', '6', 0),
(167, 0, 'dashboard_customer', 'dashboard_customer_status', '1', 0),
(168, 0, 'dashboard_customer', 'dashboard_customer_width', '3', 0),
(169, 0, 'dashboard_map', 'dashboard_map_status', '1', 0),
(170, 0, 'dashboard_map', 'dashboard_map_width', '6', 0),
(171, 0, 'dashboard_online', 'dashboard_online_status', '1', 0),
(172, 0, 'dashboard_online', 'dashboard_online_width', '3', 0),
(173, 0, 'dashboard_order', 'dashboard_order_sort_order', '1', 0),
(174, 0, 'dashboard_order', 'dashboard_order_status', '1', 0),
(175, 0, 'dashboard_order', 'dashboard_order_width', '3', 0),
(176, 0, 'dashboard_sale', 'dashboard_sale_sort_order', '2', 0),
(177, 0, 'dashboard_customer', 'dashboard_customer_sort_order', '3', 0),
(178, 0, 'dashboard_online', 'dashboard_online_sort_order', '4', 0),
(179, 0, 'dashboard_map', 'dashboard_map_sort_order', '5', 0),
(180, 0, 'dashboard_chart', 'dashboard_chart_sort_order', '6', 0),
(181, 0, 'dashboard_recent', 'dashboard_recent_status', '1', 0),
(182, 0, 'dashboard_recent', 'dashboard_recent_sort_order', '8', 0),
(183, 0, 'dashboard_activity', 'dashboard_activity_width', '4', 0),
(184, 0, 'dashboard_recent', 'dashboard_recent_width', '8', 0),
(185, 0, 'report_customer_activity', 'report_customer_activity_status', '1', 0),
(186, 0, 'report_customer_activity', 'report_customer_activity_sort_order', '1', 0),
(187, 0, 'report_customer_order', 'report_customer_order_status', '1', 0),
(188, 0, 'report_customer_order', 'report_customer_order_sort_order', '2', 0),
(189, 0, 'report_customer_reward', 'report_customer_reward_status', '1', 0),
(190, 0, 'report_customer_reward', 'report_customer_reward_sort_order', '3', 0),
(191, 0, 'report_customer_search', 'report_customer_search_status', '1', 0),
(192, 0, 'report_customer_search', 'report_customer_search_sort_order', '4', 0),
(193, 0, 'report_customer_transaction', 'report_customer_transaction_status', '1', 0),
(194, 0, 'report_customer_transaction', 'report_customer_transaction_sort_order', '5', 0),
(195, 0, 'report_customer', 'report_customer_status', '1', 0),
(196, 0, 'report_customer', 'report_customer_sort_order', '6', 0),
(197, 0, 'report_sale_tax', 'report_sale_tax_status', '1', 0),
(198, 0, 'report_sale_tax', 'report_sale_tax_sort_order', '8', 0),
(199, 0, 'report_sale_shipping', 'report_sale_shipping_status', '1', 0),
(200, 0, 'report_sale_shipping', 'report_sale_shipping_sort_order', '9', 0),
(201, 0, 'report_sale_return', 'report_sale_return_status', '1', 0),
(202, 0, 'report_sale_return', 'report_sale_return_sort_order', '10', 0),
(203, 0, 'report_sale_order', 'report_sale_order_status', '1', 0),
(204, 0, 'report_sale_order', 'report_sale_order_sort_order', '11', 0),
(205, 0, 'report_sale_coupon', 'report_sale_coupon_status', '1', 0),
(206, 0, 'report_sale_coupon', 'report_sale_coupon_sort_order', '12', 0),
(207, 0, 'report_product_viewed', 'report_product_viewed_status', '1', 0),
(208, 0, 'report_product_viewed', 'report_product_viewed_sort_order', '13', 0),
(209, 0, 'report_product_purchased', 'report_product_purchased_status', '1', 0),
(210, 0, 'report_product_purchased', 'report_product_purchased_sort_order', '14', 0),
(211, 0, 'report_marketing', 'report_marketing_status', '1', 0),
(212, 0, 'report_marketing', 'report_marketing_sort_order', '15', 0),
(213, 0, 'report_customer_subscription', 'report_customer_subscription_status', '1', 0),
(214, 0, 'report_customer_subscription', 'report_customer_subscription_sort_order', '16', 0),
(215, 0, 'config', 'config_encryption', 'da4e55519c08f696727fcce65728ab6f0a6579289fe85a06f6ad0611daf01ce9ea11506b1cf5db9947c771a99d801876a5cedaa6be4d6b506b02d130e6e85726c16ef9cafa4f8ee1f93e4d7266c4c8877205adeff9d1cc799e524c53c973aa322b9ca77ef2a285ecff849914adb003ca3daa28b85fa91661d1b85ed109854e0492752457d1261a417b7972ebcd938250579c2744997c333f4e5ce1eb89a82f126e491c0f448aead2de5715fe9ad6195daaa18a3a4936001e320506cddf43988b1ad86a1ec74b12ee3da48da96df59d74d2ed011356015f2a79c61ab48061d7cc3e78059f08170063cfd7a129c14ae214041f1e0da960255336968615bd35c739', 0),
(216, 0, 'config', 'config_api_id', '1', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_startup`
--

CREATE TABLE `oc_startup` (
  `startup_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `action` text NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_statistics`
--

CREATE TABLE `oc_statistics` (
  `statistics_id` int(11) NOT NULL,
  `code` varchar(64) NOT NULL,
  `value` decimal(15,4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_statistics`
--

INSERT INTO `oc_statistics` (`statistics_id`, `code`, `value`) VALUES
(1, 'order_sale', 0.0000),
(2, 'order_processing', 0.0000),
(3, 'order_complete', 0.0000),
(4, 'order_other', 0.0000),
(5, 'returns', 0.0000),
(6, 'product', 0.0000),
(7, 'review', 0.0000);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_stock_status`
--

CREATE TABLE `oc_stock_status` (
  `stock_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_stock_status`
--

INSERT INTO `oc_stock_status` (`stock_status_id`, `language_id`, `name`) VALUES
(5, 1, 'Нет в наличии'),
(6, 1, 'Ожидание 2-3 дня'),
(7, 1, 'В наличии'),
(8, 1, 'Предзаказ');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_store`
--

CREATE TABLE `oc_store` (
  `store_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `url` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_subscription`
--

CREATE TABLE `oc_subscription` (
  `subscription_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_product_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `payment_address_id` int(11) NOT NULL,
  `payment_method` text NOT NULL,
  `shipping_address_id` int(11) NOT NULL,
  `shipping_method` text NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` int(4) NOT NULL,
  `subscription_plan_id` int(11) NOT NULL,
  `trial_price` decimal(10,4) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_cycle` smallint(6) NOT NULL,
  `trial_duration` smallint(6) NOT NULL,
  `trial_remaining` smallint(6) NOT NULL,
  `trial_status` tinyint(1) NOT NULL,
  `price` decimal(10,4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `cycle` smallint(6) NOT NULL,
  `duration` smallint(6) NOT NULL,
  `remaining` smallint(6) NOT NULL,
  `date_next` datetime NOT NULL,
  `comment` text NOT NULL,
  `subscription_status_id` int(11) NOT NULL,
  `affiliate_id` int(11) NOT NULL,
  `marketing_id` int(11) NOT NULL,
  `tracking` varchar(64) NOT NULL,
  `language_id` int(11) NOT NULL,
  `currency_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `forwarded_ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `accept_language` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_subscription_history`
--

CREATE TABLE `oc_subscription_history` (
  `subscription_history_id` int(11) NOT NULL,
  `subscription_id` int(11) NOT NULL,
  `subscription_status_id` int(11) NOT NULL,
  `notify` tinyint(1) NOT NULL DEFAULT '0',
  `comment` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_subscription_plan`
--

CREATE TABLE `oc_subscription_plan` (
  `subscription_plan_id` int(11) NOT NULL,
  `trial_frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `trial_duration` int(10) NOT NULL,
  `trial_cycle` int(10) NOT NULL,
  `trial_status` tinyint(4) NOT NULL,
  `frequency` enum('day','week','semi_month','month','year') NOT NULL,
  `duration` int(10) NOT NULL,
  `cycle` int(10) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `sort_order` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_subscription_plan`
--

INSERT INTO `oc_subscription_plan` (`subscription_plan_id`, `trial_frequency`, `trial_duration`, `trial_cycle`, `trial_status`, `frequency`, `duration`, `cycle`, `status`, `sort_order`) VALUES
(1, '', 10, 1, 1, '', 0, 1, 1, 0),
(2, '', 11, 2, 1, '', 10, 1, 1, 0),
(3, '', 0, 1, 0, '', 0, 1, 1, 0);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_subscription_plan_description`
--

CREATE TABLE `oc_subscription_plan_description` (
  `subscription_plan_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_subscription_plan_description`
--

INSERT INTO `oc_subscription_plan_description` (`subscription_plan_id`, `language_id`, `name`) VALUES
(1, 1, 'План подписки 1'),
(2, 1, 'План подписки 2'),
(3, 1, 'План подписки 3');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_subscription_status`
--

CREATE TABLE `oc_subscription_status` (
  `subscription_status_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_subscription_status`
--

INSERT INTO `oc_subscription_status` (`subscription_status_id`, `language_id`, `name`) VALUES
(1, 1, 'Ожидание'),
(2, 1, 'Активный'),
(3, 1, 'Истекший'),
(4, 1, 'Приостановленный'),
(5, 1, 'Отмененный'),
(6, 1, 'Неудачный'),
(7, 1, 'Отказано');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_class`
--

CREATE TABLE `oc_tax_class` (
  `tax_class_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `description` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_tax_class`
--

INSERT INTO `oc_tax_class` (`tax_class_id`, `title`, `description`, `date_added`, `date_modified`) VALUES
(9, 'Налоги', 'Облагаемые налогом', '2022-01-06 23:21:53', '2022-02-23 14:07:50');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate`
--

CREATE TABLE `oc_tax_rate` (
  `tax_rate_id` int(11) NOT NULL,
  `geo_zone_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(32) NOT NULL,
  `rate` decimal(15,4) NOT NULL DEFAULT '0.0000',
  `type` char(1) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_tax_rate`
--

INSERT INTO `oc_tax_rate` (`tax_rate_id`, `geo_zone_id`, `name`, `rate`, `type`, `date_added`, `date_modified`) VALUES
(87, 3, 'НДС', 18.0000, 'F', '2022-02-21 21:49:23', '2022-02-23 00:40:19');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rate_to_customer_group`
--

CREATE TABLE `oc_tax_rate_to_customer_group` (
  `tax_rate_id` int(11) NOT NULL,
  `customer_group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_tax_rate_to_customer_group`
--

INSERT INTO `oc_tax_rate_to_customer_group` (`tax_rate_id`, `customer_group_id`) VALUES
(86, 1),
(87, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_tax_rule`
--

CREATE TABLE `oc_tax_rule` (
  `tax_rule_id` int(11) NOT NULL,
  `tax_class_id` int(11) NOT NULL,
  `tax_rate_id` int(11) NOT NULL,
  `based` varchar(10) NOT NULL,
  `priority` int(5) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_tax_rule`
--

INSERT INTO `oc_tax_rule` (`tax_rule_id`, `tax_class_id`, `tax_rate_id`, `based`, `priority`) VALUES
(120, 10, 87, 'store', 0),
(121, 10, 86, 'payment', 1),
(127, 9, 87, 'shipping', 2),
(128, 9, 86, 'shipping', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_theme`
--

CREATE TABLE `oc_theme` (
  `theme_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `code` mediumtext NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_topic`
--

CREATE TABLE `oc_topic` (
  `topic_id` int(11) NOT NULL,
  `sort_order` int(3) NOT NULL DEFAULT '0',
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_topic_description`
--

CREATE TABLE `oc_topic_description` (
  `topic_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `meta_keyword` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_topic_to_store`
--

CREATE TABLE `oc_topic_to_store` (
  `topic_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_translation`
--

CREATE TABLE `oc_translation` (
  `translation_id` int(11) NOT NULL,
  `store_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `route` varchar(64) NOT NULL,
  `key` varchar(64) NOT NULL,
  `value` text NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_upload`
--

CREATE TABLE `oc_upload` (
  `upload_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `filename` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user`
--

CREATE TABLE `oc_user` (
  `user_id` int(11) NOT NULL,
  `user_group_id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `firstname` varchar(32) NOT NULL,
  `lastname` varchar(32) NOT NULL,
  `email` varchar(96) NOT NULL,
  `image` varchar(255) NOT NULL DEFAULT '',
  `code` varchar(40) NOT NULL DEFAULT '',
  `ip` varchar(40) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_user`
--

INSERT INTO `oc_user` (`user_id`, `user_group_id`, `username`, `password`, `firstname`, `lastname`, `email`, `image`, `code`, `ip`, `status`, `date_added`) VALUES
(1, 1, 'adm', '$2y$10$RHzR2/yufP0i0audeQXHsei7DpqYzhxwd9KOv3EuziQvFg3f1oDf.', 'John', 'Doe', 'yava_xxx@mail.ru', '', '', '127.0.0.1', 1, '2024-12-25 09:19:08');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_authorize`
--

CREATE TABLE `oc_user_authorize` (
  `user_authorize_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(96) NOT NULL,
  `total` int(1) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_group`
--

CREATE TABLE `oc_user_group` (
  `user_group_id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `permission` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_user_group`
--

INSERT INTO `oc_user_group` (`user_group_id`, `name`, `permission`) VALUES
(1, 'Administrator', '{\"access\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"catalog\\/subscription_plan\",\"cms\\/antispam\",\"cms\\/article\",\"cms\\/comment\",\"cms\\/topic\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/pagination\",\"common\\/security\",\"cron\\/cron\",\"cron\\/currency\",\"cron\\/gdpr\",\"cron\\/subscription\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/gdpr\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\\/exception\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/currency\",\"extension\\/dashboard\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/language\",\"extension\\/marketplace\",\"extension\\/module\",\"extension\\/other\",\"extension\\/payment\",\"extension\\/report\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"localisation\\/address_format\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/subscription_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/authorize\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/gdpr\",\"mail\\/returns\",\"mail\\/reward\",\"mail\\/subscription\",\"mail\\/transaction\",\"mail\\/voucher\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/cron\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/promotion\",\"marketplace\\/startup\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/returns\",\"sale\\/subscription\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/authorize\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/notification\",\"tool\\/upgrade\",\"tool\\/upload\",\"user\\/api\",\"user\\/profile\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/opencart\\/captcha\\/basic\",\"extension\\/opencart\\/currency\\/ecb\",\"extension\\/opencart\\/currency\\/fixer\",\"extension\\/opencart\\/dashboard\\/activity\",\"extension\\/opencart\\/dashboard\\/chart\",\"extension\\/opencart\\/dashboard\\/customer\",\"extension\\/opencart\\/dashboard\\/map\",\"extension\\/opencart\\/dashboard\\/online\",\"extension\\/opencart\\/dashboard\\/order\",\"extension\\/opencart\\/dashboard\\/recent\",\"extension\\/opencart\\/dashboard\\/sale\",\"extension\\/opencart\\/fraud\\/ip\",\"extension\\/opencart\\/module\\/account\",\"extension\\/opencart\\/module\\/banner\",\"extension\\/opencart\\/module\\/bestseller\",\"extension\\/opencart\\/module\\/category\",\"extension\\/opencart\\/module\\/featured\",\"extension\\/opencart\\/module\\/filter\",\"extension\\/opencart\\/module\\/html\",\"extension\\/opencart\\/module\\/information\",\"extension\\/opencart\\/module\\/latest\",\"extension\\/opencart\\/module\\/special\",\"extension\\/opencart\\/module\\/store\",\"extension\\/opencart\\/payment\\/bank_transfer\",\"extension\\/opencart\\/payment\\/cheque\",\"extension\\/opencart\\/payment\\/cod\",\"extension\\/opencart\\/payment\\/free_checkout\",\"extension\\/opencart\\/report\\/customer\",\"extension\\/opencart\\/report\\/customer_activity\",\"extension\\/opencart\\/report\\/customer_order\",\"extension\\/opencart\\/report\\/customer_reward\",\"extension\\/opencart\\/report\\/customer_search\",\"extension\\/opencart\\/report\\/customer_transaction\",\"extension\\/opencart\\/report\\/customer_subscription\",\"extension\\/opencart\\/report\\/marketing\",\"extension\\/opencart\\/report\\/product_purchased\",\"extension\\/opencart\\/report\\/product_viewed\",\"extension\\/opencart\\/report\\/sale_coupon\",\"extension\\/opencart\\/report\\/sale_order\",\"extension\\/opencart\\/report\\/sale_return\",\"extension\\/opencart\\/report\\/sale_shipping\",\"extension\\/opencart\\/report\\/sale_tax\",\"extension\\/opencart\\/shipping\\/flat\",\"extension\\/opencart\\/shipping\\/free\",\"extension\\/opencart\\/shipping\\/item\",\"extension\\/opencart\\/shipping\\/pickup\",\"extension\\/opencart\\/shipping\\/weight\",\"extension\\/opencart\\/theme\\/basic\",\"extension\\/opencart\\/total\\/coupon\",\"extension\\/opencart\\/total\\/credit\",\"extension\\/opencart\\/total\\/handling\",\"extension\\/opencart\\/total\\/low_order_fee\",\"extension\\/opencart\\/total\\/reward\",\"extension\\/opencart\\/total\\/shipping\",\"extension\\/opencart\\/total\\/sub_total\",\"extension\\/opencart\\/total\\/tax\",\"extension\\/opencart\\/total\\/total\",\"extension\\/opencart\\/total\\/voucher\"],\"modify\":[\"catalog\\/attribute\",\"catalog\\/attribute_group\",\"catalog\\/category\",\"catalog\\/download\",\"catalog\\/filter\",\"catalog\\/information\",\"catalog\\/manufacturer\",\"catalog\\/option\",\"catalog\\/product\",\"catalog\\/review\",\"catalog\\/subscription_plan\",\"cms\\/antispam\",\"cms\\/article\",\"cms\\/comment\",\"cms\\/topic\",\"common\\/column_left\",\"common\\/developer\",\"common\\/filemanager\",\"common\\/pagination\",\"common\\/security\",\"cron\\/cron\",\"cron\\/currency\",\"cron\\/gdpr\",\"cron\\/subscription\",\"customer\\/custom_field\",\"customer\\/customer\",\"customer\\/customer_approval\",\"customer\\/customer_group\",\"customer\\/gdpr\",\"design\\/banner\",\"design\\/layout\",\"design\\/seo_url\",\"design\\/theme\",\"design\\/translation\",\"error\\/exception\",\"extension\\/analytics\",\"extension\\/captcha\",\"extension\\/currency\",\"extension\\/dashboard\",\"extension\\/feed\",\"extension\\/fraud\",\"extension\\/language\",\"extension\\/marketplace\",\"extension\\/module\",\"extension\\/other\",\"extension\\/payment\",\"extension\\/report\",\"extension\\/shipping\",\"extension\\/theme\",\"extension\\/total\",\"localisation\\/address_format\",\"localisation\\/country\",\"localisation\\/currency\",\"localisation\\/geo_zone\",\"localisation\\/language\",\"localisation\\/length_class\",\"localisation\\/location\",\"localisation\\/order_status\",\"localisation\\/return_action\",\"localisation\\/return_reason\",\"localisation\\/return_status\",\"localisation\\/stock_status\",\"localisation\\/subscription_status\",\"localisation\\/tax_class\",\"localisation\\/tax_rate\",\"localisation\\/weight_class\",\"localisation\\/zone\",\"mail\\/affiliate\",\"mail\\/authorize\",\"mail\\/customer\",\"mail\\/forgotten\",\"mail\\/gdpr\",\"mail\\/returns\",\"mail\\/reward\",\"mail\\/subscription\",\"mail\\/transaction\",\"mail\\/voucher\",\"marketing\\/affiliate\",\"marketing\\/contact\",\"marketing\\/coupon\",\"marketing\\/marketing\",\"marketplace\\/api\",\"marketplace\\/cron\",\"marketplace\\/event\",\"marketplace\\/extension\",\"marketplace\\/installer\",\"marketplace\\/marketplace\",\"marketplace\\/promotion\",\"marketplace\\/startup\",\"report\\/online\",\"report\\/report\",\"report\\/statistics\",\"sale\\/order\",\"sale\\/returns\",\"sale\\/subscription\",\"sale\\/voucher\",\"sale\\/voucher_theme\",\"setting\\/setting\",\"setting\\/store\",\"startup\\/authorize\",\"tool\\/backup\",\"tool\\/log\",\"tool\\/notification\",\"tool\\/upgrade\",\"tool\\/upload\",\"user\\/api\",\"user\\/profile\",\"user\\/user\",\"user\\/user_permission\",\"extension\\/opencart\\/captcha\\/basic\",\"extension\\/opencart\\/currency\\/ecb\",\"extension\\/opencart\\/currency\\/fixer\",\"extension\\/opencart\\/dashboard\\/activity\",\"extension\\/opencart\\/dashboard\\/chart\",\"extension\\/opencart\\/dashboard\\/customer\",\"extension\\/opencart\\/dashboard\\/map\",\"extension\\/opencart\\/dashboard\\/online\",\"extension\\/opencart\\/dashboard\\/order\",\"extension\\/opencart\\/dashboard\\/recent\",\"extension\\/opencart\\/dashboard\\/sale\",\"extension\\/opencart\\/fraud\\/ip\",\"extension\\/opencart\\/module\\/account\",\"extension\\/opencart\\/module\\/banner\",\"extension\\/opencart\\/module\\/bestseller\",\"extension\\/opencart\\/module\\/category\",\"extension\\/opencart\\/module\\/featured\",\"extension\\/opencart\\/module\\/filter\",\"extension\\/opencart\\/module\\/html\",\"extension\\/opencart\\/module\\/information\",\"extension\\/opencart\\/module\\/latest\",\"extension\\/opencart\\/module\\/special\",\"extension\\/opencart\\/module\\/store\",\"extension\\/opencart\\/payment\\/bank_transfer\",\"extension\\/opencart\\/payment\\/cheque\",\"extension\\/opencart\\/payment\\/cod\",\"extension\\/opencart\\/payment\\/free_checkout\",\"extension\\/opencart\\/report\\/customer\",\"extension\\/opencart\\/report\\/customer_activity\",\"extension\\/opencart\\/report\\/customer_order\",\"extension\\/opencart\\/report\\/customer_reward\",\"extension\\/opencart\\/report\\/customer_search\",\"extension\\/opencart\\/report\\/customer_transaction\",\"extension\\/opencart\\/report\\/customer_subscription\",\"extension\\/opencart\\/report\\/marketing\",\"extension\\/opencart\\/report\\/product_purchased\",\"extension\\/opencart\\/report\\/product_viewed\",\"extension\\/opencart\\/report\\/sale_coupon\",\"extension\\/opencart\\/report\\/sale_order\",\"extension\\/opencart\\/report\\/sale_return\",\"extension\\/opencart\\/report\\/sale_shipping\",\"extension\\/opencart\\/report\\/sale_tax\",\"extension\\/opencart\\/shipping\\/flat\",\"extension\\/opencart\\/shipping\\/free\",\"extension\\/opencart\\/shipping\\/item\",\"extension\\/opencart\\/shipping\\/pickup\",\"extension\\/opencart\\/shipping\\/weight\",\"extension\\/opencart\\/theme\\/basic\",\"extension\\/opencart\\/total\\/coupon\",\"extension\\/opencart\\/total\\/credit\",\"extension\\/opencart\\/total\\/handling\",\"extension\\/opencart\\/total\\/low_order_fee\",\"extension\\/opencart\\/total\\/reward\",\"extension\\/opencart\\/total\\/shipping\",\"extension\\/opencart\\/total\\/sub_total\",\"extension\\/opencart\\/total\\/tax\",\"extension\\/opencart\\/total\\/total\",\"extension\\/opencart\\/total\\/voucher\"]}'),
(2, 'Demonstration', '');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_user_login`
--

CREATE TABLE `oc_user_login` (
  `user_login_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `ip` varchar(40) NOT NULL,
  `user_agent` varchar(255) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_user_login`
--

INSERT INTO `oc_user_login` (`user_login_id`, `user_id`, `ip`, `user_agent`, `date_added`) VALUES
(1, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2024-12-25 09:20:49'),
(2, 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/131.0.0.0 Safari/537.36', '2024-12-25 09:22:37');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher`
--

CREATE TABLE `oc_voucher` (
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `code` varchar(10) NOT NULL,
  `from_name` varchar(64) NOT NULL,
  `from_email` varchar(96) NOT NULL,
  `to_name` varchar(64) NOT NULL,
  `to_email` varchar(96) NOT NULL,
  `voucher_theme_id` int(11) NOT NULL,
  `message` text NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_history`
--

CREATE TABLE `oc_voucher_history` (
  `voucher_history_id` int(11) NOT NULL,
  `voucher_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `amount` decimal(15,4) NOT NULL,
  `date_added` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme`
--

CREATE TABLE `oc_voucher_theme` (
  `voucher_theme_id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_voucher_theme`
--

INSERT INTO `oc_voucher_theme` (`voucher_theme_id`, `image`) VALUES
(6, 'catalog/demo/apple_logo.jpg'),
(7, 'catalog/demo/gift-voucher-birthday.jpg'),
(8, 'catalog/demo/canon_eos_5d_2.jpg');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_voucher_theme_description`
--

CREATE TABLE `oc_voucher_theme_description` (
  `voucher_theme_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `name` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_voucher_theme_description`
--

INSERT INTO `oc_voucher_theme_description` (`voucher_theme_id`, `language_id`, `name`) VALUES
(6, 1, 'Новый год'),
(7, 1, 'День рождения'),
(8, 1, 'Другое');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class`
--

CREATE TABLE `oc_weight_class` (
  `weight_class_id` int(11) NOT NULL,
  `value` decimal(15,8) NOT NULL DEFAULT '0.00000000'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_weight_class`
--

INSERT INTO `oc_weight_class` (`weight_class_id`, `value`) VALUES
(1, 1.00000000),
(2, 1000.00000000),
(5, 2.20460000),
(6, 35.27400000);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_weight_class_description`
--

CREATE TABLE `oc_weight_class_description` (
  `weight_class_id` int(11) NOT NULL,
  `language_id` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `unit` varchar(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_weight_class_description`
--

INSERT INTO `oc_weight_class_description` (`weight_class_id`, `language_id`, `title`, `unit`) VALUES
(1, 1, 'Килограмм', 'кг'),
(2, 1, 'Грамм', 'г');

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone`
--

CREATE TABLE `oc_zone` (
  `zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `code` varchar(32) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_zone`
--

INSERT INTO `oc_zone` (`zone_id`, `country_id`, `name`, `code`, `status`) VALUES
(1, 20, 'Брест', 'BR', 1),
(2, 20, 'Гомель', 'HO', 1),
(3, 20, 'Минск', 'HM', 1),
(4, 20, 'Гродно', 'HR', 1),
(5, 20, 'Могилев', 'MA', 1),
(6, 20, 'Минская область', 'MI', 1),
(7, 20, 'Витебск', 'VI', 1),
(8, 80, 'Abkhazia', 'AB', 1),
(9, 80, 'Ajaria', 'AJ', 1),
(10, 80, 'Tbilisi', 'TB', 1),
(11, 80, 'Guria', 'GU', 1),
(12, 80, 'Imereti', 'IM', 1),
(13, 80, 'Kakheti', 'KA', 1),
(14, 80, 'Kvemo Kartli', 'KK', 1),
(15, 80, 'Mtskheta-Mtianeti', 'MM', 1),
(16, 80, 'Racha Lechkhumi and Kvemo Svanet', 'RL', 1),
(17, 80, 'Samegrelo-Zemo Svaneti', 'SZ', 1),
(18, 80, 'Samtskhe-Javakheti', 'SJ', 1),
(19, 80, 'Shida Kartli', 'SK', 1),
(20, 109, 'Алматинская область', 'AL', 1),
(21, 109, 'Алматы - город республ-го значения', 'AC', 1),
(22, 109, 'Акмолинская область', 'AM', 1),
(23, 109, 'Актюбинская область', 'AQ', 1),
(24, 109, 'Астана - город республ-го значения', 'AS', 1),
(25, 109, 'Атырауская область', 'AT', 1),
(26, 109, 'Западно-Казахстанская область', 'BA', 1),
(27, 109, 'Байконур - город республ-го значения', 'BY', 1),
(28, 109, 'Мангистауская область', 'MA', 1),
(29, 109, 'Южно-Казахстанская область', 'ON', 1),
(30, 109, 'Павлодарская область', 'PA', 1),
(31, 109, 'Карагандинская область', 'QA', 1),
(32, 109, 'Костанайская область', 'QO', 1),
(33, 109, 'Кызылординская область', 'QY', 1),
(34, 109, 'Восточно-Казахстанская область', 'SH', 1),
(35, 109, 'Северо-Казахстанская область', 'SO', 1),
(36, 109, 'Жамбылская область', 'ZH', 1),
(37, 115, 'Bishkek', 'GB', 1),
(38, 115, 'Batken', 'B', 1),
(39, 115, 'Chu', 'C', 1),
(40, 115, 'Jalal-Abad', 'J', 1),
(41, 115, 'Naryn', 'N', 1),
(42, 115, 'Osh', 'O', 1),
(43, 115, 'Talas', 'T', 1),
(44, 115, 'Ysyk-Kol', 'Y', 1),
(45, 176, 'Республика Хакасия', 'RU-KK', 1),
(46, 176, 'Московская область', 'RU-MOS', 1),
(47, 176, 'Чукотский АО', 'RU-CHU', 1),
(48, 176, 'Архангельская область', 'RU-ARK', 1),
(49, 176, 'Астраханская область', 'RU-AST', 1),
(50, 176, 'Алтайский край', 'RU-ALT', 1),
(51, 176, 'Белгородская область', 'RU-BEL', 1),
(52, 176, 'Еврейская АО', 'RU-YEV', 1),
(53, 176, 'Амурская область', 'RU-AMU', 1),
(54, 176, 'Брянская область', 'RU-BRY', 1),
(55, 176, 'Чувашская Республика', 'RU-CU', 1),
(56, 176, 'Челябинская область', 'RU-CHE', 1),
(57, 176, 'Карачаево-Черкесия', 'RU-KC', 1),
(58, 176, 'Забайкальский край', 'RU-ZAB', 1),
(59, 176, 'Ленинградская область', 'RU-LEN', 1),
(60, 176, 'Республика Калмыкия', 'RU-KL', 1),
(61, 176, 'Сахалинская область', 'RU-SAK', 1),
(62, 176, 'Республика Алтай', 'RU-AL', 1),
(63, 176, 'Чеченская Республика', 'RU-CE', 1),
(64, 176, 'Иркутская область', 'RU-IRK', 1),
(65, 176, 'Ивановская область', 'RU-IVA', 1),
(66, 176, 'Удмуртская Республика', 'RU-UD', 1),
(67, 176, 'Калининградская область', 'RU-KGD', 1),
(68, 176, 'Калужская область', 'RU-KLU', 1),
(69, 176, 'Республика Татарстан', 'RU-TA', 1),
(70, 176, 'Кемеровская область', 'RU-KEM', 1),
(71, 176, 'Хабаровский край', 'RU-KHA', 1),
(72, 176, 'Ханты-Мансийский АО - Югра', 'RU-KHM', 1),
(73, 176, 'Костромская область', 'RU-KOS', 1),
(74, 176, 'Краснодарский край', 'RU-KDA', 1),
(75, 176, 'Красноярский край', 'RU-KYA', 1),
(76, 176, 'Курганская область', 'RU-KGN', 1),
(77, 176, 'Курская область', 'RU-KRS', 1),
(78, 176, 'Республика Тыва', 'RU-TY', 1),
(79, 176, 'Липецкая область', 'RU-LIP', 1),
(80, 176, 'Магаданская область', 'RU-MAG', 1),
(81, 176, 'Республика Дагестан', 'RU-DA', 1),
(82, 176, 'Республика Адыгея', 'RU-AD', 1),
(83, 176, 'Москва', 'RU-MOW', 1),
(84, 176, 'Мурманская область', 'RU-MUR', 1),
(85, 176, 'Республика Кабардино-Балкария', 'RU-KB', 1),
(86, 176, 'Ненецкий АО', 'RU-NEN', 1),
(87, 176, 'Республика Ингушетия', 'RU-IN', 1),
(88, 176, 'Нижегородская область', 'RU-NIZ', 1),
(89, 176, 'Новгородская область', 'RU-NGR', 1),
(90, 176, 'Новосибирская область', 'RU-NVS', 1),
(91, 176, 'Омская область', 'RU-OMS', 1),
(92, 176, 'Орловская область', 'RU-ORL', 1),
(93, 176, 'Оренбургская область', 'RU-ORE', 1),
(94, 176, 'Пензенская область', 'RU-PNZ', 1),
(95, 176, 'Пермский край', 'RU-PER', 1),
(96, 176, 'Камчатский край', 'RU-KAM', 1),
(97, 176, 'Республика Карелия', 'RU-KR', 1),
(98, 176, 'Псковская область', 'RU-PSK', 1),
(99, 176, 'Ростовская область', 'RU-ROS', 1),
(100, 176, 'Рязанская область', 'RU-RYA', 1),
(101, 176, 'Ямало-Ненецкий АО', 'RU-YAN', 1),
(102, 176, 'Самарская область', 'RU-SAM', 1),
(103, 176, 'Республика Мордовия', 'RU-MO', 1),
(104, 176, 'Саратовская область', 'RU-SAR', 1),
(105, 176, 'Смоленская область', 'RU-SMO', 1),
(106, 176, 'Санкт-Петербург', 'RU-SPE', 1),
(107, 176, 'Ставропольский край', 'RU-STA', 1),
(108, 176, 'Республика Коми', 'RU-KO', 1),
(109, 176, 'Тамбовская область', 'RU-TAM', 1),
(110, 176, 'Томская область', 'RU-TOM', 1),
(111, 176, 'Тульская область', 'RU-TUL', 1),
(112, 176, 'Тверская область', 'RU-TVE', 1),
(113, 176, 'Тюменская область', 'RU-TYU', 1),
(114, 176, 'Республика Башкортостан', 'RU-BA', 1),
(115, 176, 'Ульяновская область', 'RU-ULY', 1),
(116, 176, 'Республика Бурятия', 'RU-BU', 1),
(117, 176, 'Республика Северная Осетия', 'RU-SE', 1),
(118, 176, 'Владимирская область', 'RU-VLA', 1),
(119, 176, 'Приморский край', 'RU-PRI', 1),
(120, 176, 'Волгоградская область', 'RU-VGG', 1),
(121, 176, 'Вологодская область', 'RU-VLG', 1),
(122, 176, 'Воронежская область', 'RU-VOR', 1),
(123, 176, 'Кировская область', 'RU-KIR', 1),
(124, 176, 'Республика Саха', 'RU-SA', 1),
(125, 176, 'Ярославская область', 'RU-YAR', 1),
(126, 176, 'Свердловская область', 'RU-SVE', 1),
(127, 176, 'Республика Марий Эл', 'RU-ME', 1),
(129, 220, 'Черкассы', 'CK', 1),
(130, 220, 'Чернигов', 'CH', 1),
(131, 220, 'Черновцы', 'CV', 1),
(132, 220, 'Днепропетровск', 'DN', 1),
(133, 220, 'Донецк', 'DO', 1),
(134, 220, 'Ивано-Франковск', 'IV', 1),
(135, 220, 'Харьков', 'KH', 1),
(136, 220, 'Хмельницкий', 'KM', 1),
(137, 220, 'Кировоград', 'KR', 1),
(138, 220, 'Киевская область', 'KV', 1),
(139, 220, 'Киев', 'KY', 1),
(140, 220, 'Луганск', 'LU', 1),
(141, 220, 'Львов', 'LV', 1),
(142, 220, 'Николаев', 'MY', 1),
(143, 220, 'Одесса', 'OD', 1),
(144, 220, 'Полтава', 'PO', 1),
(145, 220, 'Ровно', 'RI', 1),
(147, 220, 'Сумы', 'SU', 1),
(148, 220, 'Тернополь', 'TE', 1),
(149, 220, 'Винница', 'VI', 1),
(150, 220, 'Луцк', 'VO', 1),
(151, 220, 'Ужгород', 'ZK', 1),
(152, 220, 'Запорожье', 'ZA', 1),
(153, 220, 'Житомир', 'ZH', 1),
(154, 220, 'Херсон', 'KE', 1),
(155, 226, 'Andijon', 'AN', 1),
(156, 226, 'Buxoro', 'BU', 1),
(157, 226, 'Farg\'ona', 'FA', 1),
(158, 226, 'Jizzax', 'JI', 1),
(159, 226, 'Namangan', 'NG', 1),
(160, 226, 'Navoiy', 'NW', 1),
(161, 226, 'Qashqadaryo', 'QA', 1),
(162, 226, 'Qoraqalpog\'iston Republikasi', 'QR', 1),
(163, 226, 'Samarqand', 'SA', 1),
(164, 226, 'Sirdaryo', 'SI', 1),
(165, 226, 'Surxondaryo', 'SU', 1),
(166, 226, 'Toshkent City', 'TK', 1),
(167, 226, 'Toshkent Region', 'TO', 1),
(168, 226, 'Xorazm', 'XO', 1),
(169, 176, 'Байконур - город республ-го значения', 'BY', 1),
(180, 11, 'Арагацотн', 'AGT', 1),
(181, 11, 'Арарат', 'ARR', 1),
(182, 11, 'Армавир', 'ARM', 1),
(183, 11, 'Гегаркуник', 'GEG', 1),
(184, 11, 'Котайк', 'KOT', 1),
(185, 11, 'Лори', 'LOR', 1),
(186, 11, 'Ширак', 'SHI', 1),
(187, 11, 'Сюник', 'SYU', 1),
(188, 11, 'Тавуш', 'TAV', 1),
(189, 11, 'Вайоц Дзор', 'VAY', 1),
(190, 11, 'Ереван', 'YER', 1),
(208, 15, 'Ali Bayramli', 'AB', 1),
(209, 15, 'Abseron', 'ABS', 1),
(210, 15, 'AgcabAdi', 'AGC', 1),
(211, 15, 'Agdam', 'AGM', 1),
(212, 15, 'Agdas', 'AGS', 1),
(213, 15, 'Agstafa', 'AGA', 1),
(214, 15, 'Agsu', 'AGU', 1),
(215, 15, 'Astara', 'AST', 1),
(216, 15, 'Baki', 'BA', 1),
(217, 15, 'BabAk', 'BAB', 1),
(218, 15, 'BalakAn', 'BAL', 1),
(219, 15, 'BArdA', 'BAR', 1),
(220, 15, 'Beylaqan', 'BEY', 1),
(221, 15, 'Bilasuvar', 'BIL', 1),
(222, 15, 'Cabrayil', 'CAB', 1),
(223, 15, 'Calilabab', 'CAL', 1),
(224, 15, 'Culfa', 'CUL', 1),
(225, 15, 'Daskasan', 'DAS', 1),
(226, 15, 'Davaci', 'DAV', 1),
(227, 15, 'Fuzuli', 'FUZ', 1),
(228, 15, 'Ganca', 'GA', 1),
(229, 15, 'Gadabay', 'GAD', 1),
(230, 15, 'Goranboy', 'GOR', 1),
(231, 15, 'Goycay', 'GOY', 1),
(232, 15, 'Haciqabul', 'HAC', 1),
(233, 15, 'Imisli', 'IMI', 1),
(234, 15, 'Ismayilli', 'ISM', 1),
(235, 15, 'Kalbacar', 'KAL', 1),
(236, 15, 'Kurdamir', 'KUR', 1),
(237, 15, 'Lankaran', 'LA', 1),
(238, 15, 'Lacin', 'LAC', 1),
(239, 15, 'Lankaran', 'LAN', 1),
(240, 15, 'Lerik', 'LER', 1),
(241, 15, 'Masalli', 'MAS', 1),
(242, 15, 'Mingacevir', 'MI', 1),
(243, 15, 'Naftalan', 'NA', 1),
(244, 15, 'Neftcala', 'NEF', 1),
(245, 15, 'Oguz', 'OGU', 1),
(246, 15, 'Ordubad', 'ORD', 1),
(247, 15, 'Qabala', 'QAB', 1),
(248, 15, 'Qax', 'QAX', 1),
(249, 15, 'Qazax', 'QAZ', 1),
(250, 15, 'Qobustan', 'QOB', 1),
(251, 15, 'Quba', 'QBA', 1),
(252, 15, 'Qubadli', 'QBI', 1),
(253, 15, 'Qusar', 'QUS', 1),
(254, 15, 'Saki', 'SA', 1),
(255, 15, 'Saatli', 'SAT', 1),
(256, 15, 'Sabirabad', 'SAB', 1),
(257, 15, 'Sadarak', 'SAD', 1),
(258, 15, 'Sahbuz', 'SAH', 1),
(259, 15, 'Saki', 'SAK', 1),
(260, 15, 'Salyan', 'SAL', 1),
(261, 15, 'Sumqayit', 'SM', 1),
(262, 15, 'Samaxi', 'SMI', 1),
(263, 15, 'Samkir', 'SKR', 1),
(264, 15, 'Samux', 'SMX', 1),
(265, 15, 'Sarur', 'SAR', 1),
(266, 15, 'Siyazan', 'SIY', 1),
(267, 15, 'Susa', 'SS', 1),
(268, 15, 'Susa', 'SUS', 1),
(269, 15, 'Tartar', 'TAR', 1),
(270, 15, 'Tovuz', 'TOV', 1),
(271, 15, 'Ucar', 'UCA', 1),
(272, 15, 'Xankandi', 'XA', 1),
(273, 15, 'Xacmaz', 'XAC', 1),
(274, 15, 'Xanlar', 'XAN', 1),
(275, 15, 'Xizi', 'XIZ', 1),
(276, 15, 'Xocali', 'XCI', 1),
(277, 15, 'Xocavand', 'XVD', 1),
(278, 15, 'Yardimli', 'YAR', 1),
(279, 15, 'Yevlax', 'YEV', 1),
(280, 15, 'Zangilan', 'ZAN', 1),
(281, 15, 'Zaqatala', 'ZAQ', 1),
(282, 15, 'Zardab', 'ZAR', 1),
(283, 15, 'Naxcivan', 'NX', 1),
(291, 176, 'Республика Крым', 'RU-KRM', 1),
(292, 176, 'Севастополь', 'RU-SEV', 1),
(293, 176, 'Донецкая Народная Республика', 'RU-DNR', 1),
(294, 176, 'Луганская Народная Республика', 'RU-LNR', 1),
(295, 176, 'Запорожская область', 'RU-ZAP', 1),
(296, 176, 'Херсонская область', 'RU-HER', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `oc_zone_to_geo_zone`
--

CREATE TABLE `oc_zone_to_geo_zone` (
  `zone_to_geo_zone_id` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL DEFAULT '0',
  `geo_zone_id` int(11) NOT NULL,
  `date_added` datetime NOT NULL,
  `date_modified` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

--
-- Дамп данных таблицы `oc_zone_to_geo_zone`
--

INSERT INTO `oc_zone_to_geo_zone` (`zone_to_geo_zone_id`, `country_id`, `zone_id`, `geo_zone_id`, `date_added`, `date_modified`) VALUES
(1, 176, 0, 3, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `oc_address`
--
ALTER TABLE `oc_address`
  ADD PRIMARY KEY (`address_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Индексы таблицы `oc_address_format`
--
ALTER TABLE `oc_address_format`
  ADD PRIMARY KEY (`address_format_id`);

--
-- Индексы таблицы `oc_antispam`
--
ALTER TABLE `oc_antispam`
  ADD PRIMARY KEY (`antispam_id`),
  ADD KEY `keyword` (`keyword`);

--
-- Индексы таблицы `oc_api`
--
ALTER TABLE `oc_api`
  ADD PRIMARY KEY (`api_id`);

--
-- Индексы таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  ADD PRIMARY KEY (`api_ip_id`);

--
-- Индексы таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  ADD PRIMARY KEY (`api_session_id`);

--
-- Индексы таблицы `oc_article`
--
ALTER TABLE `oc_article`
  ADD PRIMARY KEY (`article_id`);

--
-- Индексы таблицы `oc_article_comment`
--
ALTER TABLE `oc_article_comment`
  ADD PRIMARY KEY (`article_comment_id`),
  ADD KEY `article_id` (`article_id`);

--
-- Индексы таблицы `oc_article_description`
--
ALTER TABLE `oc_article_description`
  ADD PRIMARY KEY (`article_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_article_to_layout`
--
ALTER TABLE `oc_article_to_layout`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Индексы таблицы `oc_article_to_store`
--
ALTER TABLE `oc_article_to_store`
  ADD PRIMARY KEY (`article_id`,`store_id`);

--
-- Индексы таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  ADD PRIMARY KEY (`attribute_id`);

--
-- Индексы таблицы `oc_attribute_description`
--
ALTER TABLE `oc_attribute_description`
  ADD PRIMARY KEY (`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  ADD PRIMARY KEY (`attribute_group_id`);

--
-- Индексы таблицы `oc_attribute_group_description`
--
ALTER TABLE `oc_attribute_group_description`
  ADD PRIMARY KEY (`attribute_group_id`,`language_id`);

--
-- Индексы таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  ADD PRIMARY KEY (`banner_id`);

--
-- Индексы таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  ADD PRIMARY KEY (`banner_image_id`);

--
-- Индексы таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `cart_id` (`api_id`,`customer_id`,`session_id`,`product_id`,`subscription_plan_id`);

--
-- Индексы таблицы `oc_category`
--
ALTER TABLE `oc_category`
  ADD PRIMARY KEY (`category_id`),
  ADD KEY `parent_id` (`parent_id`);

--
-- Индексы таблицы `oc_category_description`
--
ALTER TABLE `oc_category_description`
  ADD PRIMARY KEY (`category_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_category_filter`
--
ALTER TABLE `oc_category_filter`
  ADD PRIMARY KEY (`category_id`,`filter_id`);

--
-- Индексы таблицы `oc_category_path`
--
ALTER TABLE `oc_category_path`
  ADD PRIMARY KEY (`category_id`,`path_id`);

--
-- Индексы таблицы `oc_category_to_layout`
--
ALTER TABLE `oc_category_to_layout`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_category_to_store`
--
ALTER TABLE `oc_category_to_store`
  ADD PRIMARY KEY (`category_id`,`store_id`);

--
-- Индексы таблицы `oc_country`
--
ALTER TABLE `oc_country`
  ADD PRIMARY KEY (`country_id`);

--
-- Индексы таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  ADD PRIMARY KEY (`coupon_id`);

--
-- Индексы таблицы `oc_coupon_category`
--
ALTER TABLE `oc_coupon_category`
  ADD PRIMARY KEY (`coupon_id`,`category_id`);

--
-- Индексы таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  ADD PRIMARY KEY (`coupon_history_id`);

--
-- Индексы таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  ADD PRIMARY KEY (`coupon_product_id`);

--
-- Индексы таблицы `oc_cron`
--
ALTER TABLE `oc_cron`
  ADD PRIMARY KEY (`cron_id`);

--
-- Индексы таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  ADD PRIMARY KEY (`currency_id`);

--
-- Индексы таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  ADD PRIMARY KEY (`customer_activity_id`);

--
-- Индексы таблицы `oc_customer_affiliate`
--
ALTER TABLE `oc_customer_affiliate`
  ADD PRIMARY KEY (`customer_id`);

--
-- Индексы таблицы `oc_customer_affiliate_report`
--
ALTER TABLE `oc_customer_affiliate_report`
  ADD PRIMARY KEY (`customer_affiliate_report_id`);

--
-- Индексы таблицы `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  ADD PRIMARY KEY (`customer_approval_id`);

--
-- Индексы таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  ADD PRIMARY KEY (`customer_group_id`);

--
-- Индексы таблицы `oc_customer_group_description`
--
ALTER TABLE `oc_customer_group_description`
  ADD PRIMARY KEY (`customer_group_id`,`language_id`);

--
-- Индексы таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  ADD PRIMARY KEY (`customer_history_id`);

--
-- Индексы таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  ADD PRIMARY KEY (`customer_ip_id`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  ADD PRIMARY KEY (`customer_login_id`),
  ADD KEY `email` (`email`),
  ADD KEY `ip` (`ip`);

--
-- Индексы таблицы `oc_customer_online`
--
ALTER TABLE `oc_customer_online`
  ADD PRIMARY KEY (`ip`);

--
-- Индексы таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  ADD PRIMARY KEY (`customer_reward_id`);

--
-- Индексы таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  ADD PRIMARY KEY (`customer_search_id`);

--
-- Индексы таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  ADD PRIMARY KEY (`customer_transaction_id`);

--
-- Индексы таблицы `oc_customer_wishlist`
--
ALTER TABLE `oc_customer_wishlist`
  ADD PRIMARY KEY (`customer_id`,`product_id`);

--
-- Индексы таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  ADD PRIMARY KEY (`custom_field_id`);

--
-- Индексы таблицы `oc_custom_field_customer_group`
--
ALTER TABLE `oc_custom_field_customer_group`
  ADD PRIMARY KEY (`custom_field_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_custom_field_description`
--
ALTER TABLE `oc_custom_field_description`
  ADD PRIMARY KEY (`custom_field_id`,`language_id`);

--
-- Индексы таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  ADD PRIMARY KEY (`custom_field_value_id`);

--
-- Индексы таблицы `oc_custom_field_value_description`
--
ALTER TABLE `oc_custom_field_value_description`
  ADD PRIMARY KEY (`custom_field_value_id`,`language_id`);

--
-- Индексы таблицы `oc_download`
--
ALTER TABLE `oc_download`
  ADD PRIMARY KEY (`download_id`);

--
-- Индексы таблицы `oc_download_description`
--
ALTER TABLE `oc_download_description`
  ADD PRIMARY KEY (`download_id`,`language_id`);

--
-- Индексы таблицы `oc_download_report`
--
ALTER TABLE `oc_download_report`
  ADD PRIMARY KEY (`download_report_id`);

--
-- Индексы таблицы `oc_event`
--
ALTER TABLE `oc_event`
  ADD PRIMARY KEY (`event_id`);

--
-- Индексы таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  ADD PRIMARY KEY (`extension_id`);

--
-- Индексы таблицы `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  ADD PRIMARY KEY (`extension_install_id`);

--
-- Индексы таблицы `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  ADD PRIMARY KEY (`extension_path_id`),
  ADD KEY `path` (`path`);

--
-- Индексы таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  ADD PRIMARY KEY (`filter_id`);

--
-- Индексы таблицы `oc_filter_description`
--
ALTER TABLE `oc_filter_description`
  ADD PRIMARY KEY (`filter_id`,`language_id`);

--
-- Индексы таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  ADD PRIMARY KEY (`filter_group_id`);

--
-- Индексы таблицы `oc_filter_group_description`
--
ALTER TABLE `oc_filter_group_description`
  ADD PRIMARY KEY (`filter_group_id`,`language_id`);

--
-- Индексы таблицы `oc_gdpr`
--
ALTER TABLE `oc_gdpr`
  ADD PRIMARY KEY (`gdpr_id`);

--
-- Индексы таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  ADD PRIMARY KEY (`geo_zone_id`);

--
-- Индексы таблицы `oc_information`
--
ALTER TABLE `oc_information`
  ADD PRIMARY KEY (`information_id`);

--
-- Индексы таблицы `oc_information_description`
--
ALTER TABLE `oc_information_description`
  ADD PRIMARY KEY (`information_id`,`language_id`);

--
-- Индексы таблицы `oc_information_to_layout`
--
ALTER TABLE `oc_information_to_layout`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_information_to_store`
--
ALTER TABLE `oc_information_to_store`
  ADD PRIMARY KEY (`information_id`,`store_id`);

--
-- Индексы таблицы `oc_language`
--
ALTER TABLE `oc_language`
  ADD PRIMARY KEY (`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  ADD PRIMARY KEY (`layout_id`);

--
-- Индексы таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  ADD PRIMARY KEY (`layout_module_id`);

--
-- Индексы таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  ADD PRIMARY KEY (`layout_route_id`);

--
-- Индексы таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  ADD PRIMARY KEY (`length_class_id`);

--
-- Индексы таблицы `oc_length_class_description`
--
ALTER TABLE `oc_length_class_description`
  ADD PRIMARY KEY (`length_class_id`,`language_id`);

--
-- Индексы таблицы `oc_location`
--
ALTER TABLE `oc_location`
  ADD PRIMARY KEY (`location_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  ADD PRIMARY KEY (`manufacturer_id`);

--
-- Индексы таблицы `oc_manufacturer_to_layout`
--
ALTER TABLE `oc_manufacturer_to_layout`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_manufacturer_to_store`
--
ALTER TABLE `oc_manufacturer_to_store`
  ADD PRIMARY KEY (`manufacturer_id`,`store_id`);

--
-- Индексы таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  ADD PRIMARY KEY (`marketing_id`);

--
-- Индексы таблицы `oc_marketing_report`
--
ALTER TABLE `oc_marketing_report`
  ADD PRIMARY KEY (`marketing_report_id`);

--
-- Индексы таблицы `oc_module`
--
ALTER TABLE `oc_module`
  ADD PRIMARY KEY (`module_id`);

--
-- Индексы таблицы `oc_notification`
--
ALTER TABLE `oc_notification`
  ADD PRIMARY KEY (`notification_id`);

--
-- Индексы таблицы `oc_option`
--
ALTER TABLE `oc_option`
  ADD PRIMARY KEY (`option_id`);

--
-- Индексы таблицы `oc_option_description`
--
ALTER TABLE `oc_option_description`
  ADD PRIMARY KEY (`option_id`,`language_id`);

--
-- Индексы таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  ADD PRIMARY KEY (`option_value_id`);

--
-- Индексы таблицы `oc_option_value_description`
--
ALTER TABLE `oc_option_value_description`
  ADD PRIMARY KEY (`option_value_id`,`language_id`);

--
-- Индексы таблицы `oc_order`
--
ALTER TABLE `oc_order`
  ADD PRIMARY KEY (`order_id`);

--
-- Индексы таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  ADD PRIMARY KEY (`order_history_id`);

--
-- Индексы таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  ADD PRIMARY KEY (`order_option_id`);

--
-- Индексы таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  ADD PRIMARY KEY (`order_product_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  ADD PRIMARY KEY (`order_status_id`,`language_id`);

--
-- Индексы таблицы `oc_order_subscription`
--
ALTER TABLE `oc_order_subscription`
  ADD PRIMARY KEY (`order_subscription_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  ADD PRIMARY KEY (`order_total_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  ADD PRIMARY KEY (`order_voucher_id`);

--
-- Индексы таблицы `oc_product`
--
ALTER TABLE `oc_product`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `oc_product_attribute`
--
ALTER TABLE `oc_product_attribute`
  ADD PRIMARY KEY (`product_id`,`attribute_id`,`language_id`);

--
-- Индексы таблицы `oc_product_description`
--
ALTER TABLE `oc_product_description`
  ADD PRIMARY KEY (`product_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  ADD PRIMARY KEY (`product_discount_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_filter`
--
ALTER TABLE `oc_product_filter`
  ADD PRIMARY KEY (`product_id`,`filter_id`);

--
-- Индексы таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  ADD PRIMARY KEY (`product_image_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  ADD PRIMARY KEY (`product_option_id`);

--
-- Индексы таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  ADD PRIMARY KEY (`product_option_value_id`);

--
-- Индексы таблицы `oc_product_related`
--
ALTER TABLE `oc_product_related`
  ADD PRIMARY KEY (`product_id`,`related_id`);

--
-- Индексы таблицы `oc_product_report`
--
ALTER TABLE `oc_product_report`
  ADD PRIMARY KEY (`product_report_id`);

--
-- Индексы таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  ADD PRIMARY KEY (`product_reward_id`);

--
-- Индексы таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  ADD PRIMARY KEY (`product_special_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_product_subscription`
--
ALTER TABLE `oc_product_subscription`
  ADD PRIMARY KEY (`product_id`,`subscription_plan_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_product_to_category`
--
ALTER TABLE `oc_product_to_category`
  ADD PRIMARY KEY (`product_id`,`category_id`),
  ADD KEY `category_id` (`category_id`);

--
-- Индексы таблицы `oc_product_to_download`
--
ALTER TABLE `oc_product_to_download`
  ADD PRIMARY KEY (`product_id`,`download_id`);

--
-- Индексы таблицы `oc_product_to_layout`
--
ALTER TABLE `oc_product_to_layout`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_product_to_store`
--
ALTER TABLE `oc_product_to_store`
  ADD PRIMARY KEY (`product_id`,`store_id`);

--
-- Индексы таблицы `oc_product_viewed`
--
ALTER TABLE `oc_product_viewed`
  ADD PRIMARY KEY (`product_id`);

--
-- Индексы таблицы `oc_return`
--
ALTER TABLE `oc_return`
  ADD PRIMARY KEY (`return_id`);

--
-- Индексы таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  ADD PRIMARY KEY (`return_action_id`,`language_id`);

--
-- Индексы таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  ADD PRIMARY KEY (`return_history_id`);

--
-- Индексы таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  ADD PRIMARY KEY (`return_reason_id`,`language_id`);

--
-- Индексы таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  ADD PRIMARY KEY (`return_status_id`,`language_id`);

--
-- Индексы таблицы `oc_review`
--
ALTER TABLE `oc_review`
  ADD PRIMARY KEY (`review_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  ADD PRIMARY KEY (`seo_url_id`),
  ADD KEY `keyword` (`keyword`),
  ADD KEY `query` (`key`,`value`);

--
-- Индексы таблицы `oc_session`
--
ALTER TABLE `oc_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `expire` (`expire`);

--
-- Индексы таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  ADD PRIMARY KEY (`setting_id`);

--
-- Индексы таблицы `oc_startup`
--
ALTER TABLE `oc_startup`
  ADD PRIMARY KEY (`startup_id`);

--
-- Индексы таблицы `oc_statistics`
--
ALTER TABLE `oc_statistics`
  ADD PRIMARY KEY (`statistics_id`);

--
-- Индексы таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  ADD PRIMARY KEY (`stock_status_id`,`language_id`);

--
-- Индексы таблицы `oc_store`
--
ALTER TABLE `oc_store`
  ADD PRIMARY KEY (`store_id`);

--
-- Индексы таблицы `oc_subscription`
--
ALTER TABLE `oc_subscription`
  ADD PRIMARY KEY (`subscription_id`),
  ADD KEY `order_id` (`order_id`);

--
-- Индексы таблицы `oc_subscription_history`
--
ALTER TABLE `oc_subscription_history`
  ADD PRIMARY KEY (`subscription_history_id`);

--
-- Индексы таблицы `oc_subscription_plan`
--
ALTER TABLE `oc_subscription_plan`
  ADD PRIMARY KEY (`subscription_plan_id`);

--
-- Индексы таблицы `oc_subscription_plan_description`
--
ALTER TABLE `oc_subscription_plan_description`
  ADD PRIMARY KEY (`subscription_plan_id`,`language_id`);

--
-- Индексы таблицы `oc_subscription_status`
--
ALTER TABLE `oc_subscription_status`
  ADD PRIMARY KEY (`subscription_status_id`,`language_id`);

--
-- Индексы таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  ADD PRIMARY KEY (`tax_class_id`);

--
-- Индексы таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  ADD PRIMARY KEY (`tax_rate_id`);

--
-- Индексы таблицы `oc_tax_rate_to_customer_group`
--
ALTER TABLE `oc_tax_rate_to_customer_group`
  ADD PRIMARY KEY (`tax_rate_id`,`customer_group_id`);

--
-- Индексы таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  ADD PRIMARY KEY (`tax_rule_id`);

--
-- Индексы таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  ADD PRIMARY KEY (`theme_id`);

--
-- Индексы таблицы `oc_topic`
--
ALTER TABLE `oc_topic`
  ADD PRIMARY KEY (`topic_id`);

--
-- Индексы таблицы `oc_topic_description`
--
ALTER TABLE `oc_topic_description`
  ADD PRIMARY KEY (`topic_id`,`language_id`),
  ADD KEY `name` (`name`);

--
-- Индексы таблицы `oc_topic_to_store`
--
ALTER TABLE `oc_topic_to_store`
  ADD PRIMARY KEY (`topic_id`,`store_id`);

--
-- Индексы таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  ADD PRIMARY KEY (`translation_id`);

--
-- Индексы таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  ADD PRIMARY KEY (`upload_id`);

--
-- Индексы таблицы `oc_user`
--
ALTER TABLE `oc_user`
  ADD PRIMARY KEY (`user_id`);

--
-- Индексы таблицы `oc_user_authorize`
--
ALTER TABLE `oc_user_authorize`
  ADD PRIMARY KEY (`user_authorize_id`);

--
-- Индексы таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  ADD PRIMARY KEY (`user_group_id`);

--
-- Индексы таблицы `oc_user_login`
--
ALTER TABLE `oc_user_login`
  ADD PRIMARY KEY (`user_login_id`);

--
-- Индексы таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  ADD PRIMARY KEY (`voucher_id`);

--
-- Индексы таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  ADD PRIMARY KEY (`voucher_history_id`);

--
-- Индексы таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  ADD PRIMARY KEY (`voucher_theme_id`);

--
-- Индексы таблицы `oc_voucher_theme_description`
--
ALTER TABLE `oc_voucher_theme_description`
  ADD PRIMARY KEY (`voucher_theme_id`,`language_id`);

--
-- Индексы таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  ADD PRIMARY KEY (`weight_class_id`);

--
-- Индексы таблицы `oc_weight_class_description`
--
ALTER TABLE `oc_weight_class_description`
  ADD PRIMARY KEY (`weight_class_id`,`language_id`);

--
-- Индексы таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  ADD PRIMARY KEY (`zone_id`);

--
-- Индексы таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  ADD PRIMARY KEY (`zone_to_geo_zone_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `oc_address`
--
ALTER TABLE `oc_address`
  MODIFY `address_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_address_format`
--
ALTER TABLE `oc_address_format`
  MODIFY `address_format_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_antispam`
--
ALTER TABLE `oc_antispam`
  MODIFY `antispam_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_api`
--
ALTER TABLE `oc_api`
  MODIFY `api_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_api_ip`
--
ALTER TABLE `oc_api_ip`
  MODIFY `api_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_api_session`
--
ALTER TABLE `oc_api_session`
  MODIFY `api_session_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_article`
--
ALTER TABLE `oc_article`
  MODIFY `article_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_article_comment`
--
ALTER TABLE `oc_article_comment`
  MODIFY `article_comment_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_attribute`
--
ALTER TABLE `oc_attribute`
  MODIFY `attribute_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT для таблицы `oc_attribute_group`
--
ALTER TABLE `oc_attribute_group`
  MODIFY `attribute_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_banner`
--
ALTER TABLE `oc_banner`
  MODIFY `banner_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_banner_image`
--
ALTER TABLE `oc_banner_image`
  MODIFY `banner_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT для таблицы `oc_cart`
--
ALTER TABLE `oc_cart`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_category`
--
ALTER TABLE `oc_category`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;

--
-- AUTO_INCREMENT для таблицы `oc_country`
--
ALTER TABLE `oc_country`
  MODIFY `country_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT для таблицы `oc_coupon`
--
ALTER TABLE `oc_coupon`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_history`
--
ALTER TABLE `oc_coupon_history`
  MODIFY `coupon_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_coupon_product`
--
ALTER TABLE `oc_coupon_product`
  MODIFY `coupon_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_cron`
--
ALTER TABLE `oc_cron`
  MODIFY `cron_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_currency`
--
ALTER TABLE `oc_currency`
  MODIFY `currency_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer`
--
ALTER TABLE `oc_customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_activity`
--
ALTER TABLE `oc_customer_activity`
  MODIFY `customer_activity_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_affiliate_report`
--
ALTER TABLE `oc_customer_affiliate_report`
  MODIFY `customer_affiliate_report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_approval`
--
ALTER TABLE `oc_customer_approval`
  MODIFY `customer_approval_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_group`
--
ALTER TABLE `oc_customer_group`
  MODIFY `customer_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_customer_history`
--
ALTER TABLE `oc_customer_history`
  MODIFY `customer_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_ip`
--
ALTER TABLE `oc_customer_ip`
  MODIFY `customer_ip_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_login`
--
ALTER TABLE `oc_customer_login`
  MODIFY `customer_login_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_reward`
--
ALTER TABLE `oc_customer_reward`
  MODIFY `customer_reward_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_search`
--
ALTER TABLE `oc_customer_search`
  MODIFY `customer_search_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_customer_transaction`
--
ALTER TABLE `oc_customer_transaction`
  MODIFY `customer_transaction_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field`
--
ALTER TABLE `oc_custom_field`
  MODIFY `custom_field_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT для таблицы `oc_custom_field_value`
--
ALTER TABLE `oc_custom_field_value`
  MODIFY `custom_field_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT для таблицы `oc_download`
--
ALTER TABLE `oc_download`
  MODIFY `download_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_download_report`
--
ALTER TABLE `oc_download_report`
  MODIFY `download_report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_event`
--
ALTER TABLE `oc_event`
  MODIFY `event_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT для таблицы `oc_extension`
--
ALTER TABLE `oc_extension`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT для таблицы `oc_extension_install`
--
ALTER TABLE `oc_extension_install`
  MODIFY `extension_install_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_extension_path`
--
ALTER TABLE `oc_extension_path`
  MODIFY `extension_path_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=500;

--
-- AUTO_INCREMENT для таблицы `oc_filter`
--
ALTER TABLE `oc_filter`
  MODIFY `filter_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_filter_group`
--
ALTER TABLE `oc_filter_group`
  MODIFY `filter_group_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_gdpr`
--
ALTER TABLE `oc_gdpr`
  MODIFY `gdpr_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_geo_zone`
--
ALTER TABLE `oc_geo_zone`
  MODIFY `geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_information`
--
ALTER TABLE `oc_information`
  MODIFY `information_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_language`
--
ALTER TABLE `oc_language`
  MODIFY `language_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_layout`
--
ALTER TABLE `oc_layout`
  MODIFY `layout_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT для таблицы `oc_layout_module`
--
ALTER TABLE `oc_layout_module`
  MODIFY `layout_module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `oc_layout_route`
--
ALTER TABLE `oc_layout_route`
  MODIFY `layout_route_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблицы `oc_length_class`
--
ALTER TABLE `oc_length_class`
  MODIFY `length_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_location`
--
ALTER TABLE `oc_location`
  MODIFY `location_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_manufacturer`
--
ALTER TABLE `oc_manufacturer`
  MODIFY `manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT для таблицы `oc_marketing`
--
ALTER TABLE `oc_marketing`
  MODIFY `marketing_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_marketing_report`
--
ALTER TABLE `oc_marketing_report`
  MODIFY `marketing_report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_module`
--
ALTER TABLE `oc_module`
  MODIFY `module_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT для таблицы `oc_notification`
--
ALTER TABLE `oc_notification`
  MODIFY `notification_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_option`
--
ALTER TABLE `oc_option`
  MODIFY `option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT для таблицы `oc_option_value`
--
ALTER TABLE `oc_option_value`
  MODIFY `option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT для таблицы `oc_order`
--
ALTER TABLE `oc_order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_history`
--
ALTER TABLE `oc_order_history`
  MODIFY `order_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_option`
--
ALTER TABLE `oc_order_option`
  MODIFY `order_option_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_product`
--
ALTER TABLE `oc_order_product`
  MODIFY `order_product_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_status`
--
ALTER TABLE `oc_order_status`
  MODIFY `order_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_order_subscription`
--
ALTER TABLE `oc_order_subscription`
  MODIFY `order_subscription_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_total`
--
ALTER TABLE `oc_order_total`
  MODIFY `order_total_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_order_voucher`
--
ALTER TABLE `oc_order_voucher`
  MODIFY `order_voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_product`
--
ALTER TABLE `oc_product`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT для таблицы `oc_product_discount`
--
ALTER TABLE `oc_product_discount`
  MODIFY `product_discount_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=441;

--
-- AUTO_INCREMENT для таблицы `oc_product_image`
--
ALTER TABLE `oc_product_image`
  MODIFY `product_image_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2374;

--
-- AUTO_INCREMENT для таблицы `oc_product_option`
--
ALTER TABLE `oc_product_option`
  MODIFY `product_option_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=227;

--
-- AUTO_INCREMENT для таблицы `oc_product_option_value`
--
ALTER TABLE `oc_product_option_value`
  MODIFY `product_option_value_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT для таблицы `oc_product_report`
--
ALTER TABLE `oc_product_report`
  MODIFY `product_report_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_product_reward`
--
ALTER TABLE `oc_product_reward`
  MODIFY `product_reward_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=546;

--
-- AUTO_INCREMENT для таблицы `oc_product_special`
--
ALTER TABLE `oc_product_special`
  MODIFY `product_special_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=440;

--
-- AUTO_INCREMENT для таблицы `oc_return`
--
ALTER TABLE `oc_return`
  MODIFY `return_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_action`
--
ALTER TABLE `oc_return_action`
  MODIFY `return_action_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_return_history`
--
ALTER TABLE `oc_return_history`
  MODIFY `return_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_return_reason`
--
ALTER TABLE `oc_return_reason`
  MODIFY `return_reason_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблицы `oc_return_status`
--
ALTER TABLE `oc_return_status`
  MODIFY `return_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_review`
--
ALTER TABLE `oc_review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_seo_url`
--
ALTER TABLE `oc_seo_url`
  MODIFY `seo_url_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT для таблицы `oc_setting`
--
ALTER TABLE `oc_setting`
  MODIFY `setting_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT для таблицы `oc_startup`
--
ALTER TABLE `oc_startup`
  MODIFY `startup_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_statistics`
--
ALTER TABLE `oc_statistics`
  MODIFY `statistics_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `oc_stock_status`
--
ALTER TABLE `oc_stock_status`
  MODIFY `stock_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_store`
--
ALTER TABLE `oc_store`
  MODIFY `store_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_subscription`
--
ALTER TABLE `oc_subscription`
  MODIFY `subscription_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_subscription_history`
--
ALTER TABLE `oc_subscription_history`
  MODIFY `subscription_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_subscription_plan`
--
ALTER TABLE `oc_subscription_plan`
  MODIFY `subscription_plan_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблицы `oc_subscription_status`
--
ALTER TABLE `oc_subscription_status`
  MODIFY `subscription_status_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT для таблицы `oc_tax_class`
--
ALTER TABLE `oc_tax_class`
  MODIFY `tax_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rate`
--
ALTER TABLE `oc_tax_rate`
  MODIFY `tax_rate_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=88;

--
-- AUTO_INCREMENT для таблицы `oc_tax_rule`
--
ALTER TABLE `oc_tax_rule`
  MODIFY `tax_rule_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT для таблицы `oc_theme`
--
ALTER TABLE `oc_theme`
  MODIFY `theme_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_topic`
--
ALTER TABLE `oc_topic`
  MODIFY `topic_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_translation`
--
ALTER TABLE `oc_translation`
  MODIFY `translation_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_upload`
--
ALTER TABLE `oc_upload`
  MODIFY `upload_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_user`
--
ALTER TABLE `oc_user`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблицы `oc_user_authorize`
--
ALTER TABLE `oc_user_authorize`
  MODIFY `user_authorize_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_user_group`
--
ALTER TABLE `oc_user_group`
  MODIFY `user_group_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_user_login`
--
ALTER TABLE `oc_user_login`
  MODIFY `user_login_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблицы `oc_voucher`
--
ALTER TABLE `oc_voucher`
  MODIFY `voucher_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_history`
--
ALTER TABLE `oc_voucher_history`
  MODIFY `voucher_history_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT для таблицы `oc_voucher_theme`
--
ALTER TABLE `oc_voucher_theme`
  MODIFY `voucher_theme_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `oc_weight_class`
--
ALTER TABLE `oc_weight_class`
  MODIFY `weight_class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT для таблицы `oc_zone`
--
ALTER TABLE `oc_zone`
  MODIFY `zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=297;

--
-- AUTO_INCREMENT для таблицы `oc_zone_to_geo_zone`
--
ALTER TABLE `oc_zone_to_geo_zone`
  MODIFY `zone_to_geo_zone_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
