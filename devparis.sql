-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 16 jan. 2023 à 23:38
-- Version du serveur : 10.4.27-MariaDB
-- Version de PHP : 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `devparis`
--

-- --------------------------------------------------------

--
-- Structure de la table `informaticien`
--

CREATE TABLE `informaticien` (
  `IDInf` int(11) NOT NULL,
  `NomInf` varchar(25) DEFAULT NULL,
  `PrenomInf` varchar(25) DEFAULT NULL,
  `DateNaissanceInf` date DEFAULT NULL,
  `Ville` varchar(25) DEFAULT NULL,
  `Salaire` decimal(7,2) DEFAULT NULL,
  `Fonction` varchar(25) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `informaticien`
--

INSERT INTO `informaticien` (`IDInf`, `NomInf`, `PrenomInf`, `DateNaissanceInf`, `Ville`, `Salaire`, `Fonction`) VALUES
(2, 'SIDALI', 'Samir', '2001-04-01', 'Agadir', '7500.00', 'Développeur'),
(3, 'IDJERI', 'Massine', '1995-03-26', 'Tanger', '7000.00', 'Infographiste'),
(4, 'KAIDI', 'Rim', '2000-09-01', 'Marrakech', '6500.00', 'Développeur'),
(5, 'HANTOUCHE', 'Imad', '1987-03-15', 'Tanger', '8500.00', 'Analyste'),
(6, 'BELAIDI', 'Souad', '1996-08-15', 'Casablanca', '9000.00', 'Analyste'),
(7, 'PARAAV', 'Kesh', '2000-01-05', 'Casablanca', '7800.00', 'Infographiste'),
(8, 'SIDALI', 'Nadra', '1998-06-07', 'Agadir', '8000.00', 'Analyste'),
(9, 'DJEMILI', 'Oussama', '1990-02-28', 'Marrakech', '6500.00', 'Infographiste');

-- --------------------------------------------------------

--
-- Structure de la table `projet`
--

CREATE TABLE `projet` (
  `CodeProjet` varchar(5) NOT NULL,
  `NomProjet` varchar(45) DEFAULT NULL,
  `DateDebut` date DEFAULT NULL,
  `DateFin` date DEFAULT NULL,
  `NumTheme` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `projet`
--

INSERT INTO `projet` (`CodeProjet`, `NomProjet`, `DateDebut`, `DateFin`, `NumTheme`) VALUES
('P-01', 'Analyse du comportement  de la clientèle', '2019-01-01', '2019-07-30', 1),
('P-02', 'Big data et la productivité des entreprises', '2019-02-15', '2019-10-10', 1),
('P-03', 'Les voitures connectées', '2019-09-01', '2020-02-14', 2),
('P-04', 'Détection des anomalies des plantes', '2019-09-25', '2020-01-31', 3),
('P-05', 'IOT au service public', '2018-02-14', '2019-01-20', 2),
('P-06', 'Analyse des émotions', '2018-10-20', '2019-04-04', 3),
('P-07', 'Reconnaissance de paroles multilingue', '2018-01-01', '2020-04-04', 3),
('P-08', 'Classification RH', '2020-01-01', '2020-03-30', 2);

-- --------------------------------------------------------

--
-- Structure de la table `theme`
--

CREATE TABLE `theme` (
  `NumTheme` int(11) NOT NULL,
  `NomTheme` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `theme`
--

INSERT INTO `theme` (`NumTheme`, `NomTheme`) VALUES
(1, 'Big data'),
(2, 'IOT'),
(3, 'IA'),
(5, 'E-Learning'),
(10, 'Data Sciences');

-- --------------------------------------------------------

--
-- Structure de la table `travaille`
--

CREATE TABLE `travaille` (
  `IDInf` int(11) NOT NULL,
  `CodeProjet` varchar(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `travaille`
--

INSERT INTO `travaille` (`IDInf`, `CodeProjet`) VALUES
(2, 'P-01'),
(6, 'P-01'),
(3, 'P-02'),
(8, 'P-02'),
(4, 'P-03'),
(5, 'P-03'),
(7, 'P-03'),
(9, 'P-04');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `informaticien`
--
ALTER TABLE `informaticien`
  ADD PRIMARY KEY (`IDInf`);

--
-- Index pour la table `projet`
--
ALTER TABLE `projet`
  ADD PRIMARY KEY (`CodeProjet`),
  ADD KEY `NumTheme` (`NumTheme`);

--
-- Index pour la table `theme`
--
ALTER TABLE `theme`
  ADD PRIMARY KEY (`NumTheme`);

--
-- Index pour la table `travaille`
--
ALTER TABLE `travaille`
  ADD PRIMARY KEY (`IDInf`),
  ADD KEY `CodeProjet` (`CodeProjet`);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `projet`
--
ALTER TABLE `projet`
  ADD CONSTRAINT `projet_ibfk_1` FOREIGN KEY (`NumTheme`) REFERENCES `theme` (`NumTheme`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `travaille`
--
ALTER TABLE `travaille`
  ADD CONSTRAINT `travaille_ibfk_1` FOREIGN KEY (`IDInf`) REFERENCES `informaticien` (`IDInf`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `travaille_ibfk_2` FOREIGN KEY (`CodeProjet`) REFERENCES `projet` (`CodeProjet`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
