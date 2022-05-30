-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 30 mai 2022 à 16:58
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
-- Structure de la table `address`
--

CREATE TABLE `address` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `address`
--

INSERT INTO `address` (`id`, `user_id`, `name`, `firstname`, `lastname`, `company`, `address`, `postal`, `city`, `country`, `phone`) VALUES
(1, 2, 'Maison 1', 'Jean', 'Delarue', NULL, '20 rue du chandelier', '78999', 'City', 'FR', '06060660606'),
(5, 2, 'Société', 'Jean', 'Delarue', 'Sandwich', '56 rue de la nourriture', '78665', 'Haute', 'FR', '033333333333333'),
(7, 11, 'ezrrz', 'zerzer', 'zerzrz', NULL, 'zerzr', '99898', 'zerzer', 'AZ', '58958549845856'),
(8, 12, 'Maison', 'John', 'Doe', NULL, '17 rue Massenet', '59999', 'Lomme', 'FR', '060606060606'),
(9, 13, 'ffef', 'faefeaf', 'fqfdsf', NULL, '84 qsf', '68959', 'qsddsqd', 'FR', '046406460'),
(10, 14, 'zaeaeza', 'azeae', 'azeaze', NULL, 'azezaeza', '59874', 'azeaze', 'AF', '050654165046'),
(11, 15, 'zaezae', 'azeaez', 'azeae', NULL, 'azezaeaze', '55983', 'azezae', 'AF', '54655321');

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

CREATE TABLE `carrier` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Colissimo', 'Profitez d\'une livraison premium avec un colis chez vous dans 72 prochaines heures', 9.9),
(2, 'Chronopost', 'Profitez de la livraison express pour être livré dès le lendemain de votre commande entre 8h et 20h.', 14.9);

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
('DoctrineMigrations\\Version20220505090542', '2022-05-05 11:05:48', 694),
('DoctrineMigrations\\Version20220523083032', '2022-05-23 10:31:25', 109),
('DoctrineMigrations\\Version20220523132027', '2022-05-23 15:21:03', 54),
('DoctrineMigrations\\Version20220523142551', '2022-05-23 16:26:13', 156),
('DoctrineMigrations\\Version20220524081928', '2022-05-24 10:19:46', 169),
('DoctrineMigrations\\Version20220525131203', '2022-05-25 15:12:26', 45),
('DoctrineMigrations\\Version20220525140317', '2022-05-25 16:03:25', 43),
('DoctrineMigrations\\Version20220530100419', '2022-05-30 12:04:44', 42),
('DoctrineMigrations\\Version20220530100529', '2022-05-30 12:05:35', 44),
('DoctrineMigrations\\Version20220530104720', '2022-05-30 12:47:25', 42),
('DoctrineMigrations\\Version20220530122943', '2022-05-30 14:29:47', 56),
('DoctrineMigrations\\Version20220530131606', '2022-05-30 15:16:11', 109);

-- --------------------------------------------------------

--
-- Structure de la table `header`
--

CREATE TABLE `header` (
  `id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `btn_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `header`
--

INSERT INTO `header` (`id`, `title`, `content`, `btn_title`, `btn_url`, `illustration`) VALUES
(1, 'Nouvelle collection', 'Découvrez notre nouvelle collection hiver.', 'Découvrir', '/produits', '8d5bb25933afdaee97661a548261cfff3ae5b2dc.(extension)'),
(2, 'Promo', 'Découvrez nos promotions', 'Découvrez', '/produits', '6af4630e1ce5ad6796fb68f35f7e83e1a8088152.(extension)');

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

CREATE TABLE `order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL,
  `carrier_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_session_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `reference`, `stripe_session_id`, `state`) VALUES
