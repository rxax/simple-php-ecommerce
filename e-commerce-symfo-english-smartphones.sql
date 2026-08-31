-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 01 avr. 2022 à 19:38
-- Version du serveur :  8.0.28-0ubuntu0.20.04.3
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `e-commerce-symfo`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `country`, `phone`) VALUES
(2, 1, 'Home', 'Alice', 'Johnson', '', '12 Oak Street', '10001', 'New York', 'US', '+1 212 555 0101'),
(3, 2, 'Home', 'Ben', 'Carter', '', '45 Market Street', '94105', 'San Francisco', 'US', '+1 415 555 0102'),
(4, 3, 'Home', 'Charlie', 'Wilson', '', '8 King Street', 'SW1A 1AA', 'London', 'GB', '+44 20 7946 0103'),
(5, 4, 'Home', 'Diana', 'Taylor', 'Tech Solutions Ltd', '21 River Road', 'D02 XY12', 'Dublin', 'IE', '+353 1 555 0104'),
(6, 5, 'Home', 'Ethan', 'Brown', '', '77 Main Street', '10115', 'Berlin', 'DE', '+49 30 555 0105');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Express Delivery', 'Fast delivery to your home within 1-2 business days.', 9.99),
(2, 'Standard Delivery', 'Reliable home delivery within 3-5 business days.', 4.99),
(3, 'Pickup Point', 'Collect your order from a nearby pickup point.', 2.99);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(2, 'Flagship Smartphones'),
(3, 'Mid-Range Smartphones'),
(4, 'Budget Smartphones'),
(5, 'Foldable Smartphones'),
(6, 'Gaming Smartphones'),
(7, 'Camera Smartphones'),
(8, 'Rugged Smartphones'),
(9, 'Compact Smartphones');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220216090224', '2022-02-16 09:02:53', 195),
('DoctrineMigrations\\Version20220216094827', '2022-02-16 09:48:41', 54),
('DoctrineMigrations\\Version20220218171218', '2022-02-18 17:12:29', 198),
('DoctrineMigrations\\Version20220219105301', '2022-02-19 10:53:16', 221),
('DoctrineMigrations\\Version20220220215719', '2022-02-20 21:57:28', 237),
('DoctrineMigrations\\Version20220222211707', '2022-02-22 21:17:36', 172),
('DoctrineMigrations\\Version20220226160703', '2022-02-26 16:07:11', 356),
('DoctrineMigrations\\Version20220227163839', '2022-02-27 16:38:48', 677),
('DoctrineMigrations\\Version20220227195406', '2022-03-06 19:10:19', 59),
('DoctrineMigrations\\Version20220320164349', '2022-03-20 17:43:57', 34),
('DoctrineMigrations\\Version20220321141846', '2022-03-21 15:18:54', 55),
('DoctrineMigrations\\Version20220329100058', '2022-03-29 12:01:11', 128),
('DoctrineMigrations\\Version20220401085112', '2022-04-01 10:51:23', 128),
('DoctrineMigrations\\Version20220401092032', '2022-04-01 11:20:39', 28);

-- --------------------------------------------------------

--
-- Structure de la table `headers`
--

