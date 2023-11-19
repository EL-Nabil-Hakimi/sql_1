-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3307
-- Généré le : dim. 19 nov. 2023 à 12:45
-- Version du serveur : 10.4.28-MariaDB
-- Version de PHP : 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `db_brf`
--

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

--us.1
INSERT INTO utilisateur ( userName, userMail)
VALUES ('Oussama', 'OUssama@gmail.com');
--us.2
INSERT INTO squad ( projectID, userID)
VALUES (1, 5);

--us.3
INSERT INTO project ( projectName, description, DateStart, DateEnd)
VALUES ('Le Nom de Project', 'description du projet', '2023-01-01', '2023-12-31');

--us.4
SELECT project.*
FROM project
JOIN Squad ON project.ProjectID = Squad.ProjectID
WHERE Squad.SquadID = 2; 

--us.5

INSERT INTO ressource (categorieID, subcategoryID, squadID, projectID)
VALUES (1, 1, 1, 1);


--us.6

UPDATE Utilisateur
SET userID = 'Jamal', userMail = 'jamal@gmaiol.com'
WHERE UserID = 2;


--us.7

INSERT INTO categorie (categorieName , subcategoryID) VALUES ('nome de categorie' , 10);
INSERT INTO subcategory (subcategoryName) VALUES('sub ctgr test');



CREATE TABLE `categorie` (
  `categorieID` int(11) NOT NULL,
  `categorieName` varchar(50) NOT NULL,
  `subcategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categorie`
--

INSERT INTO `categorie` (`categorieID`, `categorieName`, `subcategoryID`) VALUES
(1, 'Books', 1),
(2, 'nome de categorie', 10),
(3, 'nome de categorie', 10);

-- --------------------------------------------------------

--
-- Structure de la table `project`
--

CREATE TABLE `project` (
  `projectID` int(11) NOT NULL,
  `projectName` varchar(50) NOT NULL,
  `description` text NOT NULL,
  `DateStart` date NOT NULL,
  `DateEnd` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `project`
--

INSERT INTO `project` (`projectID`, `projectName`, `description`, `DateStart`, `DateEnd`) VALUES
(1, 'Ecole', 'This simplifies the syntax, and the database system will automatically generate a name for the foreign key constraint. Keep in mind that different database systems may handle the naming conventions differently, so it\'s always a good practice to check the documentation of your specific database management system for any variations in behavior.', '2023-11-02', '2023-11-30'),
(2, 'le nom de project', 'Description du project', '2023-01-01', '2023-12-31'),
(3, 'Le Nom de Project', 'description du projet', '2023-01-01', '2023-12-31');

-- --------------------------------------------------------

--
-- Structure de la table `ressource`
--

CREATE TABLE `ressource` (
  `ressourceID` int(11) NOT NULL,
  `categorieID` int(11) DEFAULT NULL,
  `SubcategoryID` int(11) DEFAULT NULL,
  `SquadID` int(11) DEFAULT NULL,
  `ProjectID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `ressource`
--

INSERT INTO `ressource` (`ressourceID`, `categorieID`, `SubcategoryID`, `SquadID`, `ProjectID`) VALUES
(1, 1, 1, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `squad`
--

CREATE TABLE `squad` (
  `squadID` int(11) NOT NULL,
  `userID` int(11) DEFAULT NULL,
  `projectID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `squad`
--

INSERT INTO `squad` (`squadID`, `userID`, `projectID`) VALUES
(1, 4, NULL),
(2, 3, 1),
(4, 5, 1);

-- --------------------------------------------------------

--
-- Structure de la table `subcategory`
--

CREATE TABLE `subcategory` (
  `subcategoryID` int(11) NOT NULL,
  `subcategoryName` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `subcategory`
--

INSERT INTO `subcategory` (`subcategoryID`, `subcategoryName`) VALUES
(1, NULL),
(2, NULL),
(9, 'sub1'),
(10, 'sub2'),
(11, 'nom de sub ctgr'),
(12, 'sub ctgr test');

-- --------------------------------------------------------

--
-- Structure de la table `utilisateur`
--

CREATE TABLE `utilisateur` (
  `userID` int(11) NOT NULL,
  `userName` varchar(50) NOT NULL,
  `userMail` varchar(50) NOT NULL,
  `squadID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `utilisateur`
--

INSERT INTO `utilisateur` (`userID`, `userName`, `userMail`, `squadID`) VALUES
(3, 'Nabil El Hakimi', 'NABIL@gmail.com', 2),
(4, ' Adam Hakimi', 'Adam@gmail.com', 2),
(5, 'Oussama', 'OUssama@xxxxx.com', 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD PRIMARY KEY (`categorieID`),
  ADD KEY `subcategoryID` (`subcategoryID`);

--
-- Index pour la table `project`
--
ALTER TABLE `project`
  ADD PRIMARY KEY (`projectID`);

--
-- Index pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD PRIMARY KEY (`ressourceID`),
  ADD KEY `categorieID` (`categorieID`),
  ADD KEY `fk_SubcategoryID` (`SubcategoryID`),
  ADD KEY `f_SquadID` (`SquadID`),
  ADD KEY `f_ProjectID` (`ProjectID`);

--
-- Index pour la table `squad`
--
ALTER TABLE `squad`
  ADD PRIMARY KEY (`squadID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `projectID` (`projectID`);

--
-- Index pour la table `subcategory`
--
ALTER TABLE `subcategory`
  ADD UNIQUE KEY `sub2` (`subcategoryID`);

--
-- Index pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `squadID` (`squadID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `categorie`
--
ALTER TABLE `categorie`
  MODIFY `categorieID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `project`
--
ALTER TABLE `project`
  MODIFY `projectID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `ressource`
--
ALTER TABLE `ressource`
  MODIFY `ressourceID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `squad`
--
ALTER TABLE `squad`
  MODIFY `squadID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `subcategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `categorie`
--
ALTER TABLE `categorie`
  ADD CONSTRAINT `subcategoryID` FOREIGN KEY (`subcategoryID`) REFERENCES `subcategory` (`subcategoryID`);

--
-- Contraintes pour la table `ressource`
--
ALTER TABLE `ressource`
  ADD CONSTRAINT `categorieID` FOREIGN KEY (`categorieID`) REFERENCES `categorie` (`categorieID`),
  ADD CONSTRAINT `f_ProjectID` FOREIGN KEY (`ProjectID`) REFERENCES `project` (`projectID`),
  ADD CONSTRAINT `f_SquadID` FOREIGN KEY (`SquadID`) REFERENCES `squad` (`squadID`),
  ADD CONSTRAINT `fk_SubcategoryID` FOREIGN KEY (`SubcategoryID`) REFERENCES `subcategory` (`subcategoryID`);

--
-- Contraintes pour la table `squad`
--
ALTER TABLE `squad`
  ADD CONSTRAINT `projectID` FOREIGN KEY (`projectID`) REFERENCES `project` (`projectID`),
  ADD CONSTRAINT `userID` FOREIGN KEY (`userID`) REFERENCES `utilisateur` (`userID`);

--
-- Contraintes pour la table `utilisateur`
--
ALTER TABLE `utilisateur`
  ADD CONSTRAINT `squadID` FOREIGN KEY (`squadID`) REFERENCES `squad` (`squadID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;