(16, 15, '2022-05-30 11:54:21', 'Colissimo', 9.9, 'azeaezazeae<br>54655321<br>azezaeaze<br>55983azezae<br>AF', '30052022-6294944d6b083', 'cs_test_b1k7JNPs7ycMnCBK0NlNP0G3WsxAUbmT4smpb1wBIIOn2sjQagexeruebn', 3);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `id` int(11) NOT NULL,
  `my_order_id` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(19, 16, 'Echarpe rouge', 1, 5000, 5000);

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
  `price` double NOT NULL,
  `is_best` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`, `is_best`) VALUES
(1, 2, 'Bonnet rouge', 'bonnet-rouge', '047d5567505eac60befe474e6616766f4afbcc14.(extension)', 'Bonnet de couleur rouge', 'Bonnet de couleur rouge en coton', 1000, 1),
(2, 2, 'Bonnet bleu', 'bonnet-bleu', 'b62825e14b3a77e23c08fd2ef79b827a226fa53f.(extension)', 'Bonnet bleu avec des rayures', 'Bonnet bleu avec des rayures rouges et blanches, avec une boule rouge', 1000, 0),
(3, 4, 'Echarpe rouge', 'echarpe-rouge', '876fc675612827a5fcc024a1be8c7b314caa9288.(extension)', 'Echarpe rouge', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Cras semper mi mauris, vitae tincidunt eros mattis vehicula. Cras condimentum risus at metus cursus, id pharetra magna consectetur. Vivamus euismod odio eget est luctus finibus. Aliquam eu metus sed velit hendrerit fermentum. Praesent tristique tristique finibus. Suspendisse potenti. Fusce aliquam dapibus sem, nec tincidunt felis accumsan quis. Aliquam velit massa, interdum eget est at, imperdiet tempor nisl. Nam diam magna, ullamcorper sit amet nulla sed, egestas ultrices ante. Aenean finibus tellus sed purus hendrerit auctor. Morbi vehicula quam sapien, in dignissim est tempor vulputate. Fusce maximus ex velit, in gravida tortor scelerisque vel.', 5000, 1),
(4, 4, 'Echarpe', 'echarpe', 'dbc3b0e0a49eeb20e2919a7b3bc6cbe89bc38fef.(extension)', 'Echarpe moche', 'Etiam orci lorem, laoreet a eros vel, porttitor elementum libero. Fusce iaculis mauris sed diam pellentesque rutrum. Integer in leo aliquam metus ultricies aliquet eu quis mi. Vivamus in blandit arcu. Aliquam tincidunt egestas nulla porta ultrices. Vestibulum vulputate rutrum ante vitae euismod. Nulla sit amet congue nisl, eu sodales diam. Aenean pretium luctus velit id hendrerit. Phasellus et dui diam. Quisque aliquam suscipit ante.', 500, 0),
(5, 1, 'Manteau pour femme', 'manteau-pour-femme', '7b722b83cd74dae18ca9c9f961963273e30e3a5f.(extension)', 'Manteau pour femme', 'Vestibulum rutrum orci orci, at mattis lectus scelerisque eget. Donec sed ligula suscipit, auctor orci eget, elementum mi. Aenean id vehicula nisl. In hac habitasse platea dictumst. Morbi pellentesque iaculis libero vel finibus. Sed auctor lorem a ipsum malesuada consectetur. Donec ultrices, libero et ullamcorper mollis, neque lorem ultricies purus, ac consequat lorem orci ac ante. In lacinia libero in mi lobortis, eu sollicitudin augue consectetur. Donec feugiat vehicula fermentum. Morbi vitae ultrices quam, et ultrices orci. Donec rutrum sapien ut eleifend dignissim. Phasellus leo lacus, sodales sed lobortis id, luctus quis metus. Sed pellentesque, lacus in dapibus finibus, risus dolor porta enim, ac facilisis ligula nulla nec quam. In odio ligula, dictum vitae mauris in, consequat convallis ante. Morbi blandit, orci vel blandit eleifend, augue mi luctus dui, vel tempor sem enim nec elit. Donec nec nunc eget metus vulputate tincidunt.', 10000, 0),
(6, 1, 'Manteau', 'manteau', '7253582c70a4b95b4ce616fdff999d9daec22935.(extension)', 'Manteau pas cher', 'Manteau pas cher avec des manches trop courtes.', 1500, 0),
(7, 3, 'T-shirt blanc', 't-shirt-blanc', '8e91842ff0b7584e96cb31a771fd2a3c2d35f497.(extension)', 'T-shirt blanc', 'Nulla aliquam non enim ut pulvinar. Nulla facilisi. Nam condimentum, purus a sollicitudin luctus, elit arcu dignissim nisi, eu pulvinar metus sem convallis dui. Donec blandit sem justo, vitae finibus nisl mattis at. Morbi nec facilisis dui. Cras id tellus vel ex venenatis consectetur sed a dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Phasellus lobortis id nisl in suscipit. Aliquam aliquet sit amet ipsum eget dictum. Mauris id orci eget augue lacinia fermentum quis a arcu. Vestibulum tortor diam, consectetur in velit sit amet, placerat porttitor est. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum scelerisque, ipsum eget porttitor malesuada, urna orci lacinia metus, sed placerat arcu erat hendrerit quam.', 2000, 1),
(8, 3, 'T-shirt noir à manche longues', 't-shirt-noir-a-manche-longues', '6551c47653dee8c50378973e81452b11e2179434.(extension)', 'T-shirt noir à manche longues', 'Phasellus molestie eleifend pulvinar. Donec bibendum erat tristique mauris rhoncus interdum. Nullam eu elit lobortis nisi blandit mollis. Nulla aliquet arcu a massa tincidunt egestas. Donec et pulvinar erat. Quisque et vulputate odio, ac fringilla leo. Praesent dignissim neque purus, sit amet lobortis nisi rhoncus non. Sed et placerat augue. Quisque congue sem non fringilla congue. Quisque tempus, ex eget interdum venenatis, eros elit tincidunt nisi, id dictum ipsum erat vel dolor. Suspendisse potenti. Vivamus et nunc non augue molestie scelerisque. Vivamus ultrices bibendum augue, eu dictum erat pulvinar non. Pellentesque at odio arcu.', 2500, 1);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password`
--

