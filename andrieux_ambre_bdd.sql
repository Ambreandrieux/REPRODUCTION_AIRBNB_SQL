-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 14 mai 2023 à 18:46
-- Version du serveur : 5.7.36
-- Version de PHP : 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `dm_airbnb`
--

-- --------------------------------------------------------

--
-- Structure de la table `annonce`
--

DROP TABLE IF EXISTS `annonce`;
CREATE TABLE IF NOT EXISTS `annonce` (
  `id_annonce` int(11) NOT NULL AUTO_INCREMENT,
  `annonce_titre` varchar(50) NOT NULL,
  `annonce_img` varchar(50) NOT NULL,
  `annonce_description` text NOT NULL,
  `id_annonceur` int(11) NOT NULL,
  `id_ville` int(11) NOT NULL,
  `id_type_logement` int(11) NOT NULL,
  PRIMARY KEY (`id_annonce`),
  KEY `annonce_annonceur_FK` (`id_annonceur`),
  KEY `annonce_ville0_FK` (`id_ville`),
  KEY `annonce_type_logement1_FK` (`id_type_logement`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `annonce`
--

INSERT INTO `annonce` (`id_annonce`, `annonce_titre`, `annonce_img`, `annonce_description`, `id_annonceur`, `id_ville`, `id_type_logement`) VALUES
(1, 'Studio cosy au cœur de Paris', 'https://urlz.fr/lR4G', 'Bienvenue dans notre charmant studio en plein centre de Paris, idéal pour profiter pleinement de la capitale avec son lit douillet, sa kitchenette pratique et sa proximité des principaux sites touristiques, restaurants et boutiques, réservez dès maintenant pour une immersion dans l\'atmosphère unique de cette magnifique ville !', 3, 1, 1),
(2, 'Appartement moderne en plein cœur de Paris', 'https://urlz.fr/lR4I', 'Bienvenue dans notre appartement moderne idéalement situé en plein cœur de Paris, offrant un espace élégant et fonctionnel, entouré de boutiques, restaurants et sites touristiques incontournables pour profiter pleinement de votre séjour dans la capitale française.', 1, 1, 1),
(3, 'Chalet rustique en pleine campagne près de Paris', 'https://urlz.fr/lR4L', 'Bienvenue dans notre charmant chalet rustique, niché dans un cadre naturel préservé à proximité de Paris, offrant une escapade paisible et ressourçante avec des espaces chaleureux, une vue imprenable sur la campagne environnante, et la possibilité de profiter d\'activités de plein air pour une expérience unique en harmonie avec la nature.', 2, 1, 2),
(4, 'Chalet enchanteur en pleine campagne près de Paris', 'https://urlz.fr/lR4P', 'Évadez-vous de la vie citadine et découvrez un havre de paix dans notre chalet pittoresque, niché au cœur de la campagne parisienne.', 3, 1, 2),
(5, 'Appartement élégant au cœur vibrant de Paris', 'https://urlz.fr/lR4R', 'Découvrez le charme de la vie parisienne depuis notre appartement élégant, idéalement situé en plein centre-ville, à proximité des meilleurs restaurants, boutiques et attractions de la capitale.', 2, 1, 1),
(6, 'Charmant chalet à quelques minutes de Paris.', 'https://urlz.fr/lR4Y', 'Plongez-vous dans la tranquillité de la campagne dans ce charmant chalet, niché dans un cadre verdoyant et paisible, tout en restant à proximité de l\'animation de la capitale.', 3, 1, 2),
(7, 'Charmant chalet dans un cadre naturel préservé.', 'https://urlz.fr/lR4V', 'Évadez-vous de la ville et détendez-vous dans ce chalet douillet avec vue sur la campagne environnante.', 2, 1, 2),
(8, 'Séjournez dans un chalet au cœur de la nature.', 'https://urlz.fr/lR4X', 'Profitez d\'une escapade paisible dans ce chalet rustique entouré de verdure et de calme, à seulement quelques kilomètres de la ville.', 3, 1, 2),
(9, 'Chalet avec vue imprenable en campagne', 'https://urlz.fr/lRjk', 'Découvrez le charme authentique de notre chalet en bois niché au cœur de la campagne marseillaise. Profitez d\'une vue panoramique à couper le souffle, de la tranquillité et du confort d\'un véritable havre de paix. Idéal pour les amoureux de la nature et les adeptes de détente en plein air.', 1, 2, 2),
(10, 'Chalet romantique dans un écrin de verdure', 'https://urlz.fr/lRjl', 'Évadez-vous dans notre chalet romantique, entouré par la nature luxuriante de la campagne marseillaise. Offrez-vous un séjour paisible et ressourçant, loin de l\'agitation de la ville. Profitez de moments de détente en plein air, de promenades romantiques et de soirées à la belle étoile.', 2, 2, 2),
(11, 'Chalet de charme avec piscine privée', 'https://urlz.fr/lRjo', 'Venez vous relaxer dans notre chalet de charme avec piscine privée, situé dans un cadre bucolique à proximité de Marseille. Profitez d\'un séjour alliant confort et tranquillité, plongez dans les eaux cristallines de la piscine, et savourez des moments de convivialité en plein air. Une escapade idéale pour se ressourcer en pleine nature.', 1, 2, 2),
(12, 'Villa de rêve avec vue imprenable sur la mer', 'https://urlz.fr/lRjS', ' Cette villa de luxe vous offre une vue panoramique sur la mer Méditerranée depuis chaque pièce et une terrasse spacieuse pour profiter des couchers de soleil éblouissants.', 3, 2, 3),
(13, 'Villa moderne avec vue mer à couper le souffle', 'https://urlz.fr/lRjT', 'Cette villa contemporaine vous séduira par ses larges baies vitrées donnant sur une vue imprenable sur la mer et sa terrasse ensoleillée pour vous détendre et vous ressourcer.', 1, 2, 3),
(14, 'Villa exclusive avec vue mer exceptionnelle', 'https://urlz.fr/lRjU', 'Cette villa de prestige vous offre une vue à 180 degrés sur la mer, une piscine privée et un intérieur élégant et confortable pour des vacances inoubliables dans un cadre idyllique.', 3, 2, 3),
(15, 'Charmant appartement en plein cœur', 'https://urlz.fr/lRjZ', 'Cet appartement confortable et élégant est idéalement situé en plein centre-ville de Marseille, à proximité des principales attractions touristiques, des boutiques et des restaurants, offrant ainsi un séjour pratique et authentique.', 1, 2, 1),
(16, 'Appartement moderne au cœur vibrant de Marseille', 'https://urlz.fr/lRk0', 'Profitez de cet appartement contemporain situé en plein cœur de Marseille, à quelques pas des rues animées, des marchés colorés et des lieux culturels, pour découvrir l\'ambiance unique de cette ville méditerranéenne.', 1, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `annonceur`
--

DROP TABLE IF EXISTS `annonceur`;
CREATE TABLE IF NOT EXISTS `annonceur` (
  `id_annonceur` int(11) NOT NULL AUTO_INCREMENT,
  `annonceur_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_annonceur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `annonceur`
--

INSERT INTO `annonceur` (`id_annonceur`, `annonceur_nom`) VALUES
(1, 'Lambert'),
(2, 'Leroy'),
(3, 'Garcia');

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

DROP TABLE IF EXISTS `note`;
CREATE TABLE IF NOT EXISTS `note` (
  `id_utilisateur` int(11) NOT NULL,
  `id_annonce` int(11) NOT NULL,
  `note_valeur` float NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_annonce`),
  KEY `note_annonce0_FK` (`id_annonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `note`
--

INSERT INTO `note` (`id_utilisateur`, `id_annonce`, `note_valeur`) VALUES
(1, 1, 4.8),
(1, 3, 4.9),
(1, 14, 4.2),
(1, 15, 4.7),
(2, 2, 3.5),
(2, 6, 5),
(2, 7, 4.5),
(2, 8, 4),
(2, 9, 4.8),
(2, 10, 4.6),
(2, 11, 4.4),
(2, 13, 4.5),
(3, 4, 5),
(3, 5, 4),
(3, 12, 4.9),
(3, 16, 4.3);

-- --------------------------------------------------------

--
-- Structure de la table `reserve`
--

DROP TABLE IF EXISTS `reserve`;
CREATE TABLE IF NOT EXISTS `reserve` (
  `id_utilisateur` int(11) NOT NULL,
  `id_annonce` int(11) NOT NULL,
  PRIMARY KEY (`id_utilisateur`,`id_annonce`),
  KEY `reserve_annonce0_FK` (`id_annonce`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_logement`
--

DROP TABLE IF EXISTS `type_logement`;
CREATE TABLE IF NOT EXISTS `type_logement` (
  `id_type_logement` int(11) NOT NULL AUTO_INCREMENT,
  `type_logement_libelle` varchar(100) NOT NULL,
  PRIMARY KEY (`id_type_logement`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `type_logement`
--

INSERT INTO `type_logement` (`id_type_logement`, `type_logement_libelle`) VALUES
(1, 'Appartement en centre-ville'),
(2, 'Chalet en montagne'),
(3, 'Villa avec vue sur la mer');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

DROP TABLE IF EXISTS `utilisateur`;
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int(11) NOT NULL AUTO_INCREMENT,
  `utilisateur_nom` varchar(50) NOT NULL,
  `utilisateur_prenom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`id_utilisateur`, `utilisateur_nom`, `utilisateur_prenom`) VALUES
(1, 'Martin', 'Alexandre'),
(2, 'Dubois', 'Camille'),
(3, 'Dupont', 'Julien');

-- --------------------------------------------------------

--
-- Structure de la table `ville`
--

DROP TABLE IF EXISTS `ville`;
CREATE TABLE IF NOT EXISTS `ville` (
  `id_ville` int(11) NOT NULL AUTO_INCREMENT,
  `ville_nom` varchar(50) NOT NULL,
  PRIMARY KEY (`id_ville`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `ville`
--

INSERT INTO `ville` (`id_ville`, `ville_nom`) VALUES
(1, 'Paris'),
(2, 'Marseille');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `annonce`
--
ALTER TABLE `annonce`
  ADD CONSTRAINT `annonce_annonceur_FK` FOREIGN KEY (`id_annonceur`) REFERENCES `annonceur` (`id_annonceur`),
  ADD CONSTRAINT `annonce_type_logement1_FK` FOREIGN KEY (`id_type_logement`) REFERENCES `type_logement` (`id_type_logement`),
  ADD CONSTRAINT `annonce_ville0_FK` FOREIGN KEY (`id_ville`) REFERENCES `ville` (`id_ville`);

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `note_annonce0_FK` FOREIGN KEY (`id_annonce`) REFERENCES `annonce` (`id_annonce`),
  ADD CONSTRAINT `note_utilisateur_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);

--
-- Contraintes pour la table `reserve`
--
ALTER TABLE `reserve`
  ADD CONSTRAINT `reserve_annonce0_FK` FOREIGN KEY (`id_annonce`) REFERENCES `annonce` (`id_annonce`),
  ADD CONSTRAINT `reserve_utilisateur_FK` FOREIGN KEY (`id_utilisateur`) REFERENCES `utilisateur` (`id_utilisateur`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