CREATE TABLE `headers` (
  `id` int NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `headers`
--

INSERT INTO `headers` (`id`, `title`, `content`, `btn_title`, `btn_url`, `image`) VALUES
(3, 'Find your next smartphone', 'Compare the latest smartphones from trusted brands and find the right device for your needs.', 'Shop smartphones', '/articles', '2bdbe8484b1ba1c36d19137a2c6b44a314cfdbb8.jpg'),
(4, 'Fast and reliable delivery', 'Get your new smartphone delivered quickly with tracking and convenient pickup options.', 'View products', '/articles', '4ba7091fffbc5fa736faa53e65ce7b1d47dd4f8e.jpg'),
(5, 'Technology that fits your life', 'From flagship cameras to powerful gaming phones, discover smartphones for every budget and lifestyle.', 'Explore phones', '/articles', 'a92c95e83126727c338110afae40dddb1608e9c4.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_session` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `reference`, `stripe_session`, `state`) VALUES
(40, 1, '2026-08-20 10:15:00', 'Standard Delivery', '4.99', 'Alice Johnson<br>+1 212 555 0101<br>12 Oak Street<br>10001<br>New York<br>US', '20260820101500-100001', NULL, 1),
(41, 2, '2026-08-21 14:30:00', 'Express Delivery', '9.99', 'Ben Carter<br>+1 415 555 0102<br>45 Market Street<br>94105<br>San Francisco<br>US', '20260821143000-100002', NULL, 1),
(42, 3, '2026-08-22 09:20:00', 'Pickup Point', '2.99', 'Charlie Wilson<br>+44 20 7946 0103<br>8 King Street<br>SW1A 1AA<br>London<br>GB', '20260822092000-100003', NULL, 2),
(43, 4, '2026-08-23 16:45:00', 'Standard Delivery', '4.99', 'Diana Taylor<br>+353 1 555 0104<br>21 River Road<br>D02 XY12<br>Dublin<br>IE', '20260823164500-100004', NULL, 1),
(44, 5, '2026-08-24 11:10:00', 'Express Delivery', '9.99', 'Ethan Brown<br>+49 30 555 0105<br>77 Main Street<br>10115<br>Berlin<br>DE', '20260824111000-100005', NULL, 3);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int NOT NULL,
  `binded_order_id` int NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `binded_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(76, 40, 'Apple iPhone 16 Pro', 1, 1199.00, 1199.00),
(77, 41, 'Samsung Galaxy S25 Ultra', 1, 1299.00, 1299.00),
(78, 41, 'Google Pixel 9', 1, 799.00, 799.00),
(79, 42, 'OnePlus 13R', 2, 599.00, 1198.00),
(80, 43, 'Samsung Galaxy Z Fold6', 1, 1799.00, 1799.00),
(81, 44, 'ASUS ROG Phone 9', 1, 1099.00, 1099.00),
(82, 44, 'Apple iPhone 16', 1, 899.00, 899.00);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int NOT NULL,
  `category_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  `is_in_home` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `image`, `subtitle`, `description`, `price`, `is_in_home`) VALUES
(2, 2, 'Apple iPhone 16 Pro', 'apple-iphone-16-pro', 'iphone-16-pro.jpg', 'Pro performance in a titanium design', 'A premium smartphone with a powerful processor, advanced camera system, bright display, and all-day battery life.', 1199.0, 1),
(3, 2, 'Samsung Galaxy S25 Ultra', 'samsung-galaxy-s25-ultra', 'galaxy-s25-ultra.jpg', 'Ultra power and an advanced camera', 'A flagship Android smartphone with a large AMOLED display, high-performance processor, versatile cameras, and S Pen support.', 1299.0, 1),
(4, 3, 'Google Pixel 9', 'google-pixel-9', 'pixel-9.jpg', 'Smart features and an excellent camera', 'A balanced smartphone with a clean Android experience, excellent computational photography, and a bright OLED display.', 799.0, 1),
(5, 3, 'OnePlus 13R', 'oneplus-13r', 'oneplus-13r.jpg', 'Fast performance at a great price', 'A responsive smartphone with a high-refresh-rate display, powerful processor, large battery, and fast charging.', 599.0, 0),
(6, 4, 'Samsung Galaxy A26', 'samsung-galaxy-a26', 'galaxy-a26.jpg', 'Everyday smartphone value', 'An affordable smartphone offering a smooth display, dependable cameras, long battery life, and modern connectivity.', 299.0, 0),
(7, 4, 'Motorola Moto G Power', 'motorola-moto-g-power', 'moto-g-power.jpg', 'Big battery, practical design', 'A budget-friendly smartphone focused on battery life, a large display, and reliable everyday performance.', 249.0, 0),
(8, 5, 'Samsung Galaxy Z Fold6', 'samsung-galaxy-z-fold6', 'galaxy-z-fold6.jpg', 'A phone that opens into a tablet', 'A premium foldable smartphone with a large inner display, multitasking features, and flagship-level performance.', 1799.0, 1),
(9, 5, 'Google Pixel 9 Pro Fold', 'google-pixel-9-pro-fold', 'pixel-9-pro-fold.jpg', 'Flexible design with Pixel intelligence', 'A slim foldable smartphone combining a spacious inner display, versatile cameras, and useful AI-powered features.', 1599.0, 0),
(10, 6, 'ASUS ROG Phone 9', 'asus-rog-phone-9', 'rog-phone-9.jpg', 'Built for mobile gaming', 'A gaming-focused smartphone with a fast display, powerful chipset, large battery, and gaming-oriented controls.', 1099.0, 1),
(11, 7, 'Sony Xperia 1 VI', 'sony-xperia-1-vi', 'xperia-1-vi.jpg', 'Designed for photography and media', 'A premium smartphone with advanced camera controls, a high-quality display, and a strong focus on photo and video creation.', 1099.0, 0),
(12, 8, 'Samsung Galaxy XCover7', 'samsung-galaxy-xcover7', 'galaxy-xcover7.jpg', 'Ready for demanding environments', 'A durable smartphone designed for challenging conditions, with a rugged build, removable battery, and dependable connectivity.', 399.0, 0),
(13, 9, 'Apple iPhone 16', 'apple-iphone-16', 'iphone-16.jpg', 'Powerful performance in a compact design', 'A compact flagship smartphone with a high-performance processor, dual-camera system, bright display, and long battery life.', 899.0, 1);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `email` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'alice@example.com', '[]', '$2y$13$XJ6eO87g5wbbYo1VVGsSa.K3ZoY3nxb/AP7jesP.B4pQ5uCTPnWta', 'Alice', 'Johnson'),
(2, 'ben@example.com', '[]', '$2y$13$hbsvJpSPsTAifkSz7EKdnek5JELREFm7AcAD2waapW.CGbPPb9/Xa', 'Ben', 'Carter'),
(3, 'charlie@example.com', '[]', '$2y$13$V8gb44ppyH26z1aGFrrrg.YHVwNCrO2uoDCODyAqkKb3IehWYw/de', 'Charlie', 'Wilson'),
(4, 'diana@example.com', '[]', '$2y$13$TIqH1opO82k7lhHZIQx3RuJcMOOZd4wgpILAC8BQ7Fm0L31Lhrop2', 'Diana', 'Taylor'),
(5, 'ethan@example.com', '[]', '$2y$13$aS8uwK/U422zKIQPZVan6.xxXHbKDLe0QBu3BrA6cv3bT8NJydCFi', 'Ethan', 'Brown'),
(6, 'fiona@example.com', '[]', '$2y$13$sfixY8eaiATRLoXXOsAPHeONkAzCrsnP9tdIOBRgnpxc3ROBgvREW', 'Fiona', 'Davis'),
(7, 'admin@example.com', '["ROLE_ADMIN"]', '$2y$13$5eh2MdTTmp3saxjVSdSDpuuI1U4OFVbfj9rLOMK0MZOeatvcPciSa', 'Alex', 'Morgan');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D4E6F81A76ED395` (`user_id`);

--
-- Index pour la table `carrier`
--
ALTER TABLE `carrier`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `headers`
--
ALTER TABLE `headers`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_F5299398A76ED395` (`user_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_845CA2C17C78A4E3` (`binded_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `address`
--
ALTER TABLE `address`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `headers`
--
ALTER TABLE `headers`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C17C78A4E3` FOREIGN KEY (`binded_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
