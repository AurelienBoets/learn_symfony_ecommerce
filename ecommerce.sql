-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 05 mai 2022 à 16:58
-- Version du serveur : 10.4.20-MariaDB
-- Version de PHP : 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ecommerce`
--

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Manteaux'),
(2, 'Bonnets'),
(3, 'T-shirt'),
(4, 'Echarpe');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220503105758', '2022-05-03 14:31:20', 179),
('DoctrineMigrations\\Version20220503142643', '2022-05-03 16:27:05', 94),
('DoctrineMigrations\\Version20220505075534', '2022-05-05 09:55:52', 215),
('DoctrineMigrations\\Version20220505090542', '2022-05-05 11:05:48', 694);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`) VALUES
(1, 2, 'Bonnet rouge', 'bonnet-rouge', '047d5567505eac60befe474e6616766f4afbcc14.(extension)', 'Bonnet de couleur rouge', 'Bonnet de couleur rouge en coton', 1000),
(2, 2, 'Bonnet bleu', 'bonnet-bleu', 'b62825e14b3a77e23c08fd2ef79b827a226fa53f.(extension)', 'Bonnet bleu avec des rayures', 'Bonnet bleu avec des rayures rouges et blanches, avec une boule rouge', 1000),
(3, 4, 'Echarpe rouge', 'echarpe-rouge', '876fc675612827a5fcc024a1be8c7b314caa9288.(extension)', 'Echarpe rouge', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras semper mi mauris, vitae tincidunt eros mattis vehicula. Cras condimentum risus at metus cursus, id pharetra magna consectetur. Vivamus euismod odio eget est luctus finibus. Aliquam eu metus sed velit hendrerit fermentum. Praesent tristique tristique finibus. Suspendisse potenti. Fusce aliquam dapibus sem, nec tincidunt felis accumsan quis. Aliquam velit massa, interdum eget est at, imperdiet tempor nisl. Nam diam magna, ullamcorper sit amet nulla sed, egestas ultrices ante. Aenean finibus tellus sed purus hendrerit auctor. Morbi vehicula quam sapien, in dignissim est tempor vulputate. Fusce maximus ex velit, in gravida tortor scelerisque vel.', 5000),
(4, 4, 'Echarpe', 'echarpe', 'dbc3b0e0a49eeb20e2919a7b3bc6cbe89bc38fef.(extension)', 'Echarpe moche', 'Etiam orci lorem, laoreet a eros vel, porttitor elementum libero. Fusce iaculis mauris sed diam pellentesque rutrum. Integer in leo aliquam metus ultricies aliquet eu quis mi. Vivamus in blandit arcu. Aliquam tincidunt egestas nulla porta ultrices. Vestibulum vulputate rutrum ante vitae euismod. Nulla sit amet congue nisl, eu sodales diam. Aenean pretium luctus velit id hendrerit. Phasellus et dui diam. Quisque aliquam suscipit ante.', 500),
(5, 1, 'Manteau pour femme', 'manteau-pour-femme', '7b722b83cd74dae18ca9c9f961963273e30e3a5f.(extension)', 'Manteau pour femme', 'Vestibulum rutrum orci orci, at mattis lectus scelerisque eget. Donec sed ligula suscipit, auctor orci eget, elementum mi. Aenean id vehicula nisl. In hac habitasse platea dictumst. Morbi pellentesque iaculis libero vel finibus. Sed auctor lorem a ipsum malesuada consectetur. Donec ultrices, libero et ullamcorper mollis, neque lorem ultricies purus, ac consequat lorem orci ac ante. In lacinia libero in mi lobortis, eu sollicitudin augue consectetur. Donec feugiat vehicula fermentum. Morbi vitae ultrices quam, et ultrices orci. Donec rutrum sapien ut eleifend dignissim. Phasellus leo lacus, sodales sed lobortis id, luctus quis metus. Sed pellentesque, lacus in dapibus finibus, risus dolor porta enim, ac facilisis ligula nulla nec quam. In odio ligula, dictum vitae mauris in, consequat convallis ante. Morbi blandit, orci vel blandit eleifend, augue mi luctus dui, vel tempor sem enim nec elit. Donec nec nunc eget metus vulputate tincidunt.', 10000),
(6, 1, 'Manteau', 'manteau', '7253582c70a4b95b4ce616fdff999d9daec22935.(extension)', 'Manteau pas cher', 'Manteau pas cher avec des manches trop courtes.', 1500),
(7, 3, 'T-shirt blanc', 't-shirt-blanc', '8e91842ff0b7584e96cb31a771fd2a3c2d35f497.(extension)', 'T-shirt blanc', 'Nulla aliquam non enim ut pulvinar. Nulla facilisi. Nam condimentum, purus a sollicitudin luctus, elit arcu dignissim nisi, eu pulvinar metus sem convallis dui. Donec blandit sem justo, vitae finibus nisl mattis at. Morbi nec facilisis dui. Cras id tellus vel ex venenatis consectetur sed a dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus lobortis id nisl in suscipit. Aliquam aliquet sit amet ipsum eget dictum. Mauris id orci eget augue lacinia fermentum quis a arcu. Vestibulum tortor diam, consectetur in velit sit amet, placerat porttitor est. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum scelerisque, ipsum eget porttitor malesuada, urna orci lacinia metus, sed placerat arcu erat hendrerit quam.', 2000),
(8, 3, 'T-shirt noir à manche longues', 't-shirt-noir-a-manche-longues', '6551c47653dee8c50378973e81452b11e2179434.(extension)', 'T-shirt noir à manche longues', 'Phasellus molestie eleifend pulvinar. Donec bibendum erat tristique mauris rhoncus interdum. Nullam eu elit lobortis nisi blandit mollis. Nulla aliquet arcu a massa tincidunt egestas. Donec et pulvinar erat. Quisque et vulputate odio, ac fringilla leo. Praesent dignissim neque purus, sit amet lobortis nisi rhoncus non. Sed et placerat augue. Quisque congue sem non fringilla congue. Quisque tempus, ex eget interdum venenatis, eros elit tincidunt nisi, id dictum ipsum erat vel dolor. Suspendisse potenti. Vivamus et nunc non augue molestie scelerisque. Vivamus ultrices bibendum augue, eu dictum erat pulvinar non. Pellentesque at odio arcu.', 2500);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `first_name`, `last_name`) VALUES
(2, 'delarue@mail.fr', '[]', '$2y$13$lav7BwLNQRRpkr4AAGZBXeDNz1qMevvknIOzOHDtNLUruhXFVHeyu', 'Jean', 'Delarue');

--
-- Index pour les tables déchargées
--

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
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
