-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 26 oct. 2021 à 07:21
-- Version du serveur :  8.0.21
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `masuperagence`
--

-- --------------------------------------------------------

--
-- Structure de la table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D4E6F81A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `country`, `phone`) VALUES
(20, 15, 'AGENCE TANA', 'Aina', 'Mal\"s', NULL, 'Mahazo Soamanandrariny', '0240408', 'Antananarivo 101', 'MG', '034 36 561 78'),
(21, 4, 'Cité', 'Mal\"s', 'Ni', NULL, '8 rue des lylas', '80882', 'Paris', 'FR', '0348413912'),
(22, 19, 'Maison', 'Irinah', 'Aina', NULL, 'Tsarahonenana', '02404', 'Tana 101', 'MG', '0326719072'),
(23, 20, 'Maison', 'Ni', 'Irinah', 'ARENA', 'Antsahameva Andraisoro', '18104', 'Tana V', 'MG', '0348413912'),
(24, 5, 'Maison', 'Irinah', 'Andriah', 'Groupe Tsarahonenana', '147D Mahazo Soamanandrarina', '1804108', 'Antananarivo', 'MG', '0342852038'),
(25, 4, 'Maison', 'Irinah', 'Andriah', NULL, 'Tsarahonenana', '0240408', 'Tana V', 'MG', '0326719072'),
(26, 19, 'Cité', 'Aina', 'Ni', NULL, '8 rue des lylas', '80882', 'Paris', 'FR', '0346547291'),
(27, 5, 'Cité', 'Irinah', 'Ni', NULL, '8 rue des lylas', '80880', 'Paris', 'FR', '0327186349'),
(28, 20, 'Cité', 'Ni', 'Irinah', NULL, '10 rue de XAVI', '04082', 'Amérique', 'US', '0347895164');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(2, 'Chronopost', 'Profitez de la livraison express pour être livré le lendemain de votre commande.', 3200000),
(6, 'Colis-Express', 'Profitez une livraison prémium avec un Colis-Express de Mada', 2200000);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Manteaux'),
(3, 'T-shirts'),
(5, 'Jupes'),
(7, 'Robes'),
(8, 'Shorts');

-- --------------------------------------------------------

--
-- Structure de la table `comment`
--

