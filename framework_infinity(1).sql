-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : dim. 20 avr. 2025 à 23:19
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
-- Base de données : `framework_infinity`
--

-- --------------------------------------------------------

--
-- Structure de la table `players`
--

CREATE TABLE `players` (
  `id` int(11) NOT NULL,
  `charid` int(11) NOT NULL DEFAULT 1,
  `steam_identifier` varchar(255) NOT NULL,
  `fivem_identifier` varchar(255) DEFAULT NULL,
  `lastname` varchar(255) DEFAULT NULL,
  `firstname` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `years` int(11) DEFAULT NULL,
  `sex` varchar(255) NOT NULL DEFAULT 'male',
  `rank` varchar(255) NOT NULL DEFAULT 'player',
  `hp` int(100) NOT NULL DEFAULT 100,
  `food` int(11) NOT NULL DEFAULT 100,
  `drink` int(11) NOT NULL DEFAULT 100,
  `bank` double(11,2) NOT NULL DEFAULT 0.00,
  `cash` double(11,2) NOT NULL DEFAULT 0.00,
  `golds` double(11,2) NOT NULL DEFAULT 0.00,
  `xp` int(11) NOT NULL DEFAULT 10,
  `job` varchar(255) DEFAULT 'vagabond',
  `jobgrade` int(11) DEFAULT 1,
  `gang` varchar(255) DEFAULT 'none',
  `gangrank` int(11) NOT NULL DEFAULT 1,
  `banned` int(11) NOT NULL DEFAULT 0,
  `reason` varchar(255) DEFAULT NULL,
  `whitelist` int(11) NOT NULL DEFAULT 0,
  `coords` varchar(255) NOT NULL DEFAULT '{"y":-7172.64,"x":1548.32,"h":360.00,"z":62.95}',
  `inventory` varchar(16000) NOT NULL DEFAULT '[{"amount":1,"meta":[],"name":"WEAPON_MELEE_TORCH"},{"amount":1,"meta":[],"name":"water"},{"amount":1,"meta":[],"name":"bread"}]',
  `last_online` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `players`
--

INSERT INTO `players` (`id`, `charid`, `steam_identifier`, `fivem_identifier`, `lastname`, `firstname`, `nationality`, `years`, `sex`, `rank`, `hp`, `food`, `drink`, `bank`, `cash`, `golds`, `xp`, `job`, `jobgrade`, `gang`, `gangrank`, `banned`, `reason`, `whitelist`, `coords`, `inventory`, `last_online`) VALUES
(11, 1, 'steam:1100001072556f2', 'fivem:10084126', 'dedede', 'iired', 'united-states-of-america', 23, 'male', 'superadmin', 100, 98, 98, 0.00, 97747.40, 0.00, 935, 'vagabond', 1, 'none', 1, 0, NULL, 0, '{\"z\":115.96285247802735,\"y\":788.9174194335938,\"x\":-340.7657775878906,\"h\":233.52285766601563}', '[{\"total\":1.0,\"amount\":1,\"name\":\"WEAPON_MELEE_TORCH\",\"meta\":[]},{\"total\":1.5,\"amount\":14,\"name\":\"water\",\"meta\":[]},{\"total\":0.7,\"amount\":6,\"name\":\"bread\",\"meta\":[]},{\"total\":18.0,\"amount\":3,\"name\":\"WEAPON_BOW\",\"meta\":[]},{\"total\":0.3,\"amount\":3,\"name\":\"coffee\",\"meta\":[]},{\"total\":3.0,\"amount\":3,\"name\":\"WEAPON_MELEE_KNIFE\",\"meta\":[]},{\"total\":0.15,\"amount\":3,\"name\":\"seringue\",\"meta\":[]},{\"total\":0.35,\"amount\":7,\"name\":\"chocolat\",\"meta\":[]},{\"total\":2.5,\"amount\":1,\"name\":\"hatchet\",\"meta\":[]},{\"total\":0.2,\"amount\":2,\"name\":\"rhum\",\"meta\":[]},{\"total\":0.24,\"amount\":3,\"name\":\"beer\",\"meta\":[]},{\"total\":0.01,\"name\":\"ammo_arrow\",\"amount\":1,\"meta\":[]},{\"total\":2.25,\"amount\":1,\"name\":\"WEAPON_MELEE_LANTERN_HALLOWEEN\",\"meta\":[]},{\"total\":2.0,\"name\":\"WEAPON_MELEE_MACHETE_HORROR\",\"amount\":2,\"meta\":[]},{\"total\":1.0,\"amount\":1,\"name\":\"WEAPON_THROWN_THROWING_KNIVES\",\"meta\":[]},{\"total\":2.0,\"name\":\"WEAPON_MELEE_KNIFE_JAWBONE\",\"amount\":2,\"meta\":[]},{\"total\":0.2,\"amount\":2,\"name\":\"eagle\",\"meta\":[]},{\"total\":1.0,\"name\":\"WEAPON_KIT_BINOCULARS_IMPROVED\",\"amount\":1,\"meta\":[]},{\"total\":0.3,\"amount\":2,\"name\":\"ragout\",\"meta\":[]},{\"meta\":[],\"name\":\"peach\",\"amount\":3,\"total\":0.3}]', '0000-00-00 00:00:00'),
(12, 1, 'steam:110000109bc9bde', 'fivem:10084126', 'bkbj', 'bhjb', 'united-states-of-america', 34, 'male', 'player', 100, 100, 100, 0.00, 500.00, 0.00, 10, 'vagabond', 1, 'none', 1, 0, NULL, 0, '{\"y\":-7172.64,\"x\":1548.32,\"h\":360.00,\"z\":62.95}', '[{\"amount\":1,\"meta\":[],\"name\":\"WEAPON_MELEE_TORCH\"},{\"amount\":1,\"meta\":[],\"name\":\"water\"},{\"amount\":1,\"meta\":[],\"name\":\"bread\"}]', NULL),
(13, 1, 'steam:110000135cccde9', 'fivem:981973', 'jjjj', 'dddd', 'united-states-of-america', 50, 'male', 'player', 100, 99, 99, 0.00, 495.00, 0.00, -15, 'vagabond', 1, 'none', 1, 0, NULL, 0, '{\"z\":118.66482543945313,\"y\":794.9921875,\"x\":-287.42413330078127,\"h\":103.12298583984375}', '[{\"amount\":1,\"meta\":[],\"name\":\"WEAPON_MELEE_TORCH\"},{\"amount\":1,\"meta\":[],\"name\":\"water\"},{\"amount\":1,\"meta\":[],\"name\":\"bread\"}]', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Structure de la table `skins_players`
--

CREATE TABLE `skins_players` (
  `id` int(11) NOT NULL,
  `charid` int(11) NOT NULL DEFAULT 1,
  `steam_identifier` varchar(255) NOT NULL,
  `skin` longtext DEFAULT NULL,
  `clothes` varchar(16000) DEFAULT '{}'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `skins_players`
--

INSERT INTO `skins_players` (`id`, `charid`, `steam_identifier`, `skin`, `clothes`) VALUES
(6, 1, 'steam:110000109bc9bde', '{\"upper_lip_height\":\"0\",\"ageing_t\":\"1\",\"lipsticks_t\":\"1\",\"blush_c2\":\"1\",\"scars_op\":\"1\",\"chin_depth\":\"0\",\"eyes_height\":\"0\",\"hair\":\"1\",\"lipsticks_c3\":\"1\",\"lower_lip_height\":\"0\",\"skincolor\":\"1\",\"bodysize\":\"3\",\"eyes_distance\":\"0\",\"nose_curvature\":\"0\",\"mouth_width\":\"0\",\"lower_lip_width\":\"0\",\"face\":\"1\",\"mouth_y_pos\":\"0\",\"sex\":\"1\",\"mouth_depth\":\"0\",\"eyebrows_op\":\"1\",\"value\":true,\"ears_height\":\"0\",\"blush_c3\":\"1\",\"eyebrow_depth\":\"0\",\"jaw_width\":\"0\",\"eyebrow_width\":\"0\",\"moles_op\":\"1\",\"nose_size\":\"0\",\"eyeliners_id\":\"1\",\"lipsticks_c2\":\"1\",\"upper_lip_depth\":\"0\",\"freckles_op\":\"1\",\"earlobe_size\":\"0\",\"NewCaracter\":1,\"shadows_id\":\"1\",\"eyebrows_c3\":\"1\",\"moles_t\":\"1\",\"eyebrows_id\":\"1\",\"blush_c1\":\"1\",\"lipsticks_op\":\"1\",\"shadows_op\":\"1\",\"eyelid_height\":\"0\",\"chin_width\":\"0\",\"eyes_angle\":\"0\",\"chin_height\":\"0\",\"jaw_height\":\"0\",\"shadows_c3\":\"1\",\"blush_op\":\"1\",\"eyeliners_t\":\"1\",\"nose_width\":\"0\",\"spots_t\":\"1\",\"eyebrows_c2\":\"1\",\"cheekbones_width\":\"0\",\"lipsticks_c1\":\"1\",\"spots_op\":\"1\",\"shadows_t\":\"1\",\"eyeliners_c2\":\"1\",\"beard\":\"1\",\"jaw_depth\":\"0\",\"face_width\":\"0\",\"scars_t\":\"1\",\"eyelid_width\":\"0\",\"cheekbones_height\":\"0\",\"nose_height\":\"0\",\"lower_lip_depth\":\"0\",\"mouth_x_pos\":\"0\",\"nose_angle\":\"0\",\"blush_t\":\"1\",\"upper_lip_width\":\"0\",\"height\":\"100\",\"freckles_t\":\"1\",\"ears_width\":\"0\",\"eyeliners_c1\":\"1\",\"eyebrow_height\":\"0\",\"eyeliners_op\":\"1\",\"ageing_op\":\"1\",\"eyebrows_t\":\"1\",\"shadows_c1\":\"1\",\"lipsticks_id\":\"1\",\"ears_angle\":\"0\",\"cheekbones_depth\":\"0\",\"blush_id\":\"1\",\"eyecolor\":\"1\",\"eyeliners_c3\":\"1\",\"eyebrows_c1\":\"1\",\"eyes_depth\":\"0\",\"nostrils_distance\":\"0\",\"shadows_c2\":\"1\"}', '{}'),
(7, 1, 'steam:110000109bc9bde', '{\"upper_lip_height\":\"0\",\"ageing_t\":\"1\",\"lipsticks_t\":\"1\",\"blush_c2\":\"1\",\"scars_op\":\"1\",\"chin_depth\":\"0\",\"eyes_height\":\"0\",\"hair\":\"1\",\"lipsticks_c3\":\"1\",\"lower_lip_height\":\"0\",\"skincolor\":\"1\",\"bodysize\":\"3\",\"eyes_distance\":\"0\",\"nose_curvature\":\"0\",\"mouth_width\":\"0\",\"lower_lip_width\":\"0\",\"face\":\"1\",\"mouth_y_pos\":\"0\",\"sex\":\"1\",\"mouth_depth\":\"0\",\"eyebrows_op\":\"1\",\"value\":true,\"ears_height\":\"0\",\"blush_c3\":\"1\",\"eyebrow_depth\":\"0\",\"jaw_width\":\"0\",\"eyebrow_width\":\"0\",\"moles_op\":\"1\",\"nose_size\":\"0\",\"eyeliners_id\":\"1\",\"lipsticks_c2\":\"1\",\"upper_lip_depth\":\"0\",\"freckles_op\":\"1\",\"earlobe_size\":\"0\",\"NewCaracter\":1,\"shadows_id\":\"1\",\"eyebrows_c3\":\"1\",\"moles_t\":\"1\",\"eyebrows_id\":\"1\",\"blush_c1\":\"1\",\"lipsticks_op\":\"1\",\"shadows_op\":\"1\",\"eyelid_height\":\"0\",\"chin_width\":\"0\",\"eyes_angle\":\"0\",\"chin_height\":\"0\",\"jaw_height\":\"0\",\"shadows_c3\":\"1\",\"blush_op\":\"1\",\"eyeliners_t\":\"1\",\"nose_width\":\"0\",\"spots_t\":\"1\",\"eyebrows_c2\":\"1\",\"cheekbones_width\":\"0\",\"lipsticks_c1\":\"1\",\"spots_op\":\"1\",\"shadows_t\":\"1\",\"eyeliners_c2\":\"1\",\"beard\":\"1\",\"jaw_depth\":\"0\",\"face_width\":\"0\",\"scars_t\":\"1\",\"eyelid_width\":\"0\",\"cheekbones_height\":\"0\",\"nose_height\":\"0\",\"lower_lip_depth\":\"0\",\"mouth_x_pos\":\"0\",\"nose_angle\":\"0\",\"blush_t\":\"1\",\"upper_lip_width\":\"0\",\"height\":\"100\",\"freckles_t\":\"1\",\"ears_width\":\"0\",\"eyeliners_c1\":\"1\",\"eyebrow_height\":\"0\",\"eyeliners_op\":\"1\",\"ageing_op\":\"1\",\"eyebrows_t\":\"1\",\"shadows_c1\":\"1\",\"lipsticks_id\":\"1\",\"ears_angle\":\"0\",\"cheekbones_depth\":\"0\",\"blush_id\":\"1\",\"eyecolor\":\"1\",\"eyeliners_c3\":\"1\",\"eyebrows_c1\":\"1\",\"eyes_depth\":\"0\",\"nostrils_distance\":\"0\",\"shadows_c2\":\"1\"}', '{}'),
(8, 1, 'steam:1100001072556f2', '{\"upper_lip_height\":\"0\",\"ageing_t\":\"1\",\"lipsticks_t\":\"1\",\"nose_height\":\"0\",\"scars_op\":\"1\",\"chin_depth\":\"0\",\"eyes_height\":\"0\",\"hair\":\"161\",\"lipsticks_c3\":\"1\",\"lower_lip_height\":\"0\",\"skincolor\":\"4\",\"bodysize\":\"3\",\"eyes_distance\":\"0\",\"nose_curvature\":\"0\",\"cheekbones_depth\":\"0\",\"lower_lip_width\":\"0\",\"face\":\"1\",\"mouth_y_pos\":\"0\",\"sex\":\"1\",\"mouth_depth\":\"0\",\"beard\":\"175\",\"value\":true,\"ears_height\":\"0\",\"blush_c3\":\"1\",\"mouth_x_pos\":\"0\",\"jaw_width\":\"0\",\"eyebrow_width\":\"0\",\"moles_op\":\"1\",\"nose_size\":\"0\",\"ears_width\":\"0\",\"lipsticks_c2\":\"1\",\"upper_lip_depth\":\"0\",\"freckles_op\":\"1\",\"earlobe_size\":\"0\",\"NewCaracter\":1,\"shadows_id\":\"1\",\"eyebrows_c3\":\"1\",\"lipsticks_op\":\"1\",\"eyebrow_height\":\"0\",\"blush_c1\":\"1\",\"cheekbones_width\":\"0\",\"shadows_op\":\"1\",\"chin_width\":\"0\",\"blush_c2\":\"1\",\"eyeliners_op\":\"1\",\"chin_height\":\"0\",\"jaw_height\":\"0\",\"shadows_c3\":\"1\",\"blush_op\":\"1\",\"eyebrows_c2\":\"1\",\"nose_angle\":\"0\",\"eyelid_width\":\"0\",\"lipsticks_id\":\"1\",\"eyebrows_t\":\"10\",\"lipsticks_c1\":\"1\",\"spots_op\":\"1\",\"nose_width\":\"0\",\"jaw_depth\":\"0\",\"mouth_width\":\"0\",\"moles_t\":\"1\",\"face_width\":\"0\",\"scars_t\":\"1\",\"nostrils_distance\":\"0\",\"cheekbones_height\":\"0\",\"height\":\"100\",\"lower_lip_depth\":\"0\",\"eyeliners_id\":\"1\",\"eyebrows_id\":\"1\",\"blush_t\":\"1\",\"upper_lip_width\":\"0\",\"spots_t\":\"1\",\"freckles_t\":\"1\",\"ears_angle\":\"0\",\"eyeliners_c1\":\"1\",\"eyes_depth\":\"0\",\"shadows_c2\":\"1\",\"ageing_op\":\"1\",\"shadows_t\":\"1\",\"shadows_c1\":\"1\",\"eyes_angle\":\"0\",\"eyebrow_depth\":\"0\",\"eyebrows_op\":\"51\",\"blush_id\":\"1\",\"eyecolor\":\"3\",\"eyeliners_c3\":\"1\",\"eyebrows_c1\":\"1\",\"eyeliners_c2\":\"1\",\"eyelid_height\":\"0\",\"eyeliners_t\":\"1\"}', '{}'),
(9, 1, 'steam:110000135cccde9', '{\"nose_angle\":\"0\",\"face\":\"112\",\"chin_depth\":\"0\",\"blush_c1\":\"1\",\"earlobe_size\":\"0\",\"eyeliners_c1\":\"1\",\"lipsticks_c3\":\"1\",\"lipsticks_c1\":\"1\",\"eyes_height\":\"0\",\"eyes_angle\":\"0\",\"jaw_width\":\"0\",\"eyeliners_id\":\"1\",\"upper_lip_width\":\"0\",\"eyebrow_width\":\"0\",\"value\":true,\"ageing_op\":\"38\",\"NewCaracter\":1,\"eyebrows_c1\":\"1\",\"lipsticks_op\":\"1\",\"shadows_op\":\"1\",\"mouth_depth\":\"0\",\"jaw_depth\":\"0\",\"cheekbones_width\":\"0\",\"spots_op\":\"1\",\"eyeliners_t\":\"1\",\"eyebrow_height\":\"57\",\"cheekbones_height\":\"0\",\"eyeliners_c3\":\"1\",\"eyes_depth\":\"0\",\"eyebrows_op\":\"1\",\"eyelid_height\":\"0\",\"shadows_id\":\"1\",\"blush_op\":\"1\",\"cheekbones_depth\":\"0\",\"skincolor\":\"1\",\"chin_height\":\"36\",\"scars_t\":\"1\",\"eyebrows_t\":\"1\",\"lower_lip_depth\":\"0\",\"mouth_y_pos\":\"0\",\"freckles_op\":\"41\",\"blush_t\":\"1\",\"lower_lip_height\":\"0\",\"eyebrows_c2\":\"1\",\"upper_lip_height\":\"0\",\"eyelid_width\":\"0\",\"eyeliners_op\":\"1\",\"lower_lip_width\":\"0\",\"nose_curvature\":\"0\",\"nose_size\":\"0\",\"height\":\"102\",\"chin_width\":\"0\",\"shadows_c1\":\"1\",\"mouth_width\":\"0\",\"face_width\":\"60\",\"shadows_c3\":\"1\",\"nose_height\":\"0\",\"eyebrows_c3\":\"1\",\"lipsticks_id\":\"1\",\"sex\":\"1\",\"upper_lip_depth\":\"0\",\"beard\":\"242\",\"hair\":\"274\",\"eyebrows_id\":\"1\",\"nose_width\":\"0\",\"ears_width\":\"61\",\"moles_t\":\"8\",\"moles_op\":\"49\",\"ageing_t\":\"1\",\"shadows_t\":\"1\",\"eyecolor\":\"1\",\"blush_c2\":\"1\",\"eyebrow_depth\":\"0\",\"nostrils_distance\":\"0\",\"mouth_x_pos\":\"0\",\"freckles_t\":\"9\",\"ears_height\":\"0\",\"shadows_c2\":\"1\",\"eyes_distance\":\"0\",\"lipsticks_c2\":\"1\",\"scars_op\":\"1\",\"spots_t\":\"1\",\"blush_id\":\"1\",\"blush_c3\":\"1\",\"lipsticks_t\":\"1\",\"ears_angle\":\"22\",\"bodysize\":\"6\",\"jaw_height\":\"0\",\"eyeliners_c2\":\"1\"}', '{}');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `skins_players`
--
ALTER TABLE `skins_players`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `players`
--
ALTER TABLE `players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `skins_players`
--
ALTER TABLE `skins_players`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