CREATE TABLE `reset_password` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `create_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password`
--

INSERT INTO `reset_password` (`id`, `user_id`, `token`, `create_at`) VALUES
(1, 13, '6294d0c8c380b', '2022-05-30 16:12:24'),
(2, 13, '6294d10a1c040', '2022-05-30 16:13:30'),
(3, 13, '6294d110847b2', '2022-05-30 16:13:36'),
(4, 12, '6294d145ea1e5', '2022-05-30 16:14:29'),
(5, 15, '6294d177a0ac6', '2022-05-30 16:15:19'),
(6, 15, '6294d1b32db65', '2022-05-30 16:16:19'),
(7, 15, '6294d1dd6910c', '2022-05-30 16:17:01'),
(8, 15, '6294d26f13502', '2022-05-30 16:19:27'),
(9, 15, '6294d2b3b49d2', '2022-05-30 16:20:35'),
(10, 15, '6294d32a4270b', '2022-05-30 16:22:34'),
(11, 15, '6294d6dc8964d', '2022-05-30 16:38:20'),
(12, 15, '6294db2a5dd7e', '2022-05-30 16:56:42');

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
(2, 'delarue@mail.fr', '[]', '$2y$13$lav7BwLNQRRpkr4AAGZBXeDNz1qMevvknIOzOHDtNLUruhXFVHeyu', 'Jean', 'Delarue'),
(11, 'azer@mail.fr', '[]', '$2y$13$HHvE2B/je1TXBio/j6SeQuXUXz317EVUcFnolWv2t1qJbk88owcKS', 'john', 'doe'),
(12, 'test.boutique@outlook.com', '[]', '$2y$13$R.LSrB5eSUq0CN.UxCGe8O23/lpJRfY3sxPh3d7hY4lEC3dGGw1Hy', 'John', 'Doe'),
(13, 'aurelien.boets59@gmail.com', '[]', '$2y$13$CBmDr47qnrmpxQaH014eNeI2G2DLrCenvZZ3/bdr5Tm8tUhIOBJOm', 'azer', 'azer'),
(14, 'boutique.test@outlook.com', '[]', '$2y$13$/ObhtPtr9eBObZoRgh0B0.TmugICkYUthuVg82uqNyra9jdK5I5Fe', 'azer', 'azer'),
(15, 'clientrandom@outlook.com', '[]', '$2y$13$SBn46BpK9B0H.mSj8OdmIeayI048E7Xy0JR7Vl7/DCZJy85mLkYOy', 'client', 'random');

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
-- Index pour la table `header`
--
ALTER TABLE `header`
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
  ADD KEY `IDX_845CA2C1BFCDF877` (`my_order_id`);

--
-- Index pour la table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_D34A04AD12469DE2` (`category_id`);

--
-- Index pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_B9983CE5A76ED395` (`user_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `carrier`
--
ALTER TABLE `carrier`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `header`
--
ALTER TABLE `header`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `order`
--
ALTER TABLE `order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT pour la table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT pour la table `reset_password`
--
ALTER TABLE `reset_password`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);

--
-- Contraintes pour la table `reset_password`
--
ALTER TABLE `reset_password`
  ADD CONSTRAINT `FK_B9983CE5A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
