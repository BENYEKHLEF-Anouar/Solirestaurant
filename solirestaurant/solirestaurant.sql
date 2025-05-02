-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 03 mars 2025 à 12:31
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `solirestaurant`
--

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `idClient` int(11) NOT NULL,
  `nomCl` varchar(50) NOT NULL,
  `prenomCl` varchar(50) DEFAULT NULL,
  `telCl` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idClient`, `nomCl`, `prenomCl`, `telCl`) VALUES
(1, 'Dupont', 'Jean', '0601020304'),
(2, 'Martin', 'Sophie', '0605060708'),
(3, 'El Aouni', 'Ahmed', '0611223344'),
(4, 'Rodriguez', 'Maria', '0655667788'),
(5, 'Snow', 'Jon', '0629382913'),
(6, 'Benyekhlef', 'Anouar', '0677889900'),
(7, 'TEST', 'TEST2', '+212771300601'),
(8, 'Hmido', 'Rapido', '+212772330603'),
(9, 'Madd', 'Med', '+212677889900');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE `commande` (
  `idCmd` char(4) NOT NULL,
  `dateCmd` datetime DEFAULT current_timestamp(),
  `Statut` varchar(100) DEFAULT 'en attente',
  `idCl` int(11) DEFAULT NULL
) ;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idCmd`, `dateCmd`, `Statut`, `idCl`) VALUES
('C001', '2024-01-01 12:30:00', 'en attente', 1),
('C002', '2024-01-14 13:15:00', 'en cours', 2),
('C003', '2024-01-15 14:00:00', 'expédiée', 3),
('C004', '2024-01-20 15:45:00', 'livrée', 4),
('C005', '2024-02-14 16:30:00', 'annulée', 5),
('C006', '2024-02-22 19:25:00', 'livrée', 6);

-- --------------------------------------------------------

--
-- Structure de la table `commande_plat`
--

CREATE TABLE `commande_plat` (
  `idPlat` int(11) NOT NULL,
  `idCmd` char(4) NOT NULL,
  `qte` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `commande_plat`
--

INSERT INTO `commande_plat` (`idPlat`, `idCmd`, `qte`) VALUES
(1, 'C001', 2),
(2, 'C002', 3),
(3, 'C001', 1),
(4, 'C003', 2),
(5, 'C003', 1),
(6, 'C004', 2),
(7, 'C005', 1),
(8, 'C006', 2);

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

CREATE TABLE `plat` (
  `idPlat` int(11) NOT NULL,
  `nomPlat` varchar(100) NOT NULL,
  `categoriePlat` varchar(100) NOT NULL,
  `TypeCuisine` varchar(250) NOT NULL,
  `prix` decimal(6,2) NOT NULL,
  `image` varchar(500) NOT NULL
) ;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`idPlat`, `nomPlat`, `categoriePlat`, `TypeCuisine`, `prix`, `image`) VALUES
(1, 'Harira', 'entrée', 'Marocaine', 40.00, 'https://tasteofmaroc.com/wp-content/uploads/2017/05/harira-2-moroccan-soup-picturepartners-bigstock.jpg'),
(2, 'Pastilla au poulet', 'plat principal', 'Marocaine', 110.00, 'https://www.minahalal.com/wp-content/uploads/2015/02/pastilla-au-poulet_11066.png'),
(3, 'Chebakia', 'dessert', 'Marocaine', 35.00, 'https://tasteofmaroc.com/wp-content/uploads/2020/04/chebakia-picturepartners-bigstock-scaled.jpg'),
(4, 'Lasagnes', 'plat principal', 'Italienne', 95.00, 'https://cdn.apartmenttherapy.info/image/upload/f_jpg,q_auto:eco,c_fill,g_auto,w_1500,ar_4:3/k%2FPhoto%2FRecipes%2F2024-11-lasagna-recipe%2Flasagna-recipe-115'),
(5, 'Panna Cotta', 'dessert', 'Italienne', 55.00, 'https://pescetarian.kitchen/wp-content/uploads/2017/01/IMG_1061.jpg'),
(6, 'Bruschetta', 'entrée', 'Italienne', 50.00, 'https://www.simplyorganic.com/media/wysiwyg/tmp/simply-oragnic-Roasted-Tomato-Bruschetta-1080x1080-thumbnail.jpg'),
(7, 'Nems au poulet', 'entrée', 'Chinoise', 60.00, 'https://epicesetdelices.fr/wp-content/uploads/2023/01/nem-au-poulet.jpg'),
(8, 'Canard laqué', 'plat principal', 'Chinoise', 140.00, 'https://assets.afcdn.com/recipe/20210112/117115_w1024h1024c1cx2391cy2325cxt0cyt0cxb5760cyb3840.jpg'),
(9, 'Perles de coco', 'dessert', 'Chinoise', 45.00, 'https://odelices.ouest-france.fr/images/recettes/2016/perles_coco_boules_de_coco_asiatiques_a_la_farine_de_riz_gluant.jpg'),
(10, 'Gazpacho', 'entrée', 'Espagnole', 55.00, 'https://www.acouplecooks.com/wp-content/uploads/2021/07/Gazpacho-002s.jpg'),
(11, 'Tortilla espagnole', 'plat principal', 'Espagnole', 85.00, 'https://img.cuisineaz.com/660x660/2013/12/20/i22917-tortilla-espagnole.jpeg'),
(12, 'Churros', 'dessert', 'Espagnole', 50.00, 'https://www.recipetineats.com/tachyon/2016/08/Churros_9-SQ.jpg'),
(13, 'Foie gras', 'entrée', 'Francaise', 150.00, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/Foie_gras_en_cocotte.jpg/640px-Foie_gras_en_cocotte.jpg'),
(14, 'Boeuf bourguignon', 'plat principal', 'Francaise', 160.00, 'https://odelices.ouest-france.fr/images/recettes/boeuf-bourguignon-761x1024.jpg.webp'),
(15, 'Mille-feuille', 'dessert', 'Francaise', 65.00, 'https://img.cuisineaz.com/1024x576/2022/09/30/i188300-sans-titre-2022-09-30t115159-287.png');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`idClient`),
  ADD UNIQUE KEY `telCl` (`telCl`);

--
-- Index pour la table `commande`
--
ALTER TABLE `commande`
  ADD PRIMARY KEY (`idCmd`),
  ADD KEY `idCl` (`idCl`);

--
-- Index pour la table `commande_plat`
--
ALTER TABLE `commande_plat`
  ADD PRIMARY KEY (`idPlat`,`idCmd`),
  ADD KEY `idCmd` (`idCmd`);

--
-- Index pour la table `plat`
--
ALTER TABLE `plat`
  ADD PRIMARY KEY (`idPlat`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `plat`
--
ALTER TABLE `plat`
  MODIFY `idPlat` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`idCl`) REFERENCES `client` (`idClient`);

--
-- Contraintes pour la table `commande_plat`
--
ALTER TABLE `commande_plat`
  ADD CONSTRAINT `commande_plat_ibfk_1` FOREIGN KEY (`idPlat`) REFERENCES `plat` (`idPlat`),
  ADD CONSTRAINT `commande_plat_ibfk_2` FOREIGN KEY (`idCmd`) REFERENCES `commande` (`idCmd`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