DROP TABLE IF EXISTS `comment`;
CREATE TABLE IF NOT EXISTS `comment` (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_9474526CA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `comment`
--

INSERT INTO `comment` (`id`, `content`, `created_at`, `user_id`) VALUES
(15, 'UBACKQZ0XS4MeVgWCHNTeAVlUn1ZQFFEXXAEeQIKA0EFGgVD', '2021-10-13 06:56:40', 4),
(16, 'VBcFpgNYA3cMeFUnVPxRQFcCVHlQI1NxCXhbQw==', '2021-10-13 07:08:57', 19);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20210907162502', '2021-09-07 16:25:47', 1142),
('DoctrineMigrations\\Version20210907165744', '2021-09-07 16:58:02', 337),
('DoctrineMigrations\\Version20210908152501', '2021-09-08 15:25:24', 916),
('DoctrineMigrations\\Version20210908161150', '2021-09-08 16:18:15', 2113),
('DoctrineMigrations\\Version20210921133821', '2021-09-21 13:38:49', 3214),
('DoctrineMigrations\\Version20210922030140', '2021-09-22 03:02:03', 474),
('DoctrineMigrations\\Version20210922032901', '2021-09-22 03:29:20', 3473),
('DoctrineMigrations\\Version20210923095551', '2021-09-23 09:56:15', 2156),
('DoctrineMigrations\\Version20210928140709', '2021-09-28 14:08:12', 2444),
('DoctrineMigrations\\Version20210930054427', '2021-09-30 05:44:43', 2781),
('DoctrineMigrations\\Version20210930112028', '2021-09-30 11:20:56', 1445),
('DoctrineMigrations\\Version20210930115011', '2021-09-30 11:50:40', 401),
('DoctrineMigrations\\Version20210930135942', '2021-09-30 14:00:38', 776),
('DoctrineMigrations\\Version20210930155105', '2021-09-30 15:52:13', 2654),
('DoctrineMigrations\\Version20210930190541', '2021-09-30 19:05:52', 2831),
('DoctrineMigrations\\Version20211003021611', '2021-10-03 02:16:27', 3247),
('DoctrineMigrations\\Version20211003023349', '2021-10-03 02:33:56', 2270),
('DoctrineMigrations\\Version20211003032430', '2021-10-03 03:24:37', 3894),
('DoctrineMigrations\\Version20211004144823', '2021-10-04 14:49:21', 2811),
('DoctrineMigrations\\Version20211008103510', '2021-10-08 10:38:28', 1122),
('DoctrineMigrations\\Version20211008105729', '2021-10-08 10:57:47', 692),
('DoctrineMigrations\\Version20211010073156', '2021-10-10 07:46:20', 2475),
('DoctrineMigrations\\Version20211013052026', '2021-10-13 05:20:48', 932);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307FA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `user_id`, `phone`, `message`) VALUES
(48, 4, '0348413912', 'B0cEIAdyUCtcJFVNVCMCLgJjAC0DTwQZCiJVGQJdVhxVEgcoAExdSQhqU0gHd1J0A3IDrVg1ATUAHlQnUKICEQduBBkHc1AlXCVVKVRRAigCTAApA0YEIwpRVS0CGFYbVRAHHwABXRgIQ1NFB0NSGw=='),
(49, 19, '0326719072', 'VRUDIgR2USsMfVdPAEcFKwxeAh5WHQEiAH4DUVVvBR0CegcVBXZUFA1kVCMHEQEoUnFUf1Y1VH0IKVBOABAMSVUNAx4ERFEYDChXSQ=='),
(50, 20, '0348413912', 'BicCGFISXBEBTwd1ACEBEAJfUxVYJwMhDidULwELAhpULgYYURIBfAxWB3gGEFR9UBgESVk0U0ELLgF8VmlRJAZWAkdSTg=='),
(51, 4, '0321271486', 'AkIAKlQYXS4NfQJqASBRcFYgVXdZFlYRDXJRIVZbUh4Gc1N+UhMEQloBAk9UXQ=='),
(52, 19, '0348416178', 'BHQCJwJ2VCJeFQAYVC8HKQNSU35TIQYrWyRREQMKB0oOSwc/VHEDfg5rVRYHdgQZBXAGRVJW'),
(54, 5, '0348265731', 'BXUNFwVJXC8AfgduAkBTQlU4VXRTSgcsCB4AcgE5DE4GfgAsBnUHE1w3AH8Dc1McBUwAH1YKAC4JFwcXASICHw==');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `is_paid`) VALUES
(57, 4, '2021-10-13 06:56:16', 'Chronopost', 3700000, 'Mal\"s Ni<br/>0348413912<br/>Ampanotokana IV-Fib8GE<br/>504012 Antananarivo<br/>MG', 1),
(58, 19, '2021-10-13 07:07:24', 'Colis-Express', 2200000, 'Irinah Aina<br/>0326719072<br/>Tsarahonenana<br/>02404 Tana 101<br/>MG', 0),
(59, 20, '2021-10-13 10:18:54', 'Chronopost', 3700000, 'Ni Irinah<br/>0348413912<br/>ARENA<br/>Antsahameva Andraisoro<br/>18104 Tana V<br/>MG', 1),
(60, 5, '2021-10-14 14:54:33', 'Chronopost', 3700000, 'Irinah Andriah<br/>0342852038<br/>Groupe Tsarahonenana<br/>147D Mahazo Soamanandrarina<br/>1804108 Antananarivo<br/>MG', 0),
(62, 4, '2021-10-14 16:21:29', 'Colis-Express', 2200000, 'Mal\"s Ni<br/>0348413912<br/>Ampanotokana IV-Fib8GE<br/>504012 Antananarivo<br/>MG', 1),
(63, 4, '2021-10-19 13:21:27', 'Chronopost', 3700000, 'Mal\"s Ni<br/>0348413912<br/>Ampanotokana IV-Fib8GE<br/>504012 Antananarivo<br/>MG', 0),
(64, 4, '2021-10-19 13:21:47', 'Chronopost', 3700000, 'Mal\"s Ni<br/>0348413912<br/>Ampanotokana IV-Fib8GE<br/>504012 Antananarivo<br/>MG', 1),
(65, 4, '2021-10-20 09:17:11', 'Colis-Express', 2200000, 'Irinah Andriah<br/>0326719072<br/>Tsarahonenana<br/>0240408 Tana V<br/>MG', 1),
(66, 19, '2021-10-20 09:24:10', 'Colis-Express', 2200000, 'Irinah Aina<br/>0326719072<br/>Tsarahonenana<br/>02404 Tana 101<br/>MG', 0),
(67, 4, '2021-10-25 15:23:40', 'Colis-Express', 2200000, 'Irinah Andriah<br/>0326719072<br/>Tsarahonenana<br/>0240408 Tana V<br/>MG', 0),
(68, 5, '2021-10-26 06:59:06', 'Chronopost', 3200000, 'Irinah Andriah<br/>0342852038<br/>Groupe Tsarahonenana<br/>147D Mahazo Soamanandrarina<br/>1804108 Antananarivo<br/>MG', 1);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int NOT NULL AUTO_INCREMENT,
  `my_order_id` int NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845CA2C1BFCDF877` (`my_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(113, 57, 'Jupe droite noire', 1, 2800000, 2800000),
