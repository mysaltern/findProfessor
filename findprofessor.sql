/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100419
 Source Host           : localhost:3306
 Source Schema         : findprofessor

 Target Server Type    : MySQL
 Target Server Version : 100419
 File Encoding         : 65001

 Date: 16/09/2021 12:40:06
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for city
-- ----------------------------
DROP TABLE IF EXISTS `city`;
CREATE TABLE `city`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `province_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `province_id`(`province_id`) USING BTREE,
  CONSTRAINT `city_ibfk_1` FOREIGN KEY (`province_id`) REFERENCES `provinces` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of city
-- ----------------------------
INSERT INTO `city` VALUES (1, 'Athabasca', 1);
INSERT INTO `city` VALUES (2, 'Edmonton', 1);
INSERT INTO `city` VALUES (3, 'Calgary\r\nSpringbank', 1);
INSERT INTO `city` VALUES (4, 'Calgary', 1);
INSERT INTO `city` VALUES (5, 'Lethbridge', 1);

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES (1, 'Biology');

-- ----------------------------
-- Table structure for field_study
-- ----------------------------
DROP TABLE IF EXISTS `field_study`;
CREATE TABLE `field_study`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of field_study
-- ----------------------------

-- ----------------------------
-- Table structure for migration
-- ----------------------------
DROP TABLE IF EXISTS `migration`;
CREATE TABLE `migration`  (
  `version` varchar(180) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `apply_time` int NULL DEFAULT NULL,
  PRIMARY KEY (`version`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of migration
-- ----------------------------
INSERT INTO `migration` VALUES ('m000000_000000_base', 1631467037);
INSERT INTO `migration` VALUES ('m140209_132017_init', 1631467138);
INSERT INTO `migration` VALUES ('m140403_174025_create_account_table', 1631467138);
INSERT INTO `migration` VALUES ('m140504_113157_update_tables', 1631467138);
INSERT INTO `migration` VALUES ('m140504_130429_create_token_table', 1631467138);
INSERT INTO `migration` VALUES ('m140830_171933_fix_ip_field', 1631467138);
INSERT INTO `migration` VALUES ('m140830_172703_change_account_table_name', 1631467138);
INSERT INTO `migration` VALUES ('m141222_110026_update_ip_field', 1631467139);
INSERT INTO `migration` VALUES ('m141222_135246_alter_username_length', 1631467139);
INSERT INTO `migration` VALUES ('m150614_103145_update_social_account_table', 1631467139);
INSERT INTO `migration` VALUES ('m150623_212711_fix_username_notnull', 1631467139);
INSERT INTO `migration` VALUES ('m151218_234654_add_timezone_to_profile', 1631467139);
INSERT INTO `migration` VALUES ('m160929_103127_add_last_login_at_to_user_table', 1631467139);

-- ----------------------------
-- Table structure for professors
-- ----------------------------
DROP TABLE IF EXISTS `professors`;
CREATE TABLE `professors`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sex` smallint NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `description` varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `university_id` int NULL DEFAULT NULL,
  `department_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `university_id`(`university_id`) USING BTREE,
  INDEX `department_id`(`department_id`) USING BTREE,
  CONSTRAINT `professors_ibfk_1` FOREIGN KEY (`university_id`) REFERENCES `university` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `professors_ibfk_2` FOREIGN KEY (`department_id`) REFERENCES `department` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of professors
-- ----------------------------
INSERT INTO `professors` VALUES (2, 1, 'Hai-Ying (Mary) ', 'Cheng', 'haiying.cheng@utoronto.ca', '2007\r\nRevealing a role of microRNAs in the regulation of the biological clock\r\n\r\nCheng HY, Obrietan K\r\n2007, Cell cycle (Georgetown, Tex.), 6, 3034-5, 18075311\r\nmicroRNA modulation of circadian-clock period and entrainment\r\n\r\nCheng HY, Papp JW, Varlamova O, Dziema H, Russell B, Curfman JP, Nakazawa T, Shimizu K, Okamura H, Impey S, Obrietan K\r\n2007, Neuron, 54, 813-29, 17553428\r\nCannabinoids excite hypothalamic melanin-concentrating hormone but inhibit hypocretin/orexin neurons: implications for cannabinoid actions on food intake and cognitive arousal\r\n\r\nHuang H, Acuna-Goycolea C, Li Y, Cheng HM, Obrietan K, van den Pol AN\r\n2007, The Journal of neuroscience : the official journal of the Society for Neuroscience, 27, 4870-81, 17475795\r\n\r\nBack to top\r\n2006\r\nThe molecular gatekeeper Dexras1 sculpts the photic responsiveness of the mammalian circadian clock\r\n\r\nCheng HY, Dziema H, Papp J, Mathur DP, Koletar M, Ralph MR, Penninger JM, Obrietan K\r\n2006, The Journal of neuroscience : the official journal of the Society for Neuroscience, 26, 12984-95, 17167088\r\nDexras1: shaping the responsiveness of the circadian clock\r\n\r\nCheng HY, Obrietan K\r\n2006, Seminars in cell & developmental biology, 17, 345-51, 16765612\r\n\r\nBack to top\r\n2005\r\nLight stimulates MSK1 activation in the suprachiasmatic nucleus via a PACAP-ERK/MAP kinase-dependent mechanism\r\n\r\nButcher GQ, Lee B, Cheng HY, Obrietan K\r\n2005, The Journal of neuroscience : the official journal of the Society for Neuroscience, 25, 5305-13, 15930378\r\n\r\nBack to top\r\n2004\r\nDexras1 potentiates photic and suppresses nonphotic responses of the circadian clock\r\n\r\nCheng HY, Obrietan K, Cain SW, Lee BY, Agostino PV, Joza NA, Harrington ME, Ralph MR, Penninger JM\r\n2004, Neuron, 43, 715-28, 15339652\r\nDREAM ablation selectively alters THC place aversion and analgesia but leaves intact the motivational and analgesic effects of morphine\r\n\r\nCheng HY, Laviolette SR, van der Kooy D, Penninger JM\r\n2004, The European journal of neuroscience, 19, 3033-41, 15182311\r\nMKK7 couples stress signalling to G2/M cell-cycle progression and cellular senescence\r\n\r\nWada T, Joza N, Cheng HY, Sasaki T, Kozieradzki I, Bachmaier K, Katada T, Schreiber M, Wagner EF, Nishina H, Penninger JM\r\n2004, Nature cell biology, 6, 215-26, 15039780\r\n\r\nBack to top\r\n2002\r\nRegulation of myocardial contractility and cell size by distinct PI3K-PTEN signaling pathways\r\n\r\nCrackower MA, Oudit GY, Kozieradzki I, Sarao R, Sun H, Sasaki T, Hirsch E, Suzuki A, Shioi T, Irie-Sasaki J, Sah R, Cheng HY, Rybin VO, Lembo G, Fratta L, Oliveira-dos-Santos AJ, Benovic JL, Kahn CR, Izumo S, Steinberg SF, Wymann MP, Backx PH, Penninger JM\r\n2002, Cell, 110, 737-49, 12297047\r\nDREAM is a critical transcriptional repressor for pain modulation\r\n\r\nCheng HY, Pitcher GM, Laviolette SR, Whishaw IQ, Tong KI, Kockeritz LK, Wada T, Joza NA, Crackower M, Goncalves J, Sarosi I, Woodgett JR, Oliveira-dos-Santos AJ, Ikura M, van der Kooy D, Salter MW, Penninger JM\r\n2002, Cell, 108, 31-43, 11792319\r\n\r\nBack to top\r\n2001\r\nCalcium-regulated DNA binding and oligomerization of the neuronal calcium-sensing protein, calsenilin/DREAM/KChIP3\r\n\r\nOsawa M, Tong KI, Lilliehook C, Wasco W, Buxbaum JD, Cheng HY, Penninger JM, Ikura M, Ames JB\r\n2001, The Journal of biological chemistry, 276, 41005-13, 11535596\r\nEssential role of the mitochondrial apoptosis-inducing factor in programmed cell death\r\n\r\nJoza N, Susin SA, Daugas E, Stanford WL, Cho SK, Li CY, Sasaki T, Elia AJ, Cheng HY, Ravagnan L, Ferri KF, Zamzami N, Wakeham A, Hakem R, Yoshida H, Kong YY, Mak TW, Zúñiga-Pflücker JC, Kroemer G, Penninger JM\r\n2001, Nature, 410, 549-54, 11279485\r\nCD45 is a JAK phosphatase and negatively regulates cytokine receptor signalling\r\n\r\nIrie-Sasaki J, Sasaki T, Matsumoto W, Opavsky A, Cheng M, Welstead G, Griffiths E, Krawczyk C, Richardson CD, Aitken K, Iscove N, Koretzky G, Johnson P, Liu P, Rothstein DM, Penninger JM\r\n2001, Nature, 409, 349-54, 11201744', 'https://www.utm.utoronto.ca/biology/people/hai-ying-mary-cheng', 58, 1);

-- ----------------------------
-- Table structure for profile
-- ----------------------------
DROP TABLE IF EXISTS `profile`;
CREATE TABLE `profile`  (
  `user_id` int NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `public_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gravatar_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `gravatar_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `location` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `website` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bio` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `timezone` varchar(40) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`) USING BTREE,
  CONSTRAINT `fk_user_profile` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of profile
-- ----------------------------
INSERT INTO `profile` VALUES (1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for provinces
-- ----------------------------
DROP TABLE IF EXISTS `provinces`;
CREATE TABLE `provinces`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `abbrev` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of provinces
-- ----------------------------
INSERT INTO `provinces` VALUES (1, 'Alberta', 'AB');
INSERT INTO `provinces` VALUES (2, 'British Columbia', 'BC');
INSERT INTO `provinces` VALUES (3, 'Manitoba', 'MB');
INSERT INTO `provinces` VALUES (4, 'New Brunswick', 'NB');
INSERT INTO `provinces` VALUES (5, 'Newfoundland and Labrador', 'NL');
INSERT INTO `provinces` VALUES (6, 'Northwest Territories', 'NT');
INSERT INTO `provinces` VALUES (7, 'Nova Scotia', 'NS');
INSERT INTO `provinces` VALUES (8, 'Nunavut', 'NU');
INSERT INTO `provinces` VALUES (9, 'Ontario', 'ON');
INSERT INTO `provinces` VALUES (10, 'Prince Edward Island', 'PE');
INSERT INTO `provinces` VALUES (11, 'Quebec', 'QC');
INSERT INTO `provinces` VALUES (12, 'Saskatchewan', 'SK');
INSERT INTO `provinces` VALUES (13, 'Yukon', 'YT');

-- ----------------------------
-- Table structure for report
-- ----------------------------
DROP TABLE IF EXISTS `report`;
CREATE TABLE `report`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `date` int NOT NULL,
  `professors_id` int NOT NULL,
  `status` smallint NOT NULL,
  `user_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  CONSTRAINT `report_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of report
-- ----------------------------

-- ----------------------------
-- Table structure for social_account
-- ----------------------------
DROP TABLE IF EXISTS `social_account`;
CREATE TABLE `social_account`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `provider` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `client_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `data` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` int NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `account_unique`(`provider`, `client_id`) USING BTREE,
  UNIQUE INDEX `account_unique_code`(`code`) USING BTREE,
  INDEX `fk_user_account`(`user_id`) USING BTREE,
  CONSTRAINT `fk_user_account` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of social_account
-- ----------------------------

-- ----------------------------
-- Table structure for token
-- ----------------------------
DROP TABLE IF EXISTS `token`;
CREATE TABLE `token`  (
  `user_id` int NOT NULL,
  `code` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `created_at` int NOT NULL,
  `type` smallint NOT NULL,
  UNIQUE INDEX `token_unique`(`user_id`, `code`, `type`) USING BTREE,
  CONSTRAINT `fk_user_token` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of token
-- ----------------------------
INSERT INTO `token` VALUES (1, 'IrvP-0nb2HDm_OPCXu4ig7eSn5YdxegD', 1631467385, 0);

-- ----------------------------
-- Table structure for university
-- ----------------------------
DROP TABLE IF EXISTS `university`;
CREATE TABLE `university`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `active` int NOT NULL,
  `city_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `city_id`(`city_id`) USING BTREE,
  CONSTRAINT `university_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `city` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 65 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of university
-- ----------------------------
INSERT INTO `university` VALUES (1, 'Athabasca University ', 1, 1);
INSERT INTO `university` VALUES (2, 'Concordia University of Edmonton ', 1, 2);
INSERT INTO `university` VALUES (3, 'MacEwan University ', 1, 2);
INSERT INTO `university` VALUES (4, 'Mount Royal University ', 1, 3);
INSERT INTO `university` VALUES (5, 'The King’s University ', 1, 2);
INSERT INTO `university` VALUES (6, 'University of Alberta ', 1, 2);
INSERT INTO `university` VALUES (7, 'University of Calgary ', 1, 4);
INSERT INTO `university` VALUES (8, 'University of Lethbridge ', 1, 5);
INSERT INTO `university` VALUES (9, 'Lethbridge', 1, NULL);
INSERT INTO `university` VALUES (10, 'Simon Fraser University ', 1, NULL);
INSERT INTO `university` VALUES (11, 'The University of British Columbia ', 1, NULL);
INSERT INTO `university` VALUES (12, 'Thompson Rivers University ', 1, NULL);
INSERT INTO `university` VALUES (13, 'Trinity Western University ', 1, NULL);
INSERT INTO `university` VALUES (14, 'University of Northern British Columbia ', 1, NULL);
INSERT INTO `university` VALUES (15, 'University of the Fraser Valley ', 1, NULL);
INSERT INTO `university` VALUES (16, 'University of Victoria ', 1, NULL);
INSERT INTO `university` VALUES (17, 'Vancouver Island University ', 1, NULL);
INSERT INTO `university` VALUES (18, 'Brandon University ', 1, NULL);
INSERT INTO `university` VALUES (19, 'Canadian Mennonite University ', 1, NULL);
INSERT INTO `university` VALUES (20, 'St. Paul’s College ', 1, NULL);
INSERT INTO `university` VALUES (21, 'The University of Winnipeg ', 1, NULL);
INSERT INTO `university` VALUES (22, 'Université de Saint-Boniface ', 1, NULL);
INSERT INTO `university` VALUES (23, 'University of Manitoba ', 1, NULL);
INSERT INTO `university` VALUES (24, 'Mount Allison University ', 1, NULL);
INSERT INTO `university` VALUES (25, 'St. Thomas University ', 1, NULL);
INSERT INTO `university` VALUES (26, 'Université de Moncton ', 1, NULL);
INSERT INTO `university` VALUES (27, 'University of New Brunswick ', 1, NULL);
INSERT INTO `university` VALUES (28, 'Memorial University of Newfoundland ', 1, NULL);
INSERT INTO `university` VALUES (29, 'Acadia University ', 1, NULL);
INSERT INTO `university` VALUES (30, 'Cape Breton University ', 1, NULL);
INSERT INTO `university` VALUES (31, 'Dalhousie University ', 1, NULL);
INSERT INTO `university` VALUES (32, 'Mount Saint Vincent University ', 1, NULL);
INSERT INTO `university` VALUES (33, 'NSCAD University ', 1, NULL);
INSERT INTO `university` VALUES (34, 'Saint Mary’s University ', 1, NULL);
INSERT INTO `university` VALUES (35, 'St. Francis Xavier University ', 1, NULL);
INSERT INTO `university` VALUES (36, 'Université Sainte-Anne ', 1, NULL);
INSERT INTO `university` VALUES (37, 'University of King’s College ', 1, NULL);
INSERT INTO `university` VALUES (38, 'Algoma University ', 1, NULL);
INSERT INTO `university` VALUES (39, 'Brescia University College ', 1, NULL);
INSERT INTO `university` VALUES (40, 'Brock University ', 1, NULL);
INSERT INTO `university` VALUES (41, 'Carleton University ', 1, NULL);
INSERT INTO `university` VALUES (42, 'Huron University College ', 1, NULL);
INSERT INTO `university` VALUES (43, 'King’s University College ', 1, NULL);
INSERT INTO `university` VALUES (44, 'Lakehead University ', 1, NULL);
INSERT INTO `university` VALUES (45, 'Laurentian University ', 1, NULL);
INSERT INTO `university` VALUES (46, 'McMaster University ', 1, NULL);
INSERT INTO `university` VALUES (47, 'Nipissing University ', 1, NULL);
INSERT INTO `university` VALUES (48, 'OCAD University ', 1, NULL);
INSERT INTO `university` VALUES (49, 'Queen’s University ', 1, NULL);
INSERT INTO `university` VALUES (50, 'Redeemer University ', 1, NULL);
INSERT INTO `university` VALUES (51, 'Ryerson University ', 1, NULL);
INSERT INTO `university` VALUES (52, 'St. Jerome’s University ', 1, NULL);
INSERT INTO `university` VALUES (53, 'Trent University ', 1, NULL);
INSERT INTO `university` VALUES (54, 'University of Guelph ', 1, NULL);
INSERT INTO `university` VALUES (55, 'University of Ottawa ', 1, NULL);
INSERT INTO `university` VALUES (56, 'University of St. Michael’s College ', 1, NULL);
INSERT INTO `university` VALUES (57, 'University of Sudbury ', 1, NULL);
INSERT INTO `university` VALUES (58, 'University of Toronto ', 1, NULL);
INSERT INTO `university` VALUES (59, 'University of Waterloo ', 1, NULL);
INSERT INTO `university` VALUES (60, 'University of Windsor ', 1, NULL);
INSERT INTO `university` VALUES (61, 'Victoria University ', 1, NULL);
INSERT INTO `university` VALUES (62, 'Western University ', 1, NULL);
INSERT INTO `university` VALUES (63, 'Wilfrid Laurier University ', 1, NULL);
INSERT INTO `university` VALUES (64, 'York University ', 1, NULL);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(60) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `confirmed_at` int NULL DEFAULT NULL,
  `unconfirmed_email` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `blocked_at` int NULL DEFAULT NULL,
  `registration_ip` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `created_at` int NOT NULL,
  `updated_at` int NOT NULL,
  `flags` int NOT NULL DEFAULT 0,
  `last_login_at` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `user_unique_username`(`username`) USING BTREE,
  UNIQUE INDEX `user_unique_email`(`email`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'mysaltern@gmail.com', '$2y$12$cck9IsTYlSXvw3mX4frp/uJ4wpmpDN7RIJMWIH99dbHdtuo0DIona', 'jcAWIv56qyTNexWayR5n170SvNwfp_IC', 1, NULL, NULL, '127.0.0.1', 1631467385, 1631467385, 0, 1631467448);

SET FOREIGN_KEY_CHECKS = 1;