(114, 57, 'Veste-kaki', 1, 4000000, 4000000),
(115, 58, 'Le t-shirt manche longue', 2, 2800000, 5600000),
(116, 58, 'Manteau Français', 1, 3500000, 3500000),
(117, 59, 'PANTALON SPORT DE MONTAGNE', 3, 3800000, 11400000),
(118, 60, 'Le t-shirt basic', 3, 3000000, 9000000),
(120, 62, 'Le t-shirt manche longue', 1, 4500000, 4500000),
(121, 63, 'Le t-shirt manche longue', 1, 4500000, 4500000),
(122, 64, 'Le t-shirt manche longue', 1, 4500000, 4500000),
(123, 65, 'PANTALON SPORT DE MONTAGNE', 3, 3800000, 11400000),
(124, 66, 'Robe maxi freezer', 1, 5000000, 5000000),
(125, 66, 'Sous-vêtement classique', 3, 4200000, 12600000),
(126, 67, 'Manteau Français', 2, 3500000, 7000000),
(127, 67, 'PANTALON SPORT DE MONTAGNE', 1, 3800000, 3800000),
(128, 68, 'Jupe droite noire', 2, 2800000, 5600000);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`) VALUES
(14, 3, 'Le t-shirt manche longue', 'le-t-shirt-manche-longue', 'ffe8c4d23fbda5f5c02be68fed81978b6b5bc3cc.jpg', 'Le T-shirt taillé', 'Mettez votre silhouette en valeur ! Ce t-shirt à manches longues en coton bio doux comme la soie est idéal pour la mi-saison et les soirées à la fraîche.\r\nCoupe près du corps\r\nCol danseuse\r\nTissu agréablement léger : 120 g/m²\r\n100 % coton issu de l’agriculture biologique contrôlée', 4500000),
(15, 3, 'Le t-shirt basic', 'le-t-shirt-basic', 'a8562179ea74986156dc5f5e2ff78c1bd2368b17.jpg', 'Le basic parfait pour les hommes', 'Col rond\r\nManches courtes\r\nFinitions bas arrondis\r\nLogo relief en embossage\r\n65%Cotton,35%Polyester\r\nLavable en machine MAX.30°C', 3000000),
(21, 5, 'Jupe crayon taille haute', 'jupe-crayon-taille-haute', '686b61e141a1c77688e6732e76f488e2d461fb56.jpg', 'Jupe crayon taille haute, parfait pour les femmes', 'Mini Jupe crayon taille haute pour femmes, tenue de bureau élégante, fendue, à la mode, noire, nouvelle collection 2021', 3700000),
(22, 5, 'Jupe droite noire', 'jupe-droite-noire', '3a2a0b1c4a2f7cd828606a05ba947cbb09f76f50.jpg', 'Jupe de tailleur coupe droite', 'Jupe genoux, droite, munie d\'une fermeture zippée apparente au dos, rehaussant une fente d\'aisance. Large bande à la taille avec plaque logotypée.\r\n\r\nLongueur ceinture à ourlet : 55 cm en taille 38 FR.', 2800000),
(23, 8, 'Sous-vêtement classique', 'sous-vetement-classique', 'da181cccdf2ab71deb09f79322813967cfde8d50.jpg', 'Falcon short sport', 'Sous-vêtement classique pour homme très confortable, doux au toucher, en coton, confortable et à angle plat super traitement: la ceinture élastique douce est agréablement fine et respirante!', 4200000),
(24, 8, 'PANTALON SPORT DE MONTAGNE', 'pantalon-sport-de-montagne', 'b5809f6f4daf6bbd2f113f7b6d686d83a023a206.jpg', 'SHORT SPORT DE MONTAGNE', 'Matériaux de haute qualité design attrayant, juste pour répondre à vos demandes. ♥Confortable avec une bonne élasticité. ♥Conception de poche latérale, pour vous permettre de ranger les articles appropriés', 3800000),
(25, 1, 'Manteau Français', 'manteau-francais', '07315f7771561735b2b85a9b3a0bf984672013fc.jpg', 'Manteau Français, parfait pour vos soirée', 'Robe en velours, collants impeccables, escarpins vertigineux, pochette à sequins... Votre tenue de fêtes n\'a jamais été aussi réussie. Mais voilà qu\'à l\'heure de quitter votre domicile pour le lieu où se tiendra le réveillon, enfiler votre manteau de tous les jours - élimé, non assorti, trop casual - ruine vos efforts stylistiques. Pour éviter toute déconvenue, voici une sélection de beaux manteaux, à la fois chauds et élégants, pour sublimer votre tenue quelle qu\'elle soit.', 3500000),
(26, 1, 'Veste-kaki', 'veste-kaki', 'd86eeebdb6fafb15b66c642cd6c8c0a265e04180.jpg', 'Veste-style-officier-kaki-manches-longues-femme', 'vous propose cette veste style officier kaki à manches longues col montant pour femme de la marque ONLY à prix dégriffé. Saison : Toutes saisons', 4000000),
(29, 7, 'Robe maxi freezer', 'robe-maxi-freezer', '788370ebc7d7b6f290629d3ef09766cfd3425b97.jpg', 'Robe maxi freezer parfait pour les femmes', 'C’est la robe parfaite pour aller à un mariage, mais aussi pour passer du bureau à l’apéro. On enlève le veston, on rajoute des verres solaires et de jolies sandales pour allez rejoindre ses amies. On préfère les modèles structurés de ligne A, un peu évasés vers le bas, qui définissent bien la silhouette. On suit la tendance avec les couleurs de la saison et des détails à la mode comme les volants, les lacets ou encore la matière comme le filet et la dentelle.', 5000000);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`, `phone`) VALUES
(4, 'NiMals@gmail.com', '[\"ROLE_USER\"]', '$2y$13$WDdHaJI/6iB0LyzJZ929NeKfhU66n/CpKo/awsSYkaYHvfyPijire', 'Mal\"s', 'Ni', '034 72 534 81'),
(5, 'Irinahandria@gmail.com', '[\"ROLE_USER\"]', '$2y$13$a5uROhOfxuQ2UEdhya8Cc.6gpNNNdUyg9TV3RyOEsd23N.AzNh0Dq', 'Irinah', 'Manantena', '034 12 852 64'),
(15, 'Manantenaandriani@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$bWSchRPAvv3wtq1rNqh2zetfWbeWJDj63hqBKVsPpiXY5c8V1rMOK', 'Aina', 'Mahefa', '034 36 561 78'),
(19, 'NiAli@gmail.com', '[\"ROLE_USER\"]', '$2y$13$eRAQHlAFzzgU/GjuqEccR.f8NgPHYVtjEzLjKWrCAdbYOVNVFxcCK', 'Irinah', 'Nï', '033 74 212 34'),
(20, 'IrinahNi@gmail.com', '[\"ROLE_USER\"]', '$2y$13$94Grtlxi7LcAJPPJnKOCveqADohks4n80cd95lCd.h/v.YPWqM2IC', 'Ni', 'Irinah', '034 84 139 12');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `FK_D4E6F81A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `comment`
--
ALTER TABLE `comment`
  ADD CONSTRAINT `FK_9474526CA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_B6BD307FA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
