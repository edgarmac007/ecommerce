/*
 Navicat Premium Data Transfer

 Source Server         : LOCALHOST
 Source Server Type    : MySQL
 Source Server Version : 100134
 Source Host           : localhost:3306
 Source Schema         : ecommerce

 Target Server Type    : MySQL
 Target Server Version : 100134
 File Encoding         : 65001

 Date: 14/08/2018 05:52:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cat_perfiles
-- ----------------------------
DROP TABLE IF EXISTS `cat_perfiles`;
CREATE TABLE `cat_perfiles`  (
  `id_perfil` int(5) NOT NULL AUTO_INCREMENT,
  `perfil` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_menu` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_usuario` int(10) NOT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_edit` int(10) NULL DEFAULT NULL,
  `timestamp_edit` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_perfil`) USING BTREE,
  INDEX `id_menu`(`id_menu`) USING BTREE,
  INDEX `id_usuario`(`id_usuario`) USING BTREE,
  INDEX `id_usuario_edit`(`id_usuario_edit`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cat_perfiles
-- ----------------------------
INSERT INTO `cat_perfiles` VALUES (1, 'Admin Glolbal', '1,2,3', 1, '2017-06-24 01:36:01', 1, '2017-07-31 23:44:09', 1);
INSERT INTO `cat_perfiles` VALUES (2, 'Visitante', '2,3,4,5', 1, '2017-07-11 23:26:57', 1, '2017-07-31 23:44:10', 1);
INSERT INTO `cat_perfiles` VALUES (3, 'TEST3', '1,2,3,4,5', 1, '2017-07-11 23:27:37', 1, '2017-07-31 23:44:15', 1);
INSERT INTO `cat_perfiles` VALUES (4, 'TEST4', '1,6,8,7', 1, '2017-07-11 23:32:34', 1, '2017-11-03 02:35:09', 0);
INSERT INTO `cat_perfiles` VALUES (5, 'Movil', '1,6,8,11,12,10,7,9,2,3,4,5', 1, '2017-07-11 23:33:37', 1, '2017-08-20 15:30:58', 1);
INSERT INTO `cat_perfiles` VALUES (6, 'Capturistas', '1,6,7,8,2,3,4,5', 1, '2017-07-12 23:40:23', 1, '2017-07-31 23:44:11', 1);
INSERT INTO `cat_perfiles` VALUES (7, 'Admin Local', '1,6,8,7,9,2,3,4,5', 20, '2017-07-13 00:36:24', 1, '2017-08-03 00:37:29', 1);

-- ----------------------------
-- Table structure for cat_roles
-- ----------------------------
DROP TABLE IF EXISTS `cat_roles`;
CREATE TABLE `cat_roles`  (
  `id_rol` int(2) NOT NULL AUTO_INCREMENT,
  `rol` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_rol`) USING BTREE,
  UNIQUE INDEX `nombre`(`rol`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cat_roles
-- ----------------------------
INSERT INTO `cat_roles` VALUES (1, 'Root', 'Root del sistema', 0);
INSERT INTO `cat_roles` VALUES (2, 'Administrador Global', 'Acceso total al sistema', 1);
INSERT INTO `cat_roles` VALUES (3, 'Administrador Local', 'Administrador del sistema', 1);
INSERT INTO `cat_roles` VALUES (4, 'Usuario', 'con accesos restringidos', 1);
INSERT INTO `cat_roles` VALUES (5, 'Editor', 'Captura de datos en el sistema', 1);

-- ----------------------------
-- Table structure for cat_tipos_personales
-- ----------------------------
DROP TABLE IF EXISTS `cat_tipos_personales`;
CREATE TABLE `cat_tipos_personales`  (
  `id_tipo_person` int(3) NOT NULL AUTO_INCREMENT,
  `tipo_empleado` varchar(150) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `timestamp` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  `activo` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id_tipo_person`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of cat_tipos_personales
-- ----------------------------
INSERT INTO `cat_tipos_personales` VALUES (1, 'Directa', '2017-08-23 00:01:16', NULL);
INSERT INTO `cat_tipos_personales` VALUES (2, 'Temporal', '2017-08-23 00:01:16', NULL);
INSERT INTO `cat_tipos_personales` VALUES (3, 'Pasante', '2017-08-23 00:01:16', NULL);
INSERT INTO `cat_tipos_personales` VALUES (4, 'Free Lance', '2017-08-23 00:01:16', NULL);

-- ----------------------------
-- Table structure for sys_estados
-- ----------------------------
DROP TABLE IF EXISTS `sys_estados`;
CREATE TABLE `sys_estados`  (
  `id_estado` int(11) NOT NULL AUTO_INCREMENT,
  `id_pais` int(3) NOT NULL,
  `estado` varchar(35) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `abreviatura` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_estado`) USING BTREE,
  INDEX `id_pais`(`id_pais`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 33 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_estados
-- ----------------------------
INSERT INTO `sys_estados` VALUES (1, 1, 'Aguascalientes', 'Ags.');
INSERT INTO `sys_estados` VALUES (2, 1, 'Baja California', 'BC');
INSERT INTO `sys_estados` VALUES (3, 1, 'Baja California Sur', 'BCS');
INSERT INTO `sys_estados` VALUES (4, 1, 'Campeche', 'Camp.');
INSERT INTO `sys_estados` VALUES (5, 1, 'Coahuila de Zaragoza', 'Coah.');
INSERT INTO `sys_estados` VALUES (6, 1, 'Colima', 'Col.');
INSERT INTO `sys_estados` VALUES (7, 1, 'Chiapas', 'Chis.');
INSERT INTO `sys_estados` VALUES (8, 1, 'Chihuahua', 'Chih.');
INSERT INTO `sys_estados` VALUES (9, 1, 'Ciudad de México', 'CDMX');
INSERT INTO `sys_estados` VALUES (10, 1, 'Durango', 'Dgo.');
INSERT INTO `sys_estados` VALUES (11, 1, 'Guanajuato', 'Gto.');
INSERT INTO `sys_estados` VALUES (12, 1, 'Guerrero', 'Gro.');
INSERT INTO `sys_estados` VALUES (13, 1, 'Hidalgo', 'Hgo.');
INSERT INTO `sys_estados` VALUES (14, 1, 'Jalisco', 'Jal.');
INSERT INTO `sys_estados` VALUES (15, 1, 'México', 'Mex.');
INSERT INTO `sys_estados` VALUES (16, 1, 'Michoacán de Ocampo', 'Mich.');
INSERT INTO `sys_estados` VALUES (17, 1, 'Morelos', 'Mor.');
INSERT INTO `sys_estados` VALUES (18, 1, 'Nayarit', 'Nay.');
INSERT INTO `sys_estados` VALUES (19, 1, 'Nuevo León', 'NL');
INSERT INTO `sys_estados` VALUES (20, 1, 'Oaxaca', 'Oax.');
INSERT INTO `sys_estados` VALUES (21, 1, 'Puebla', 'Pue.');
INSERT INTO `sys_estados` VALUES (22, 1, 'Querétaro', 'Qro.');
INSERT INTO `sys_estados` VALUES (23, 1, 'Quintana Roo', 'Q. Roo');
INSERT INTO `sys_estados` VALUES (24, 1, 'San Luis Potosí', 'SLP');
INSERT INTO `sys_estados` VALUES (25, 1, 'Sinaloa', 'Sin.');
INSERT INTO `sys_estados` VALUES (26, 1, 'Sonora', 'Son.');
INSERT INTO `sys_estados` VALUES (27, 1, 'Tabasco', 'Tab.');
INSERT INTO `sys_estados` VALUES (28, 1, 'Tamaulipas', 'Tamps.');
INSERT INTO `sys_estados` VALUES (29, 1, 'Tlaxcala', 'Tlax.');
INSERT INTO `sys_estados` VALUES (30, 1, 'Veracruz de Ignacio de la Llave', 'Ver.');
INSERT INTO `sys_estados` VALUES (31, 1, 'Yucatán', 'Yuc.');
INSERT INTO `sys_estados` VALUES (32, 1, 'Zacatecas', 'Zac.');

-- ----------------------------
-- Table structure for sys_languages
-- ----------------------------
DROP TABLE IF EXISTS `sys_languages`;
CREATE TABLE `sys_languages`  (
  `id_lang` int(5) NOT NULL AUTO_INCREMENT,
  `short_key` varchar(15) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `language` varchar(200) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_lang`) USING BTREE,
  UNIQUE INDEX `unique`(`short_key`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_languages
-- ----------------------------
INSERT INTO `sys_languages` VALUES (1, 'es_mx', 'Español México', 1);
INSERT INTO `sys_languages` VALUES (2, 'en_us', 'English USA', 1);

-- ----------------------------
-- Table structure for sys_localidades
-- ----------------------------
DROP TABLE IF EXISTS `sys_localidades`;
CREATE TABLE `sys_localidades`  (
  `id_localidad` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `clave_localidad` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `localidad` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `codigo_postal` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_asentamiento` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zona` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_localidad`) USING BTREE,
  INDEX `id_estado`(`id_estado`) USING BTREE,
  INDEX `id_municipio`(`id_municipio`) USING BTREE,
  INDEX `clave_localidad`(`clave_localidad`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1661 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_localidades
-- ----------------------------
INSERT INTO `sys_localidades` VALUES (1, 9, 1, NULL, 'San Rafael', '2010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (2, 9, 1, NULL, 'Libertad', '2050', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (3, 9, 1, NULL, 'Sector Naval', '2080', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (4, 9, 1, NULL, 'Santa Catarina', '2250', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (5, 9, 1, NULL, 'San Juan Tlihuaca', '2400', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (6, 9, 1, NULL, 'Trabajadores de PEMEX', '2419', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (7, 9, 1, NULL, 'Francisco Villa', '2420', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (8, 9, 1, NULL, 'Tezozomoc', '2459', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (9, 9, 1, NULL, 'Ampliación Petrolera', '2470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (10, 9, 1, NULL, 'Coltongo', '2630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (11, 9, 1, NULL, 'Euzkadi', '2660', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (12, 9, 1, NULL, 'Potrero del Llano', '2680', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (13, 9, 1, NULL, 'Ignacio Allende', '2810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (14, 9, 1, NULL, 'Tlatilco', '2860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (15, 9, 1, NULL, 'San Francisco Xocotitla', '2960', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (16, 9, 1, NULL, 'Arenal', '2980', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (17, 9, 1, NULL, 'Sindicato Mexicano de Electricistas', '2060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (18, 9, 1, NULL, 'Santa Inés', '2140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (19, 9, 1, NULL, 'Victoria de las Democracias', '2810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (20, 9, 1, NULL, 'Centro de Azcapotzalco', '2000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (21, 9, 1, NULL, 'Los Reyes', '2010', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (22, 9, 1, NULL, 'Santo Tomás', '2020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (23, 9, 1, NULL, 'Santa María Malinalco', '2050', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (24, 9, 1, NULL, 'Nueva España', '2129', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (25, 9, 1, NULL, 'Villas de Azcapotzalco', '2169', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (26, 9, 1, NULL, 'Reynosa Tamaulipas', '2200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (27, 9, 1, NULL, 'San Andrés', '2240', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (28, 9, 1, NULL, 'Santa Cruz de las Salinas', '2340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (29, 9, 1, NULL, 'Presidente Madero', '2430', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (30, 9, 1, NULL, 'Las Trancas', '2450', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (31, 9, 1, NULL, 'El Jagüey', '2510', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (32, 9, 1, NULL, 'San Bartolo Cahualtongo', '2720', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (33, 9, 1, NULL, 'Santiago Ahuizotla', '2750', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (34, 9, 1, NULL, 'La Raza', '2990', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (35, 9, 1, NULL, 'Un Hogar Para Cada Trabajador', '2060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (36, 9, 1, NULL, 'Nextengo', '2070', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (37, 9, 1, NULL, 'Clavería', '2080', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (38, 9, 1, NULL, 'Nueva El Rosario', '2128', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (39, 9, 1, NULL, 'Las Salinas', '2360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (40, 9, 1, NULL, 'Miguel Hidalgo', '2450', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (41, 9, 1, NULL, 'Unidad Cuitlahuac', '2500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (42, 9, 1, NULL, 'Estación Pantaco', '2520', 'Equipamiento', '');
INSERT INTO `sys_localidades` VALUES (43, 9, 1, NULL, 'Jardín Azpeitia', '2530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (44, 9, 1, NULL, 'San Pedro Xalpa', '2710', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (45, 9, 1, NULL, 'Campo Encantado', '2729', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (46, 9, 1, NULL, 'San Bernabé', '2830', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (47, 9, 1, NULL, 'San Marcos', '2020', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (48, 9, 1, NULL, 'Del Recreo', '2070', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (49, 9, 1, NULL, 'Ferrería', '2310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (50, 9, 1, NULL, 'Huautla de las Salinas', '2330', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (51, 9, 1, NULL, 'La Preciosa', '2460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (52, 9, 1, NULL, 'El Jagüey', '2519', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (53, 9, 1, NULL, 'Hogares Ferrocarrileros', '2540', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (54, 9, 1, NULL, 'Trabajadores de Hierro', '2650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (55, 9, 1, NULL, 'Santa Lucía', '2760', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (56, 9, 1, NULL, 'Obrero Popular', '2840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (57, 9, 1, NULL, 'Patrimonio Familiar', '2980', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (58, 9, 1, NULL, 'San Salvador Xochimanca', '2870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (59, 9, 1, NULL, 'Aguilera', '2900', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (60, 9, 1, NULL, 'Aldana', '2910', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (61, 9, 1, NULL, 'Ampliación Del Gas', '2970', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (62, 9, 1, NULL, 'San Andrés', '2240', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (63, 9, 1, NULL, 'Prados del Rosario', '2410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (64, 9, 1, NULL, 'Providencia', '2440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (65, 9, 1, NULL, 'Lázaro Cárdenas', '2479', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (66, 9, 1, NULL, 'San Mateo', '2490', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (67, 9, 1, NULL, 'Pro-Hogar', '2600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (68, 9, 1, NULL, 'Coltongo', '2630', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (69, 9, 1, NULL, 'Monte Alto', '2640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (70, 9, 1, NULL, 'San Antonio', '2720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (71, 9, 1, NULL, 'San Francisco Tetecala', '2730', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (72, 9, 1, NULL, 'Miguel Lerdo de Tejada', '2739', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (73, 9, 1, NULL, 'Plenitud', '2780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (74, 9, 1, NULL, 'Tlatilco', '2850', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (75, 9, 1, NULL, 'Porvenir', '2940', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (76, 9, 1, NULL, 'Del Maestro', '2040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (77, 9, 1, NULL, 'San Álvaro', '2090', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (78, 9, 1, NULL, 'Ángel Zimbrón', '2099', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (79, 9, 1, NULL, 'El Rosario', '2100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (80, 9, 1, NULL, 'Manuel Rivera Anaya CROC 1', '2109', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (81, 9, 1, NULL, 'San Martín Xochinahuac', '2120', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (82, 9, 1, NULL, 'Pasteros', '2150', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (83, 9, 1, NULL, 'Santo Domingo', '2160', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (84, 9, 1, NULL, 'Industrial Vallejo', '2300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (85, 9, 1, NULL, 'Petrolera', '2480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (86, 9, 1, NULL, 'Pantaco', '2510', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (87, 9, 1, NULL, 'Cosmopolita', '2670', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (88, 9, 1, NULL, 'La Providencia', '2750', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (89, 9, 1, NULL, 'Santa Apolonia', '2790', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (90, 9, 1, NULL, 'Nueva Santa María', '2800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (91, 9, 1, NULL, 'Ampliación Cosmopolita', '2920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (92, 9, 1, NULL, 'Liberación', '2930', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (93, 9, 1, NULL, 'Nuevo Barrio San Rafael', '2010', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (94, 9, 1, NULL, 'San Sebastián', '2040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (95, 9, 1, NULL, 'Tierra Nueva', '2130', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (96, 9, 1, NULL, 'Santa Bárbara', '2230', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (97, 9, 1, NULL, 'San Andrés de las Salinas', '2320', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (98, 9, 1, NULL, 'Ex-Hacienda El Rosario', '2420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (99, 9, 1, NULL, 'Granjas Pantaco Campamento Ferrocarrilero', '2525', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (100, 9, 1, NULL, 'San Miguel Amantla', '2700', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (101, 9, 1, NULL, 'Ampliación San Pedro Xalpa', '2719', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (102, 9, 1, NULL, 'Industrial San Antonio', '2760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (103, 9, 1, NULL, 'Santa Cruz Acayucan', '2770', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (104, 9, 1, NULL, 'Del Gas', '2950', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (105, 9, 2, NULL, 'Del Carmen', '4100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (106, 9, 2, NULL, 'Santa Catarina', '4010', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (107, 9, 2, NULL, 'Del Niño Jesús', '4330', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (108, 9, 2, NULL, 'El Rosario', '4380', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (109, 9, 2, NULL, 'Petrolera Taxqueña', '4410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (110, 9, 2, NULL, 'Jardines del Pedregal de San Ángel', '4500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (111, 9, 2, NULL, 'La Otra Banda', '4519', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (112, 9, 2, NULL, 'Pedregal de Santa Úrsula', '4600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (113, 9, 2, NULL, 'El Caracol', '4739', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (114, 9, 2, NULL, 'Prados de Coyoacán', '4810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (115, 9, 2, NULL, 'Los Cipreses', '4830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (116, 9, 2, NULL, 'Jardines de Coyoacán', '4890', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (117, 9, 2, NULL, 'Campestre Coyoacán', '4938', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (118, 9, 2, NULL, 'Los Sauces', '4940', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (119, 9, 2, NULL, 'El Mirador', '4950', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (120, 9, 2, NULL, 'Ex-Hacienda Coapa', '4980', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (121, 9, 2, NULL, 'San Diego Churubusco', '4120', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (122, 9, 2, NULL, 'Churubusco Country Club', '4210', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (123, 9, 2, NULL, 'Prado Churubusco', '4230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (124, 9, 2, NULL, 'San Francisco Culhuacán Barrio de San Juan', '4260', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (125, 9, 2, NULL, 'Ajusco', '4300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (126, 9, 2, NULL, 'Pedregal de Coyoacán', '4330', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (127, 9, 2, NULL, 'Copilco El Bajo', '4340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (128, 9, 2, NULL, 'Integración Latinoamericana', '4350', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (129, 9, 2, NULL, 'Residencial la Cantera', '4368', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (130, 9, 2, NULL, 'Culhuacán CTM Sección I', '4440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (131, 9, 2, NULL, 'Presidentes Ejidales 2a Sección', '4470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (132, 9, 2, NULL, 'Culhuacán CTM Sección X-A', '4480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (133, 9, 2, NULL, 'San Pablo Tepetlapa', '4620', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (134, 9, 2, NULL, 'Cantil del Pedregal', '4730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (135, 9, 2, NULL, 'Modulo Social Imán', '4738', 'Condominio', '');
INSERT INTO `sys_localidades` VALUES (136, 9, 2, NULL, 'Carmen Serdán', '4910', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (137, 9, 2, NULL, 'Emiliano Zapata Fraccionamiento Popular', '4919', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (138, 9, 2, NULL, 'Ermita Churubusco', '4239', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (139, 9, 2, NULL, 'Cuadrante de San Francisco', '4320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (140, 9, 2, NULL, 'Pedregal de San Francisco', '4320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (141, 9, 2, NULL, 'Pedregal de Santo Domingo', '4369', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (142, 9, 2, NULL, 'Nueva Díaz Ordaz', '4390', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (143, 9, 2, NULL, 'Educación', '4400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (144, 9, 2, NULL, 'Culhuacán CTM Sección II', '4440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (145, 9, 2, NULL, 'El Centinela', '4450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (146, 9, 2, NULL, 'Culhuacán CTM Sección III', '4480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (147, 9, 2, NULL, 'Culhuacán CTM Sección VII', '4489', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (148, 9, 2, NULL, 'Xotepingo', '4610', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (149, 9, 2, NULL, 'El Reloj', '4640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (150, 9, 2, NULL, 'Los Cedros', '4800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (151, 9, 2, NULL, 'Emiliano Zapata', '4815', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (152, 9, 2, NULL, 'Viejo Ejido de Santa Úrsula Coapa', '4980', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (153, 9, 2, NULL, 'San Lucas', '4030', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (154, 9, 2, NULL, 'Campestre Churubusco', '4200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (155, 9, 2, NULL, 'San Francisco Culhuacán Barrio de San Francisco', '4260', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (156, 9, 2, NULL, 'Villas Copilco', '4350', 'Conjunto habitacional', '');
INSERT INTO `sys_localidades` VALUES (157, 9, 2, NULL, 'Culhuacán CTM Sección V', '4440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (158, 9, 2, NULL, 'Avante', '4460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (159, 9, 2, NULL, 'Culhuacán CTM CROC', '4480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (160, 9, 2, NULL, 'Culhuacán CTM Canal Nacional', '4490', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (161, 9, 2, NULL, 'Adolfo Ruiz Cortínes', '4630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (162, 9, 2, NULL, 'Pedregal de La Zorra', '4660', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (163, 9, 2, NULL, 'Olímpica', '4710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (164, 9, 2, NULL, 'Vistas del Maurel', '4718', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (165, 9, 2, NULL, 'Pedregal del Sur', '4719', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (166, 9, 2, NULL, 'La Virgen', '4908', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (167, 9, 2, NULL, 'Cafetales', '4918', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (168, 9, 2, NULL, 'Culhuacán CTM Sección X', '4939', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (169, 9, 2, NULL, 'Copilco Universidad', '4360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (170, 9, 2, NULL, 'Ciudad Jardín', '4370', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (171, 9, 2, NULL, 'Culhuacán CTM Sección VI', '4480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (172, 9, 2, NULL, 'Insurgentes Cuicuilco', '4530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (173, 9, 2, NULL, 'Los Olivos', '4890', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (174, 9, 2, NULL, 'Los Girasoles', '4920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (175, 9, 2, NULL, 'Las Campanas', '4929', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (176, 9, 2, NULL, 'Haciendas de Coyoacán', '4970', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (177, 9, 2, NULL, 'Villa Coyoacán', '4000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (178, 9, 2, NULL, 'La Concepción', '4020', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (179, 9, 2, NULL, 'Hermosillo', '4240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (180, 9, 2, NULL, 'Romero de Terreros', '4320', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (181, 9, 2, NULL, 'Villa de San Francisco', '4326', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (182, 9, 2, NULL, 'Huayamilpas', '4390', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (183, 9, 2, NULL, 'Santa Úrsula Coapa', '4650', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (184, 9, 2, NULL, 'Joyas del Pedregal', '4660', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (185, 9, 2, NULL, 'El Parque de Coyoacán', '4899', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (186, 9, 2, NULL, 'Culhuacán CTM Sección VIII', '4909', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (187, 9, 2, NULL, 'Santa Cecilia', '4930', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (188, 9, 2, NULL, 'Ex-Ejido de Santa Úrsula Coapa', '4980', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (189, 9, 2, NULL, 'San Mateo', '4120', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (190, 9, 2, NULL, 'San Francisco Culhuacán Barrio de La Magdalena', '4260', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (191, 9, 2, NULL, 'San Francisco Culhuacán Barrio de Santa Ana', '4260', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (192, 9, 2, NULL, 'Oxtopulco Universidad', '4318', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (193, 9, 2, NULL, 'El Rosedal', '4330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (194, 9, 2, NULL, 'Los Reyes', '4330', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (195, 9, 2, NULL, 'Empleados Federales', '4359', 'Condominio', '');
INSERT INTO `sys_localidades` VALUES (196, 9, 2, NULL, 'Copilco El Alto', '4360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (197, 9, 2, NULL, 'Atlántida', '4370', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (198, 9, 2, NULL, 'La Candelaria', '4380', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (199, 9, 2, NULL, 'Ex-Ejido de San Francisco Culhuacán', '4420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (200, 9, 2, NULL, 'Presidentes Ejidales 1a Sección', '4470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (201, 9, 2, NULL, 'Culhuacán CTM Sección Piloto', '4490', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (202, 9, 2, NULL, 'Culhuacán CTM Sección IX-A', '4909', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (203, 9, 2, NULL, 'Culhuacán CTM Sección IX-B', '4909', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (204, 9, 2, NULL, 'Parque San Andrés', '4040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (205, 9, 2, NULL, 'Paseos de Taxqueña', '4250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (206, 9, 2, NULL, 'Santa Martha del Sur Quetzalcoatl', '4270', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (207, 9, 2, NULL, 'Romero de Terreros', '4310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (208, 9, 2, NULL, 'Universidad Nacional Autónoma de México', '4510', 'Equipamiento', '');
INSERT INTO `sys_localidades` VALUES (209, 9, 2, NULL, 'Pedregal de Carrasco', '4700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (210, 9, 2, NULL, 'Bosques de Tetlameya', '4730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (211, 9, 2, NULL, 'Alianza Popular Revolucionaria', '4800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (212, 9, 2, NULL, 'Ex-Ejido de San Pablo Tepetlapa', '4840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (213, 9, 2, NULL, 'Sector Marina', '4849', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (214, 9, 2, NULL, 'Espartaco', '4870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (215, 9, 2, NULL, 'Villa Quietud', '4960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (216, 9, 3, NULL, 'Loma del Padre', '5020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (217, 9, 3, NULL, 'Jesús del Monte', '5260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (218, 9, 3, NULL, 'Adolfo López Mateos', '5280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (219, 9, 3, NULL, 'Cuajimalpa', '5000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (220, 9, 3, NULL, 'San Pablo Chimalpa', '5050', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (221, 9, 3, NULL, 'Bosques de las Lomas', '5120', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (222, 9, 3, NULL, 'El Molinito', '5310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (223, 9, 3, NULL, 'Ampliación Memetla', '5330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (224, 9, 3, NULL, 'Las Tinajas', '5370', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (225, 9, 3, NULL, 'Contadero', '5500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (226, 9, 3, NULL, 'Xalpa', '5730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (227, 9, 3, NULL, 'Zentlapatl', '5010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (228, 9, 3, NULL, 'Tepetongo', '5220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (229, 9, 3, NULL, 'Abdías García Soto', '5530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (230, 9, 3, NULL, 'La Pila', '5750', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (231, 9, 3, NULL, 'Club de Golf Bosques', '5214', 'Residencial', '');
INSERT INTO `sys_localidades` VALUES (232, 9, 3, NULL, 'El Molino', '5240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (233, 9, 3, NULL, 'El Yaqui', '5320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (234, 9, 3, NULL, 'San Mateo Tlaltenango', '5600', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (235, 9, 3, NULL, 'Ahuatenco', '5039', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (236, 9, 3, NULL, 'Cooperativa Palo Alto', '5110', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (237, 9, 3, NULL, 'San José de los Cedros', '5200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (238, 9, 3, NULL, 'Granjas Navidad', '5219', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (239, 9, 3, NULL, 'Memetla', '5330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (240, 9, 3, NULL, 'San Lorenzo Acopilco', '5410', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (241, 9, 3, NULL, 'Cruz Blanca', '5700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (242, 9, 3, NULL, 'Las Maromas', '5710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (243, 9, 3, NULL, 'San Pedro', '5030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (244, 9, 3, NULL, 'La Manzanita', '5030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (245, 9, 3, NULL, 'José María Castorena', '5060', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (246, 9, 3, NULL, 'Manzanastitla', '5270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (247, 9, 3, NULL, 'Ampliación el Yaqui', '5330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (248, 9, 3, NULL, 'El Tianguillo', '5400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (249, 9, 3, NULL, 'La Venta', '5520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (250, 9, 3, NULL, 'Granjas Palo Alto', '5118', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (251, 9, 3, NULL, 'Campestre Palo Alto', '5119', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (252, 9, 3, NULL, 'Amado Nervo', '5269', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (253, 9, 3, NULL, 'Lomas de Memetla', '5330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (254, 9, 3, NULL, 'Santa Fe Cuajimalpa', '5348', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (255, 9, 3, NULL, 'Lomas de San Pedro', '5379', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (256, 9, 3, NULL, '1° de Mayo', '5410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (257, 9, 3, NULL, 'Lomas de Vista Hermosa', '5100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (258, 9, 3, NULL, 'Lomas del Chamizal', '5129', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (259, 9, 3, NULL, 'El Ébano', '5230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (260, 9, 3, NULL, 'Villas de Cuajimalpa', '5268', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (261, 9, 3, NULL, 'Locaxco', '5360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (262, 9, 3, NULL, 'Santa Rosa Xochiac', '5610', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (263, 9, 3, NULL, 'Las Lajas', '5760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (264, 9, 3, NULL, 'Agua Bendita', '5780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (265, 9, 4, NULL, 'Santa Isabel Tola', '7010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (266, 9, 4, NULL, 'San Miguel', '7100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (267, 9, 4, NULL, 'Luis Donaldo Colosio', '7164', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (268, 9, 4, NULL, 'Prados de Cuautepec', '7164', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (269, 9, 4, NULL, 'Cocoyotes', '7180', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (270, 9, 4, NULL, 'Vista Hermosa', '7187', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (271, 9, 4, NULL, 'Tlalpexco', '7188', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (272, 9, 4, NULL, 'Castillo Grande', '7220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (273, 9, 4, NULL, 'Zona Escolar Oriente', '7239', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (274, 9, 4, NULL, 'Solidaridad Nacional', '7268', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (275, 9, 4, NULL, 'Acueducto de Guadalupe', '7279', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (276, 9, 4, NULL, 'San Rafael Ticomán', '7359', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (277, 9, 4, NULL, 'Capultitlan', '7370', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (278, 9, 4, NULL, 'Juan González Romero', '7410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (279, 9, 4, NULL, 'Ampliación San Juan de Aragón', '7470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (280, 9, 4, NULL, 'San Felipe de Jesús', '7510', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (281, 9, 4, NULL, 'La Cruz', '7070', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (282, 9, 4, NULL, 'Cuautepec Barrio Alto', '7100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (283, 9, 4, NULL, 'La Casilda', '7150', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (284, 9, 4, NULL, 'Ahuehuetes', '7189', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (285, 9, 4, NULL, 'Chalma de Guadalupe', '7210', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (286, 9, 4, NULL, 'Castillo Chico', '7220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (287, 9, 4, NULL, 'Jorge Negrete', '7280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (288, 9, 4, NULL, 'La Pastora', '7290', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (289, 9, 4, NULL, 'Tlacamaca', '7380', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (290, 9, 4, NULL, 'El Coyol', '7420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (291, 9, 4, NULL, 'Nueva Atzacoalco', '7420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (292, 9, 4, NULL, 'Vasco de Quiroga', '7440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (293, 9, 4, NULL, 'San Pedro El Chico', '7480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (294, 9, 4, NULL, 'Campestre Aragón', '7530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (295, 9, 4, NULL, 'Progreso Nacional', '7600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (296, 9, 4, NULL, 'Ampliación Progreso Nacional', '7650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (297, 9, 4, NULL, 'Guadalupe Proletaria', '7670', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (298, 9, 4, NULL, 'Santiago Atzacoalco', '7040', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (299, 9, 4, NULL, '15 de Agosto', '7058', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (300, 9, 4, NULL, 'Triunfo de La República', '7069', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (301, 9, 4, NULL, 'C.T.M. El Risco', '7090', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (302, 9, 4, NULL, 'Compositores Mexicanos', '7130', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (303, 9, 4, NULL, 'El Tepetatal', '7130', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (304, 9, 4, NULL, 'Forestal', '7140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (305, 9, 4, NULL, 'Loma La Palma', '7160', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (306, 9, 4, NULL, 'Tlacaélel', '7164', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (307, 9, 4, NULL, 'Rosas del Tepeyac', '7010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (308, 9, 4, NULL, 'Villa Gustavo A. Madero', '7050', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (309, 9, 4, NULL, 'Ampliación Malacates', '7119', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (310, 9, 4, NULL, 'Arboledas', '7140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (311, 9, 4, NULL, 'Graciano Sánchez', '7164', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (312, 9, 4, NULL, 'Zona Escolar', '7230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (313, 9, 4, NULL, 'Benito Juárez', '7250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (314, 9, 4, NULL, 'Ampliación Benito Juárez', '7259', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (315, 9, 4, NULL, 'Lindavista Sur', '7300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (316, 9, 4, NULL, 'La Laguna Ticomán', '7340', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (317, 9, 4, NULL, 'San Pedro Zacatenco', '7360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (318, 9, 4, NULL, 'Salvador Díaz Mirón', '7400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (319, 9, 4, NULL, 'Siete Maravillas', '7707', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (320, 9, 4, NULL, 'Gertrudis Sánchez 1a Sección', '7830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (321, 9, 4, NULL, 'La Joyita', '7860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (322, 9, 4, NULL, 'Emiliano Zapata', '7889', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (323, 9, 4, NULL, 'Cuchilla del Tesoro', '7900', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (324, 9, 4, NULL, 'San Juan de Aragón VII Sección', '7910', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (325, 9, 4, NULL, 'Ex Ejido San Juan de Aragón Sector 33', '7940', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (326, 9, 4, NULL, 'Héroes de Cerro Prieto', '7960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (327, 9, 4, NULL, 'San Juan de Aragón III Sección', '7970', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (328, 9, 4, NULL, 'Nueva Industrial Vallejo', '7700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (329, 9, 4, NULL, 'Churubusco Tepeyac', '7730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (330, 9, 4, NULL, 'Lindavista Vallejo II Sección', '7755', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (331, 9, 4, NULL, 'Panamericana', '7770', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (332, 9, 4, NULL, 'Ampliación Panamericana', '7770', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (333, 9, 4, NULL, 'Vallejo Poniente', '7790', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (334, 9, 4, NULL, 'San Juan de Aragón VI Sección', '7918', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (335, 9, 4, NULL, 'Héroes de Chapultepec', '7939', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (336, 9, 4, NULL, 'Ex Escuela de Tiro', '7960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (337, 9, 4, NULL, 'San Juan de Aragón I Sección', '7969', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (338, 9, 4, NULL, 'Aragón la Villa', '7000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (339, 9, 4, NULL, 'Dinamita', '7070', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (340, 9, 4, NULL, 'Martín Carrera', '7070', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (341, 9, 4, NULL, 'C.T.M. Atzacoalco', '7090', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (342, 9, 4, NULL, 'San Antonio', '7109', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (343, 9, 4, NULL, 'Ampliación Arboledas', '7140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (344, 9, 4, NULL, 'La Lengüeta', '7144', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (345, 9, 4, NULL, 'San José Ticomán', '7340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (346, 9, 4, NULL, 'Residencial Zacatenco', '7369', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (347, 9, 4, NULL, 'Del Obrero', '7430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (348, 9, 4, NULL, 'LI Legislatura', '7456', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (349, 9, 4, NULL, 'La Pradera', '7500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (350, 9, 4, NULL, 'Ampliación Providencia', '7560', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (351, 9, 4, NULL, 'Lasalle', '7709', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (352, 9, 4, NULL, 'Nueva Vallejo', '7750', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (353, 9, 4, NULL, 'Aragón Inguarán', '7820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (354, 9, 4, NULL, 'Gertrudis Sánchez 3a Sección', '7838', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (355, 9, 4, NULL, 'Ampliación Emiliano Zapata', '7858', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (356, 9, 4, NULL, 'Ampliación Mártires de Río Blanco', '7859', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (357, 9, 4, NULL, 'Nueva Tenochtitlán', '7890', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (358, 9, 4, NULL, 'San Juan de Aragón', '7920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (359, 9, 4, NULL, 'San Juan de Aragón IV Sección', '7979', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (360, 9, 4, NULL, 'C.T.M. Aragón', '7990', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (361, 9, 4, NULL, '6 de Junio', '7183', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (362, 9, 4, NULL, 'Del Carmen', '7199', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (363, 9, 4, NULL, 'El Arbolillo', '7240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (364, 9, 4, NULL, 'Residencial Acueducto de Guadalupe', '7270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (365, 9, 4, NULL, 'Villa Hermosa', '7410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (366, 9, 4, NULL, 'Villa de Aragón', '7570', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (367, 9, 4, NULL, 'San Bartolo Atepehuacan', '7730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (368, 9, 4, NULL, 'Planetario Lindavista', '7739', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (369, 9, 4, NULL, 'Tres Estrellas', '7820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (370, 9, 4, NULL, 'San Juan de Aragón', '7950', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (371, 9, 4, NULL, 'La Esmeralda', '7540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (372, 9, 4, NULL, 'Guadalupe Victoria', '7790', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (373, 9, 4, NULL, 'Gertrudis Sánchez 2a Sección', '7839', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (374, 9, 4, NULL, '7 de Noviembre', '7840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (375, 9, 4, NULL, 'Bondojito', '7850', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (376, 9, 4, NULL, 'Belisario Domínguez', '7869', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (377, 9, 4, NULL, 'Vallejo', '7870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (378, 9, 4, NULL, 'Mártires de Río Blanco', '7880', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (379, 9, 4, NULL, 'La Joya', '7890', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (380, 9, 4, NULL, 'San Juan de Aragón V Sección', '7979', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (381, 9, 4, NULL, 'Tepeyac Insurgentes', '7020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (382, 9, 4, NULL, 'Forestal I', '7140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (383, 9, 4, NULL, 'Parque Metropolitano', '7149', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (384, 9, 4, NULL, 'Cuautepec de Madero', '7200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (385, 9, 4, NULL, 'Del Bosque', '7207', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (386, 9, 4, NULL, 'Ampliación Chalma de Guadalupe', '7214', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (387, 9, 4, NULL, 'Santa María Ticomán', '7330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (388, 9, 4, NULL, 'Guadalupe Ticomán', '7350', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (389, 9, 4, NULL, 'San José de la Escalera', '7630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (390, 9, 4, NULL, 'Santiago Atepetlac', '7640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (391, 9, 4, NULL, 'Torres Lindavista', '7708', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (392, 9, 4, NULL, 'Lindavista Vallejo I Sección', '7720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (393, 9, 4, NULL, 'Valle del Tepeyac', '7740', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (394, 9, 4, NULL, 'Lindavista Vallejo III Sección', '7754', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (395, 9, 4, NULL, 'Tablas de San Agustín', '7860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (396, 9, 4, NULL, 'Guadalupe Insurgentes', '7870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (397, 9, 4, NULL, 'La Malinche', '7899', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (398, 9, 4, NULL, 'Indeco', '7930', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (399, 9, 4, NULL, 'Estanzuela', '7060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (400, 9, 4, NULL, 'Gabriel Hernández', '7080', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (401, 9, 4, NULL, 'Lomas de Cuautepec', '7110', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (402, 9, 4, NULL, 'Malacates', '7119', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (403, 9, 4, NULL, 'Forestal II', '7144', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (404, 9, 4, NULL, 'General Felipe Berriozabal', '7180', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (405, 9, 4, NULL, 'Ampliación Cocoyotes', '7180', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (406, 9, 4, NULL, 'Guadalupe Victoria Cuautepec', '7209', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (407, 9, 4, NULL, 'Ampliación Castillo Grande', '7224', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (408, 9, 4, NULL, 'Candelaria Ticomán', '7310', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (409, 9, 4, NULL, 'Residencial la Escalera', '7320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (410, 9, 4, NULL, 'San Juan y Guadalupe Ticomán', '7350', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (411, 9, 4, NULL, 'Lomas de San Juan Ixhuatepec 2a Sección', '7363', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (412, 9, 4, NULL, 'Maximino Ávila Camacho', '7380', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (413, 9, 4, NULL, 'Residencial Oriente', '7456', 'Conjunto habitacional', '');
INSERT INTO `sys_localidades` VALUES (414, 9, 4, NULL, 'Granjas Modernas', '7460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (415, 9, 4, NULL, 'Constitución de La República', '7469', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (416, 9, 4, NULL, '25 de Julio', '7520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (417, 9, 4, NULL, 'Providencia', '7550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (418, 9, 4, NULL, 'Ampliación Guadalupe Proletaria', '7680', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (419, 9, 4, NULL, 'Defensores de La República', '7780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (420, 9, 4, NULL, 'Héroe de Nacozari', '7780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (421, 9, 4, NULL, 'Industrial', '7800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (422, 9, 4, NULL, 'Estrella', '7810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (423, 9, 4, NULL, 'Guadalupe Tepeyac', '7840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (424, 9, 4, NULL, 'Faja de Oro', '7850', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (425, 9, 4, NULL, 'Ex Ejido San Juan de Aragón Sector 32', '7919', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (426, 9, 4, NULL, 'Narciso Bassols', '7980', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (427, 9, 4, NULL, 'Tepetates', '7010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (428, 9, 4, NULL, 'Ampliación Gabriel Hernández', '7089', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (429, 9, 4, NULL, 'Juventino Rosas', '7150', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (430, 9, 4, NULL, 'Palmatitla', '7170', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (431, 9, 4, NULL, 'Valle de Madero', '7190', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (432, 9, 4, NULL, 'Lindavista Norte', '7300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (433, 9, 4, NULL, 'La Purísima Ticomán', '7320', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (434, 9, 4, NULL, 'Juan de Dios Bátiz', '7360', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (435, 9, 4, NULL, 'DM Nacional', '7450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (436, 9, 4, NULL, 'Ferrocarrilera', '7455', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (437, 9, 4, NULL, 'Eduardo Molina', '7458', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (438, 9, 4, NULL, 'Pradera II Sección', '7509', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (439, 9, 4, NULL, 'Ampliación Casas Alemán', '7580', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (440, 9, 4, NULL, 'Santa Rosa', '7620', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (441, 9, 4, NULL, 'Montevideo', '7730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (442, 9, 4, NULL, 'Magdalena de las Salinas', '7760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (443, 9, 4, NULL, 'Cuchilla La Joya', '7890', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (444, 9, 4, NULL, 'El Olivo', '7920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (445, 9, 4, NULL, 'Fernando Casas Alemán', '7960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (446, 9, 4, NULL, 'San Juan de Aragón II Sección', '7969', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (447, 9, 5, NULL, 'Granjas México', '8400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (448, 9, 5, NULL, 'Santa Cruz', '8910', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (449, 9, 5, NULL, 'Jardines Tecma', '8920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (450, 9, 5, NULL, 'Santiago Norte', '8240', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (451, 9, 5, NULL, 'Cuchilla Agrícola Oriental', '8420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (452, 9, 5, NULL, 'Zapotla', '8610', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (453, 9, 5, NULL, 'San Miguel', '8650', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (454, 9, 5, NULL, 'Militar Marte', '8830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (455, 9, 5, NULL, 'Ex-Ejido de La Magdalena Mixiuhca', '8010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (456, 9, 5, NULL, 'Gabriel Ramos Millán Sección Cuchilla', '8030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (457, 9, 5, NULL, 'Carlos Zapata Vela', '8040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (458, 9, 5, NULL, 'Nueva Santa Anita', '8210', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (459, 9, 5, NULL, 'San Pedro', '8220', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (460, 9, 5, NULL, 'Gabriel Ramos Millán', '8730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (461, 9, 5, NULL, 'Los Picos de Iztacalco Sección 1A', '8770', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (462, 9, 5, NULL, 'Reforma Iztaccíhuatl Sur', '8840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (463, 9, 5, NULL, 'Fraccionamiento Coyuya', '8320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (464, 9, 5, NULL, 'El Rodeo', '8510', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (465, 9, 5, NULL, 'La Asunción', '8600', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (466, 9, 5, NULL, 'Los Reyes', '8620', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (467, 9, 5, NULL, 'Santiago Sur', '8800', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (468, 9, 5, NULL, 'Ampliación Gabriel Ramos Millán', '8020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (469, 9, 5, NULL, 'San Francisco Xicaltongo', '8230', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (470, 9, 5, NULL, 'Agrícola Oriental', '8500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (471, 9, 5, NULL, 'Juventino Rosas', '8700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (472, 9, 5, NULL, 'Gabriel Ramos Millán Sección Tlacotal', '8720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (473, 9, 5, NULL, 'Campamento 2 de Octubre', '8930', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (474, 9, 5, NULL, 'Santa Anita', '8300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (475, 9, 5, NULL, 'Los Picos de Iztacalco Sección 1B', '8760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (476, 9, 5, NULL, 'INFONAVIT Iztacalco', '8900', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (477, 9, 5, NULL, 'Gabriel Ramos Millán Sección Bramadero', '8000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (478, 9, 5, NULL, 'Viaducto Piedad', '8200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (479, 9, 5, NULL, 'La Cruz', '8310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (480, 9, 5, NULL, 'Los Picos de Iztacalco Sección 2A', '8760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (481, 9, 5, NULL, 'Agrícola Pantitlán', '8100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (482, 9, 5, NULL, 'Tlazintla', '8710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (483, 9, 5, NULL, 'INPI Picos', '8760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (484, 9, 5, NULL, 'Reforma Iztaccíhuatl Norte', '8810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (485, 9, 6, NULL, 'San José', '9000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (486, 9, 6, NULL, 'San Lucas', '9000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (487, 9, 6, NULL, 'Dr. Alfonso Ortiz Tirado', '9020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (488, 9, 6, NULL, 'Paseos de Churubusco', '9030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (489, 9, 6, NULL, 'Sector Popular', '9060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (490, 9, 6, NULL, 'Voceadores de México', '9120', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (491, 9, 6, NULL, 'Renovación', '9209', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (492, 9, 6, NULL, 'La Regadera', '9250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (493, 9, 6, NULL, 'Albarrada', '9350', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (494, 9, 6, NULL, 'San José Aculco', '9410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (495, 9, 6, NULL, 'Nueva Rosita', '9420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (496, 9, 6, NULL, 'El Triunfo', '9430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (497, 9, 6, NULL, 'El Prado', '9480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (498, 9, 6, NULL, 'Santa María Aztahuacán', '9570', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (499, 9, 6, NULL, 'Fuerte de Loreto', '9577', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (500, 9, 6, NULL, 'Ejército de Agua Prieta', '9578', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (501, 9, 6, NULL, 'San Miguel Teotongo Sección Capilla', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (502, 9, 6, NULL, 'San Miguel Teotongo Sección Mercedes', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (503, 9, 6, NULL, 'Reforma Política', '9730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (504, 9, 6, NULL, 'Las Peñas', '9750', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (505, 9, 6, NULL, 'El Triángulo', '9769', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (506, 9, 6, NULL, 'Año de Juárez', '9780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (507, 9, 6, NULL, 'Valle de Luces', '9809', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (508, 9, 6, NULL, 'Valle del Sur', '9819', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (509, 9, 6, NULL, 'Los Ángeles', '9830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (510, 9, 6, NULL, 'Ampliación Paraje San Juan', '9839', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (511, 9, 6, NULL, 'San Juan Xalpa', '9850', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (512, 9, 6, NULL, 'San Nicolás Tolentino', '9850', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (513, 9, 6, NULL, 'Benito Juárez', '9859', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (514, 9, 6, NULL, 'San Pablo', '9000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (515, 9, 6, NULL, 'Héroes de Churubusco', '9090', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (516, 9, 6, NULL, 'Unidad Ejército Constitucionalista', '9220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (517, 9, 6, NULL, 'Ejército de Oriente Zona Peñón', '9239', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (518, 9, 6, NULL, 'Progresista', '9240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (519, 9, 6, NULL, 'El Gavilán', '9369', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (520, 9, 6, NULL, 'Jardines de Churubusco', '9410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (521, 9, 6, NULL, 'Zacahuitzco', '9440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (522, 9, 6, NULL, 'Santa María Aztahuacán Ampliación', '9500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (523, 9, 6, NULL, 'El Edén', '9520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (524, 9, 6, NULL, 'Miravalles', '9696', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (525, 9, 6, NULL, 'Mixcoatl', '9708', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (526, 9, 6, NULL, 'Lomas de Santa Cruz', '9709', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (527, 9, 6, NULL, 'El Mirador', '9800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (528, 9, 6, NULL, 'Ampliación El Santuario', '9829', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (529, 9, 6, NULL, 'Lomas El Manto', '9830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (530, 9, 6, NULL, 'Ampliación Los Reyes', '9849', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (531, 9, 6, NULL, 'San Andrés Tomatlán', '9870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (532, 9, 6, NULL, 'Santa María Tomatlán', '9870', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (533, 9, 6, NULL, 'Campestre Estrella', '9880', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (534, 9, 6, NULL, 'Rinconada Estrella', '9889', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (535, 9, 6, NULL, 'Guadalupe', '9900', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (536, 9, 6, NULL, 'Los Mirasoles', '9910', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (537, 9, 6, NULL, 'Jardines de San Lorenzo Tezonco', '9940', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (538, 9, 6, NULL, 'USCOVI', '9960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (539, 9, 6, NULL, 'Santa Bárbara', '9000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (540, 9, 6, NULL, 'Real del Moral', '9010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (541, 9, 6, NULL, 'Cacama', '9080', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (542, 9, 6, NULL, 'El Paraíso', '9230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (543, 9, 6, NULL, 'Colonial Iztapalapa', '9270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (544, 9, 6, NULL, 'Jacarandas', '9280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (545, 9, 6, NULL, 'San Miguel', '9360', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (546, 9, 6, NULL, 'Purísima Atlazolpa', '9429', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (547, 9, 6, NULL, 'Justo Sierra', '9460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (548, 9, 6, NULL, 'Santa Martha Acatitla Norte', '9140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (549, 9, 6, NULL, 'Ejército de Oriente', '9230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (550, 9, 6, NULL, 'Guadalupe del Moral', '9300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (551, 9, 6, NULL, 'San Juanico Nextipac', '9400', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (552, 9, 6, NULL, 'El Sifón', '9400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (553, 9, 6, NULL, 'Ampliación El Triunfo', '9438', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (554, 9, 6, NULL, 'Banjidal', '9450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (555, 9, 6, NULL, 'San Miguel Teotongo Sección Rancho Bajo', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (556, 9, 6, NULL, 'San José Buenavista', '9706', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (557, 9, 6, NULL, 'Francisco Villa', '9720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (558, 9, 6, NULL, 'Lomas de San Lorenzo', '9780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (559, 9, 6, NULL, 'San Simón Culhuacán', '9800', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (560, 9, 6, NULL, 'Los Cipreses', '9810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (561, 9, 6, NULL, 'Estrella del Sur', '9820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (562, 9, 6, NULL, 'Paraje San Juan Cerro', '9858', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (563, 9, 6, NULL, 'Cerro de La Estrella', '9860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (564, 9, 6, NULL, 'Granjas Estrella', '9880', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (565, 9, 6, NULL, 'Lomas Estrella FOVISSSTE', '9899', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (566, 9, 6, NULL, 'José López Portillo', '9920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (567, 9, 6, NULL, 'Carmen Serdán', '9979', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (568, 9, 6, NULL, 'San Pedro', '9000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (569, 9, 6, NULL, 'Escuadrón 201', '9060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (570, 9, 6, NULL, 'La Valenciana', '9110', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (571, 9, 6, NULL, 'José María Morelos y Pavón', '9230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (572, 9, 6, NULL, 'Constitución de 1917', '9260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (573, 9, 6, NULL, 'Leyes de Reforma 1a Sección', '9310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (574, 9, 6, NULL, 'Leyes de Reforma 2a Sección', '9310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (575, 9, 6, NULL, 'Leyes de Reforma 3a Sección', '9310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (576, 9, 6, NULL, 'Sideral', '9320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (577, 9, 6, NULL, 'Alborada', '9369', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (578, 9, 6, NULL, 'Santa Martha Acatitla Sur', '9530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (579, 9, 6, NULL, 'Artículo 4°. Constitucional', '9577', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (580, 9, 6, NULL, 'Lomas de Zaragoza', '9620', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (581, 9, 6, NULL, 'San Miguel Teotongo Sección Guadalupe', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (582, 9, 6, NULL, 'San Miguel Teotongo Sección Iztlahuaca', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (583, 9, 6, NULL, 'San Miguel Teotongo Sección Palmitas', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (584, 9, 6, NULL, 'Campestre Potrero', '9637', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (585, 9, 6, NULL, 'Tenorios', '9680', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (586, 9, 6, NULL, 'Carlos Hank Gonzalez', '9700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (587, 9, 6, NULL, 'Insurgentes', '9750', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (588, 9, 6, NULL, 'Consejo Agrarista Mexicano', '9760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (589, 9, 6, NULL, 'Puente Blanco', '9770', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (590, 9, 6, NULL, 'Culhuacán', '9800', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (591, 9, 6, NULL, 'Granjas Esmeralda', '9810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (592, 9, 6, NULL, 'Casa Blanca', '9860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (593, 9, 6, NULL, 'San Ignacio', '9000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (594, 9, 6, NULL, 'Mexicaltzingo', '9099', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (595, 9, 6, NULL, 'Ermita Zaragoza', '9180', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (596, 9, 6, NULL, 'Gama Gavilán', '9369', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (597, 9, 6, NULL, 'Magdalena Atlazolpa', '9410', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (598, 9, 6, NULL, 'Apatlaco', '9430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (599, 9, 6, NULL, 'El Retoño', '9440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (600, 9, 6, NULL, 'Paraje Zacatepec', '9560', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (601, 9, 6, NULL, 'San Miguel Teotongo Sección Acorralado', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (602, 9, 6, NULL, 'Palmitas', '9670', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (603, 9, 6, NULL, 'Barranca de Guadalupe', '9689', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (604, 9, 6, NULL, 'Bellavista', '9860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (605, 9, 6, NULL, 'Cananea', '9969', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (606, 9, 6, NULL, 'Valle de San Lorenzo', '9970', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (607, 9, 6, NULL, 'Santa Martha Acatitla', '9510', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (608, 9, 6, NULL, 'Santiago Acahualtepec 1ra. Ampliación', '9608', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (609, 9, 6, NULL, 'Santiago Acahualtepec 2a. Ampliación', '9609', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (610, 9, 6, NULL, 'San Miguel Teotongo Sección Jardines', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (611, 9, 6, NULL, 'San Miguel Teotongo Sección Ranchito', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (612, 9, 6, NULL, 'Ampliación Emiliano Zapata', '9638', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (613, 9, 6, NULL, 'Lomas de la Estancia', '9640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (614, 9, 6, NULL, 'Xalpa', '9640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (615, 9, 6, NULL, 'Citlalli', '9660', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (616, 9, 6, NULL, 'Miguel de La Madrid Hurtado', '9698', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (617, 9, 6, NULL, 'Buenavista', '9700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (618, 9, 6, NULL, 'Santa Cruz Meyehualco', '9700', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (619, 9, 6, NULL, 'STUNAM', '9719', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (620, 9, 6, NULL, 'San Lorenzo Tezonco', '9790', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (621, 9, 6, NULL, 'Estrella Culhuacán', '9800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (622, 9, 6, NULL, 'Fuego Nuevo', '9800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (623, 9, 6, NULL, 'San Antonio Culhuacán', '9800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (624, 9, 6, NULL, 'Predio Maravillas', '9800', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (625, 9, 6, NULL, 'Progreso del Sur', '9810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (626, 9, 6, NULL, 'La Mora Grande', '9820', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (627, 9, 6, NULL, 'Estado de Veracruz', '9856', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (628, 9, 6, NULL, 'Ampliación Bellavista', '9860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (629, 9, 6, NULL, 'El Rodeo', '9860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (630, 9, 6, NULL, 'Bertha Von Bloumer', '9864', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (631, 9, 6, NULL, 'San Juan Estrella', '9868', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (632, 9, 6, NULL, 'San Andrés Tomatlán', '9870', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (633, 9, 6, NULL, 'Cooperativa de Trabajadores Sector Pesca', '9880', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (634, 9, 6, NULL, 'El Vergel', '9880', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (635, 9, 6, NULL, 'San Lorenzo', '9900', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (636, 9, 6, NULL, 'El Rosario', '9930', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (637, 9, 6, NULL, 'Iztlahuacán', '9690', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (638, 9, 6, NULL, 'Desarrollo Urbano Quetzalcoatl', '9700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (639, 9, 6, NULL, 'Los Ángeles Apanoaya', '9710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (640, 9, 6, NULL, 'Residencial del Valle', '9767', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (641, 9, 6, NULL, 'San Marcos', '9800', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (642, 9, 6, NULL, 'El Santuario', '9820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (643, 9, 6, NULL, 'Ricardo Flores Magón', '9820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (644, 9, 6, NULL, 'Ampliación Ricardo Flores Magón', '9828', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (645, 9, 6, NULL, 'El Manto', '9830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (646, 9, 6, NULL, 'San Miguel 8va. Ampliación', '9837', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (647, 9, 6, NULL, 'Parque Nacional Cerro de la Estrella', '9860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (648, 9, 6, NULL, 'Carlos Jonguitud Barrios', '9897', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (649, 9, 6, NULL, 'La Esperanza', '9910', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (650, 9, 6, NULL, 'Celoalliotli', '9960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (651, 9, 6, NULL, 'Granjas de San Antonio', '9070', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (652, 9, 6, NULL, 'Juan Escutia', '9100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (653, 9, 6, NULL, 'San Lorenzo Xicotencatl', '9130', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (654, 9, 6, NULL, 'Chinampac de Juárez', '9208', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (655, 9, 6, NULL, 'Santa Cruz Meyehualco', '9290', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (656, 9, 6, NULL, 'Cuchilla del Moral', '9319', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (657, 9, 6, NULL, 'Eva Sámano de López Mateos', '9359', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (658, 9, 6, NULL, 'Aculco', '9410', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (659, 9, 6, NULL, 'Los Picos VI-B', '9420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (660, 9, 6, NULL, 'San Andrés Tetepilco', '9440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (661, 9, 6, NULL, 'Santa María Aztahuacán', '9500', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (662, 9, 6, NULL, 'San Sebastián Tecoloxtitla', '9520', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (663, 9, 6, NULL, 'Las Rosas', '9579', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (664, 9, 6, NULL, 'Santiago Acahualtepec', '9600', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (665, 9, 6, NULL, 'San Miguel Teotongo Sección Puente', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (666, 9, 6, NULL, 'La Era', '9720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (667, 9, 6, NULL, 'Presidentes de México', '9740', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (668, 9, 6, NULL, 'La Polvorilla', '9750', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (669, 9, 6, NULL, 'San Antonio Culhuacán', '9800', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (670, 9, 6, NULL, 'Tula', '9800', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (671, 9, 6, NULL, 'Santa Isabel Industrial', '9820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (672, 9, 6, NULL, 'Cuitlahuac', '9836', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (673, 9, 6, NULL, 'Sabadell Bellavista', '9860', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (674, 9, 6, NULL, '12 de Diciembre', '9870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (675, 9, 6, NULL, 'Lomas Estrella', '9890', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (676, 9, 6, NULL, 'San Antonio', '9900', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (677, 9, 6, NULL, 'Central de Abasto', '9040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (678, 9, 6, NULL, 'Unidad Modelo', '9089', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (679, 9, 6, NULL, 'Unidad Vicente Guerrero', '9200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (680, 9, 6, NULL, 'Tepalcates', '9210', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (681, 9, 6, NULL, 'Álvaro Obregón', '9230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (682, 9, 6, NULL, 'Peñón Viejo', '9233', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (683, 9, 6, NULL, 'Ampliación San Miguel', '9360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (684, 9, 6, NULL, 'Sinatel', '9470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (685, 9, 6, NULL, 'Ampliación Sinatel', '9479', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (686, 9, 6, NULL, 'Monte Alban', '9550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (687, 9, 6, NULL, 'San Miguel Teotongo Sección Corrales', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (688, 9, 6, NULL, 'San Miguel Teotongo Sección Avisadero', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (689, 9, 6, NULL, 'San Miguel Teotongo Sección La Cruz', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (690, 9, 6, NULL, 'San Miguel Teotongo Sección Loma Alta', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (691, 9, 6, NULL, 'San Miguel Teotongo Sección Torres', '9630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (692, 9, 6, NULL, 'San Pablo', '9648', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (693, 9, 6, NULL, 'Degollado', '9704', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (694, 9, 6, NULL, 'Arboledas Zafiro', '9704', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (695, 9, 6, NULL, 'Degollado - Mexicatlalli', '9705', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (696, 9, 6, NULL, 'Valle de Luces', '9800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (697, 9, 6, NULL, 'Minerva', '9810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (698, 9, 6, NULL, 'El Molino', '9830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (699, 9, 6, NULL, 'Paraje San Juan', '9830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (700, 9, 6, NULL, 'Plan de Iguala', '9838', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (701, 9, 6, NULL, 'San Juan Joya', '9839', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (702, 9, 6, NULL, 'Los Reyes Culhuacán', '9840', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (703, 9, 6, NULL, 'Santa María del Monte', '9850', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (704, 9, 6, NULL, 'Ampliación Veracruzana', '9856', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (705, 9, 6, NULL, 'El Tule', '9857', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (706, 9, 6, NULL, 'El Molino Tezonco', '9960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (707, 9, 6, NULL, 'Allapetlalli', '9960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (708, 9, 6, NULL, 'La Planta', '9960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (709, 9, 7, NULL, 'La Asunción', '9000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (710, 9, 7, NULL, 'Lomas de San Bernabé', '10350', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (711, 9, 7, NULL, 'El Tanque', '10320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (712, 9, 7, NULL, 'Palmas', '10370', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (713, 9, 7, NULL, 'Lomas Quebradas', '10000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (714, 9, 7, NULL, 'Batan Viejo', '10130', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (715, 9, 7, NULL, 'Las Cruces', '10330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (716, 9, 7, NULL, 'Los Padres', '10340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (717, 9, 7, NULL, 'Ampliación Potrerillo', '10368', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (718, 9, 7, NULL, 'Atacaxco', '10378', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (719, 9, 7, NULL, 'San Nicolás Totolapan', '10900', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (720, 9, 7, NULL, 'Las Huertas', '10920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (721, 9, 7, NULL, 'Barrio San Francisco', '10500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (722, 9, 7, NULL, 'Barranca Seca', '10580', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (723, 9, 7, NULL, 'Héroes de Padierna', '10700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (724, 9, 7, NULL, 'La Concepción', '10830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (725, 9, 7, NULL, 'Plazuela del Pedregal', '10840', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (726, 9, 7, NULL, 'La Magdalena', '10910', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (727, 9, 7, NULL, 'San Bartolo Ameyalco', '10010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (728, 9, 7, NULL, 'Ampliación Lomas de San Bernabé', '10369', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (729, 9, 7, NULL, 'Barros Sierra', '10380', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (730, 9, 7, NULL, 'Cuauhtémoc', '10020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (731, 9, 7, NULL, 'San Bernabé Ocotepec', '10300', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (732, 9, 7, NULL, 'San Jerónimo Aculco', '10400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (733, 9, 7, NULL, 'El Ocotal', '10630', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (734, 9, 7, NULL, 'El Ermitaño', '10660', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (735, 9, 7, NULL, 'Unidad Independencia IMSS', '10100', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (736, 9, 7, NULL, 'San Jerónimo Lídice', '10200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (737, 9, 7, NULL, 'Huayatla', '10360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (738, 9, 7, NULL, 'Vista Hermosa', '10379', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (739, 9, 7, NULL, 'El Rosal', '10600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (740, 9, 7, NULL, 'La Carbonera', '10640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (741, 9, 7, NULL, 'Pueblo Nuevo Alto', '10640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (742, 9, 7, NULL, 'Pueblo Nuevo Bajo', '10640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (743, 9, 7, NULL, 'La Cruz', '10800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (744, 9, 7, NULL, 'La Guadalupe', '10820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (745, 9, 7, NULL, 'Las Calles', '10840', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (746, 9, 7, NULL, 'Tierra Colorada', '10926', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (747, 9, 7, NULL, 'La Malinche', '10010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (748, 9, 7, NULL, 'El Oasis de San Bernabé', '10309', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (749, 9, 7, NULL, 'Tierra Unida', '10369', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (750, 9, 7, NULL, 'El Toro', '10610', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (751, 9, 7, NULL, 'Potrerillo', '10620', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (752, 9, 7, NULL, 'Santa Teresa', '10710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (753, 9, 7, NULL, 'San Francisco', '10810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (754, 9, 8, NULL, 'Santa Martha', '12000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (755, 9, 8, NULL, 'San Agustin', '12070', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (756, 9, 8, NULL, 'Cruztitla', '12100', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (757, 9, 8, NULL, 'Tula', '12200', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (758, 9, 8, NULL, 'San Juan', '12400', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (759, 9, 8, NULL, 'San Miguel', '12400', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (760, 9, 8, NULL, 'San Marcos', '12920', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (761, 9, 8, NULL, 'La Concepción', '12000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (762, 9, 8, NULL, 'Tenantitla', '12100', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (763, 9, 8, NULL, 'Xochitepec', '12100', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (764, 9, 8, NULL, 'Panchimalco', '12200', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (765, 9, 8, NULL, 'Los Ángeles', '12000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (766, 9, 8, NULL, 'Tecaxtitla', '12100', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (767, 9, 8, NULL, 'Ocotitla', '12200', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (768, 9, 8, NULL, 'Emiliano Zapata', '12110', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (769, 9, 8, NULL, 'Nochtla', '12200', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (770, 9, 8, NULL, 'San Francisco Tecoxpa', '12700', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (771, 9, 8, NULL, 'San Salvador Cuauhtenco', '12300', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (772, 9, 8, NULL, 'Chalmita', '12410', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (773, 9, 8, NULL, 'San Miguel', '12930', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (774, 9, 8, NULL, 'Villa Milpa Alta Centro', '12000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (775, 9, 8, NULL, 'San Agustin Ohtenco', '12080', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (776, 9, 8, NULL, 'Xaltipac', '12100', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (777, 9, 8, NULL, 'San Lorenzo Tlacoyucan', '12500', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (778, 9, 8, NULL, 'San Jerónimo Miacatlán', '12600', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (779, 9, 8, NULL, 'San Juan Tepenahuac', '12800', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (780, 9, 8, NULL, 'San José', '12940', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (781, 9, 8, NULL, 'San Bartolomé Xicomulco', '12250', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (782, 9, 8, NULL, 'Centro', '12400', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (783, 9, 8, NULL, 'La Lupita Teticpac', '12910', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (784, 9, 8, NULL, 'La Lupita Xolco', '12950', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (785, 9, 8, NULL, 'La Luz', '12000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (786, 9, 8, NULL, 'San Mateo', '12000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (787, 9, 8, NULL, 'Santa Cruz', '12000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (788, 9, 8, NULL, 'La Conchita', '12110', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (789, 9, 9, NULL, 'Ex-Hacienda de Guadalupe Chimalistac', '1050', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (790, 9, 9, NULL, 'Progreso Tizapan', '1080', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (791, 9, 9, NULL, 'Bellavista', '1140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (792, 9, 9, NULL, 'Lomas de Santa Fe', '1219', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (793, 9, 9, NULL, 'Mártires de Tacubaya', '1220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (794, 9, 9, NULL, 'Liberación Proletaria', '1260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (795, 9, 9, NULL, 'Desarrollo Urbano', '1278', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (796, 9, 9, NULL, '1a Ampliación Presidentes', '1299', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (797, 9, 9, NULL, 'Palmas', '1410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (798, 9, 9, NULL, 'Colina del Sur', '1430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (799, 9, 9, NULL, 'Alfonso XIII', '1460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (800, 9, 9, NULL, 'La Araña', '1510', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (801, 9, 9, NULL, 'Canutillo 2a Sección', '1560', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (802, 9, 9, NULL, 'Reacomodo Valentín Gómez Farías', '1569', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (803, 9, 9, NULL, 'El Rincón', '1590', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (804, 9, 9, NULL, 'El Ruedo', '1650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (805, 9, 9, NULL, 'San Bartolo Ameyalco', '1800', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (806, 9, 9, NULL, 'Belém de las Flores', '1110', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (807, 9, 9, NULL, 'El Capulín', '1110', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (808, 9, 9, NULL, 'Acueducto', '1120', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (809, 9, 9, NULL, 'Cristo Rey', '1150', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (810, 9, 9, NULL, 'Bosque', '1160', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (811, 9, 9, NULL, 'Maria G. de García Ruiz', '1160', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (812, 9, 9, NULL, 'Carola', '1180', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (813, 9, 9, NULL, 'Zenón Delgado', '1220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (814, 9, 9, NULL, 'Los Gamitos', '1230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (815, 9, 9, NULL, 'Tlapechico', '1230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (816, 9, 9, NULL, 'El Árbol', '1250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (817, 9, 9, NULL, 'Lomas de Nuevo México', '1250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (818, 9, 9, NULL, 'Golondrinas 1a Sección', '1270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (819, 9, 9, NULL, 'El Pirul', '1276', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (820, 9, 9, NULL, 'Alfalfar', '1470', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (821, 9, 9, NULL, 'Providencia', '1540', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (822, 9, 9, NULL, 'Ampliación Tepeaca', '1550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (823, 9, 9, NULL, 'Belém de las Flores', '1630', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (824, 9, 9, NULL, '2a Del Moral del Pueblo Tetelpan', '1700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (825, 9, 9, NULL, 'Tetelpan', '1700', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (826, 9, 9, NULL, 'El Mirador del Pueblo Tetelpan', '1708', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (827, 9, 9, NULL, 'Lomas de las Águilas', '1730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (828, 9, 9, NULL, 'San Clemente Sur', '1740', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (829, 9, 9, NULL, 'La Herradura del Pueblo Tetelpan', '1760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (830, 9, 9, NULL, 'Miguel Hidalgo', '1789', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (831, 9, 9, NULL, 'Campestre', '1040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (832, 9, 9, NULL, 'La Otra Banda', '1090', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (833, 9, 9, NULL, 'Pólvora', '1100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (834, 9, 9, NULL, 'Liberales de 1857', '1110', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (835, 9, 9, NULL, '1a Victoria', '1160', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (836, 9, 9, NULL, 'Abraham M. González', '1170', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (837, 9, 9, NULL, 'Santa Fe IMSS', '1170', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (838, 9, 9, NULL, '8 de Agosto', '1180', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (839, 9, 9, NULL, 'Bonanza', '1220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (840, 9, 9, NULL, 'Campo de Tiro los Gamitos', '1230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (841, 9, 9, NULL, 'El Piru Santa Fe', '1230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (842, 9, 9, NULL, 'La Huerta', '1239', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (843, 9, 9, NULL, 'Pueblo Nuevo', '1240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (844, 9, 9, NULL, 'Tecolalco', '1250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (845, 9, 9, NULL, 'La Mexicana', '1260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (846, 9, 9, NULL, '2a Sección Cañada', '1269', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (847, 9, 9, NULL, 'El Tejocote', '1270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (848, 9, 9, NULL, 'Villa Solidaridad', '1275', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (849, 9, 9, NULL, 'Jalalpa Tepito', '1296', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (850, 9, 9, NULL, 'Jalalpa El Grande', '1377', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (851, 9, 9, NULL, 'Antonio Carrillo Flores', '1379', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (852, 9, 9, NULL, 'Olivar del Conde 1a Sección', '1400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (853, 9, 9, NULL, 'Barrio Norte', '1410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (854, 9, 9, NULL, 'Sacramento', '1420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (855, 9, 9, NULL, 'Molino de Rosas', '1470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (856, 9, 9, NULL, 'Santa Lucía', '1500', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (857, 9, 9, NULL, 'Garcimarrero', '1510', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (858, 9, 9, NULL, 'Los Cedros', '1510', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (859, 9, 9, NULL, 'Estado de Hidalgo', '1520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (860, 9, 9, NULL, 'Piru Santa Lucía', '1520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (861, 9, 9, NULL, 'Corpus Christy', '1530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (862, 9, 9, NULL, 'Rinconada Las Cuevitas', '1550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (863, 9, 9, NULL, 'Canutillo', '1560', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (864, 9, 9, NULL, 'Tepeaca', '1567', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (865, 9, 9, NULL, 'Rinconada de Tarango', '1619', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (866, 9, 9, NULL, 'El Encino del Pueblo Tetelpan', '1708', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (867, 9, 9, NULL, 'Las Águilas', '1710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (868, 9, 9, NULL, 'Las Águilas 3er Parque', '1750', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (869, 9, 9, NULL, 'Atlamaya', '1760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (870, 9, 9, NULL, 'Tizampampano del Pueblo Tetelpan', '1780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (871, 9, 9, NULL, 'San Ángel', '1000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (872, 9, 9, NULL, 'Ermita Tizapan', '1089', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (873, 9, 9, NULL, 'La Conchita', '1109', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (874, 9, 9, NULL, 'Ampliación El Capulín', '1110', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (875, 9, 9, NULL, 'Hidalgo', '1120', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (876, 9, 9, NULL, 'Paraíso', '1130', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (877, 9, 9, NULL, 'Reacomodo Pino Suárez', '1139', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (878, 9, 9, NULL, 'Isidro Fabela', '1160', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (879, 9, 9, NULL, 'Ladera', '1250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (880, 9, 9, NULL, '1a Sección Cañada', '1269', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (881, 9, 9, NULL, 'Lomas de Becerra', '1279', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (882, 9, 9, NULL, 'El Rodeo', '1285', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (883, 9, 9, NULL, 'Ampliación Jalalpa', '1296', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (884, 9, 9, NULL, 'Batallón de San Patricio', '1450', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (885, 9, 9, NULL, 'Llano Redondo', '1540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (886, 9, 9, NULL, 'Punta de Cehuaya', '1540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (887, 9, 9, NULL, 'Ave Real', '1560', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (888, 9, 9, NULL, 'Merced Gómez', '1600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (889, 9, 9, NULL, 'Profesor J. Arturo López Martínez', '1610', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (890, 9, 9, NULL, 'La Martinica', '1619', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (891, 9, 9, NULL, 'Puerta Grande', '1630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (892, 9, 9, NULL, 'Tecalcapa del Pueblo Tetelpan', '1700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (893, 9, 9, NULL, 'Las Águilas 1a Sección', '1750', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (894, 9, 9, NULL, 'Lomas de San Ángel Inn', '1790', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (895, 9, 9, NULL, 'Guadalupe Inn', '1020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (896, 9, 9, NULL, 'José Maria Pino Suárez', '1140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (897, 9, 9, NULL, 'Arturo Martínez', '1200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (898, 9, 9, NULL, 'Cuevitas', '1220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (899, 9, 9, NULL, 'La Estrella', '1220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (900, 9, 9, NULL, 'La Mexicana 2a Ampliación', '1259', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (901, 9, 9, NULL, 'La Presa', '1270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (902, 9, 9, NULL, 'Golondrinas', '1270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (903, 9, 9, NULL, 'Jalalpa Tepito 2a Ampliación', '1296', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (904, 9, 9, NULL, '2a Ampliación Presidentes', '1299', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (905, 9, 9, NULL, 'Paseo de las Lomas', '1330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (906, 9, 9, NULL, 'Santa Fe', '1376', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (907, 9, 9, NULL, 'Preconcreto', '1400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (908, 9, 9, NULL, 'Santa María Nonoalco', '1420', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (909, 9, 9, NULL, 'Hogar y Redención', '1450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (910, 9, 9, NULL, 'Miguel Gaona Armenta', '1500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (911, 9, 9, NULL, 'Ampliación Los Pirules', '1520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (912, 9, 9, NULL, 'Ampliación Estado de Hidalgo', '1520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (913, 9, 9, NULL, 'El Politoco', '1520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (914, 9, 9, NULL, 'Acuilotla', '1539', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (915, 9, 9, NULL, 'Cehuaya', '1540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (916, 9, 9, NULL, 'Dos Ríos del Pueblo Santa Lucía', '1549', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (917, 9, 9, NULL, 'Tepeaca', '1550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (918, 9, 9, NULL, 'Canutillo 3a Sección', '1560', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (919, 9, 9, NULL, 'Tarango', '1588', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (920, 9, 9, NULL, 'Colinas de Tarango', '1610', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (921, 9, 9, NULL, 'Arcos Centenario', '1618', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (922, 9, 9, NULL, 'Ponciano Arriaga', '1645', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (923, 9, 9, NULL, 'Ampliación Tlacuitlapa', '1650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (924, 9, 9, NULL, '2o Reacomodo Tlacuitlapa', '1650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (925, 9, 9, NULL, 'La Joyita del Pueblo Tetelpan', '1700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (926, 9, 9, NULL, 'Ocotillos del Pueblo Tetelpan', '1700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (927, 9, 9, NULL, 'Las Águilas 2o Parque', '1750', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (928, 9, 9, NULL, 'Olivar de los Padres', '1780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (929, 9, 9, NULL, 'Lomas de los Ángeles del Pueblo Tetelpan', '1790', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (930, 9, 9, NULL, 'Lomas Axomiatla', '1820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (931, 9, 9, NULL, 'Santa Rosa Xochiac', '1830', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (932, 9, 9, NULL, 'Torres de Potrero', '1840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (933, 9, 9, NULL, 'Rincón de la Bolsa', '1849', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (934, 9, 9, NULL, 'Lomas de Chamontoya', '1857', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (935, 9, 9, NULL, 'Los Alpes', '1010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (936, 9, 9, NULL, 'Florida', '1030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (937, 9, 9, NULL, 'Las Águilas', '1048', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (938, 9, 9, NULL, 'Tlacopac', '1049', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (939, 9, 9, NULL, 'Loreto', '1090', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (940, 9, 9, NULL, 'Las Américas', '1120', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (941, 9, 9, NULL, 'Molino de Santo Domingo', '1130', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (942, 9, 9, NULL, 'Tolteca', '1150', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (943, 9, 9, NULL, 'San Pedro de los Pinos', '1180', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (944, 9, 9, NULL, 'Margarita Maza de Juárez', '1250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (945, 9, 9, NULL, 'Calzada Jalalpa', '1260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (946, 9, 9, NULL, 'Lomas de Capula', '1270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (947, 9, 9, NULL, 'La Joya', '1280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (948, 9, 9, NULL, 'Presidentes', '1290', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (949, 9, 9, NULL, 'Ampliación Piloto Adolfo López Mateos', '1298', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (950, 9, 9, NULL, 'San Gabriel', '1310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (951, 9, 9, NULL, 'Carlos A. Madrazo', '1320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (952, 9, 9, NULL, 'Santa Fe La Loma', '1376', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (953, 9, 9, NULL, 'Santa Fe Centro Ciudad', '1376', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (954, 9, 9, NULL, 'Olivar del Conde 2a Sección', '1408', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (955, 9, 9, NULL, 'Torres de Mixcoac', '1490', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (956, 9, 9, NULL, 'Cooperativa Unión Olivos', '1539', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (957, 9, 9, NULL, 'Balcones de Cehuayo', '1540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (958, 9, 9, NULL, 'Ex-Hacienda de Tarango', '1618', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (959, 9, 9, NULL, 'Lomas de Tarango', '1620', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (960, 9, 9, NULL, 'Ampliación Las Águilas', '1759', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (961, 9, 9, NULL, 'San José del Olivar', '1770', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (962, 9, 9, NULL, 'Lomas del Capulín', '1863', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (963, 9, 9, NULL, 'Tlacoyaque', '1859', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (964, 9, 9, NULL, 'Jardines del Pedregal', '1900', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (965, 9, 9, NULL, 'San Jerónimo Aculco', '1904', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (966, 9, 9, NULL, 'Axotla', '1030', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (967, 9, 9, NULL, 'Altavista', '1060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (968, 9, 9, NULL, 'Tizapan', '1090', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (969, 9, 9, NULL, 'Cove', '1120', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (970, 9, 9, NULL, 'Real del Monte', '1130', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (971, 9, 9, NULL, 'Santa Fe', '1210', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (972, 9, 9, NULL, 'El Piru 2a Ampliación', '1230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (973, 9, 9, NULL, 'Ampliación La Cebada', '1259', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (974, 9, 9, NULL, 'La Palmita', '1260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (975, 9, 9, NULL, 'Santa Fe Peña Blanca', '1376', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (976, 9, 9, NULL, 'Lomas de Plateros', '1480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (977, 9, 9, NULL, 'Villa Progresista', '1548', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (978, 9, 9, NULL, 'Lomas de Puerta Grande', '1630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (979, 9, 9, NULL, 'Santa Lucía Chantepec', '1650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (980, 9, 9, NULL, 'Ampliación Alpes', '1710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (981, 9, 9, NULL, 'Lomas de Guadalupe', '1720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (982, 9, 9, NULL, 'Alcantarilla', '1729', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (983, 9, 9, NULL, 'La Angostura', '1770', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (984, 9, 9, NULL, 'Lomas de los Cedros', '1870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (985, 9, 9, NULL, 'San Ángel Inn', '1060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (986, 9, 9, NULL, 'Chimalistac', '1070', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (987, 9, 9, NULL, 'Ampliación Acueducto', '1125', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (988, 9, 9, NULL, 'Nelli Campo Bello', '1184', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (989, 9, 9, NULL, 'El Cuernito', '1220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (990, 9, 9, NULL, 'Ampliación La Mexicana', '1260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (991, 9, 9, NULL, 'Golondrinas 2a Sección', '1270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (992, 9, 9, NULL, 'Arvide', '1280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (993, 9, 9, NULL, 'El Pocito', '1280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (994, 9, 9, NULL, 'Francisco Villa', '1280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (995, 9, 9, NULL, 'Lomas de Becerra', '1280', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (996, 9, 9, NULL, 'Reacomodo El Cuernito', '1289', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (997, 9, 9, NULL, 'Piloto Adolfo López Mateos', '1290', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (998, 9, 9, NULL, 'Bejero del Pueblo Santa Fe', '1340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (999, 9, 9, NULL, 'Santa Fe Tlayapaca', '1389', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1000, 9, 9, NULL, 'Galeana', '1407', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1001, 9, 9, NULL, 'Minas Cristo Rey', '1419', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1002, 9, 9, NULL, 'Unidad Popular Emiliano Zapata', '1450', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1003, 9, 9, NULL, 'La Cascada', '1490', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1004, 9, 9, NULL, 'Santa Lucía Chantepec', '1509', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1005, 9, 9, NULL, 'Universal', '1537', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1006, 9, 9, NULL, 'Tepopotla', '1538', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1007, 9, 9, NULL, 'Hueytlale', '1566', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1008, 9, 9, NULL, 'Los Juristas', '1630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1009, 9, 9, NULL, 'Herón Proal', '1640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1010, 9, 9, NULL, 'La Milagrosa', '1650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1011, 9, 9, NULL, 'Palmas Axotitla', '1650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1012, 9, 9, NULL, 'Tlacuitlapa', '1650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1013, 9, 9, NULL, 'San Agustín del Pueblo Tetelpan', '1700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1014, 9, 9, NULL, 'Puente Colorado', '1730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1015, 9, 9, NULL, 'La Peñita del Pueblo Tetelpan', '1740', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1016, 9, 9, NULL, 'San Clemente Norte', '1740', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1017, 9, 9, NULL, 'Flor de María', '1760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1018, 9, 9, NULL, 'Rancho San Francisco Pueblo San Bartolo Ameyalco', '1807', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1019, 9, 9, NULL, 'Villa Verdún', '1810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1020, 9, 9, NULL, 'Ejido San Mateo', '1820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1021, 9, 9, NULL, 'Rancho del Carmen del Pueblo San Bartolo Ameyalco', '1849', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1022, 9, 9, NULL, 'Lomas de La Era', '1860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1023, 9, 10, NULL, 'Santa Ana', '13060', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1024, 9, 10, NULL, 'Hombres de la Reforma', '13060', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1025, 9, 10, NULL, 'Los Reyes', '13080', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1026, 9, 10, NULL, 'San Andrés', '13099', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1027, 9, 10, NULL, 'Cañada', '13110', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1028, 9, 10, NULL, 'La Mesa', '13123', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1029, 9, 10, NULL, 'Villas Trabajadores del Gobierno del Distrito Federal', '13278', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1030, 9, 10, NULL, 'Nueva Tenochtitlán', '13317', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1031, 9, 10, NULL, 'San Francisco Tlaltenco', '13400', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1032, 9, 10, NULL, 'Zacatenco', '13440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1033, 9, 10, NULL, 'Tierra Blanca', '13540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1034, 9, 10, NULL, 'Santa Cecilia', '13010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1035, 9, 10, NULL, 'San Mateo', '13040', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1036, 9, 10, NULL, 'Ampliación Santa Catarina', '13120', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1037, 9, 10, NULL, 'La Concepción', '13150', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1038, 9, 10, NULL, 'Las Arboledas', '13219', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1039, 9, 10, NULL, 'Santa Ana Centro', '13300', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1040, 9, 10, NULL, 'Santiago Norte', '13300', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1041, 9, 10, NULL, 'San Miguel', '13640', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1042, 9, 10, NULL, 'San Isidro', '13094', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1043, 9, 10, NULL, 'Santiago', '13120', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1044, 9, 10, NULL, 'Ampliación Los Olivos', '13219', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1045, 9, 10, NULL, 'La Nopalera', '13220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1046, 9, 10, NULL, 'Del Mar', '13270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1047, 9, 10, NULL, 'Agrícola Metropolitana', '13280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1048, 9, 10, NULL, 'La Conchita Zapotitlán', '13360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1049, 9, 10, NULL, 'Ampliación Selene', '13430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1050, 9, 10, NULL, 'San Agustín', '13508', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1051, 9, 10, NULL, 'La Asunción', '13530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1052, 9, 10, NULL, 'La Asunción', '13000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1053, 9, 10, NULL, 'San Sebastián', '13093', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1054, 9, 10, NULL, 'Granjas Cabrera', '13230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1055, 9, 10, NULL, 'Aurorita', '13317', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1056, 9, 10, NULL, 'La Herradura', '13318', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1057, 9, 10, NULL, 'Tempiluli', '13363', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1058, 9, 10, NULL, 'Selene', '13420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1059, 9, 10, NULL, 'El Triángulo', '13460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1060, 9, 10, NULL, 'La Concepción', '13509', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1061, 9, 10, NULL, 'Jaime Torres Bodet', '13530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1062, 9, 10, NULL, 'La Turba', '13250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1063, 9, 10, NULL, 'San Agustín', '13630', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1064, 9, 10, NULL, 'Tepantitlamilco', '13700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1065, 9, 10, NULL, 'San José', '13020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1066, 9, 10, NULL, 'La Habana', '13050', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1067, 9, 10, NULL, 'Chichilaula', '13123', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1068, 9, 10, NULL, 'San Miguel', '13180', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1069, 9, 10, NULL, 'Villa Centroamericana', '13278', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1070, 9, 10, NULL, 'Ampliación Zapotitla', '13315', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1071, 9, 10, NULL, 'La Orilla', '13410', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1072, 9, 10, NULL, 'Ampliación José López Portillo', '13419', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1073, 9, 10, NULL, 'Ojo de Agua', '13450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1074, 9, 10, NULL, 'La Lupita', '13510', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1075, 9, 10, NULL, 'La Loma', '13529', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1076, 9, 10, NULL, 'El Rosario', '13540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1077, 9, 10, NULL, 'Jardines del Llano', '13550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1078, 9, 10, NULL, 'Potrero del Llano', '13550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1079, 9, 10, NULL, 'Villa Tlatempa', '13559', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1080, 9, 10, NULL, 'La Guadalupe', '13060', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1081, 9, 10, NULL, 'La Guadalupe', '13100', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1082, 9, 10, NULL, 'La Poblanita', '13119', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1083, 9, 10, NULL, 'Teozoma', '13123', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1084, 9, 10, NULL, 'San Francisco Apolocalco', '13129', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1085, 9, 10, NULL, 'La Draga', '13273', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1086, 9, 10, NULL, 'Santiago Centro', '13300', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1087, 9, 10, NULL, 'Santa Ana Poniente', '13300', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1088, 9, 10, NULL, 'Zapotitla', '13310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1089, 9, 10, NULL, 'Santa Ana Sur', '13360', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1090, 9, 10, NULL, 'Santiago Sur', '13360', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1091, 9, 10, NULL, 'López Portillo', '13410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1092, 9, 10, NULL, 'La Soledad', '13508', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1093, 9, 10, NULL, 'Ampliación La Conchita', '13545', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1094, 9, 10, NULL, 'San Bartolomé', '13600', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1095, 9, 10, NULL, 'San Juan', '13030', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1096, 9, 10, NULL, 'Geovillas de Xochimilco', '13063', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1097, 9, 10, NULL, 'La Magdalena', '13070', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1098, 9, 10, NULL, 'San Miguel', '13070', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1099, 9, 10, NULL, 'Quiahuatla', '13090', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1100, 9, 10, NULL, 'Miguel Hidalgo', '13200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1101, 9, 10, NULL, 'Los Olivos', '13210', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1102, 9, 10, NULL, 'Santa Ana Norte', '13300', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1103, 9, 10, NULL, 'La Estación', '13319', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1104, 9, 10, NULL, 'Guadalupe Tlaltenco', '13450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1105, 9, 10, NULL, 'Francisco Villa', '13520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1106, 9, 10, NULL, 'Olivar Santa María', '13546', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1107, 9, 10, NULL, 'Peña Alta', '13549', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1108, 9, 10, NULL, 'Los Reyes', '13610', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1109, 9, 10, NULL, 'Santa Cruz', '13625', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1110, 9, 10, NULL, 'San Nicolás Tetelco', '13700', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1111, 9, 11, NULL, 'Parque del Pedregal', '14010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1112, 9, 11, NULL, 'Villa Olímpica', '14020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1113, 9, 11, NULL, 'Isidro Fabela', '14030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1114, 9, 11, NULL, 'Ampliación Isidro Fabela', '14039', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1115, 9, 11, NULL, 'Paseos de Mendoza', '14070', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1116, 9, 11, NULL, 'Pedregal Chichicaspatl', '14108', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1117, 9, 11, NULL, 'Tlalpan', '14000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1118, 9, 11, NULL, 'Luis Donaldo Colosio', '14038', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1119, 9, 11, NULL, 'Ampliación Fuentes del Pedregal', '14110', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1120, 9, 11, NULL, 'Popular Santa Teresa', '14160', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1121, 9, 11, NULL, 'Los Encinos', '14239', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1122, 9, 11, NULL, 'Zacayucan Peña Pobre', '14266', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1123, 9, 11, NULL, 'Vergel Coapa', '14320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1124, 9, 11, NULL, 'Prado Coapa 1A Sección', '14350', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1125, 9, 11, NULL, 'Prado Coapa 2A Sección', '14357', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1126, 9, 11, NULL, 'Prado Coapa 3A Sección', '14357', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1127, 9, 11, NULL, 'Residencial Villa Prado Coapa', '14358', 'Conjunto habitacional', '');
INSERT INTO `sys_localidades` VALUES (1128, 9, 11, NULL, 'Arboledas del Sur', '14376', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1129, 9, 11, NULL, 'Los Volcanes', '14440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1130, 9, 11, NULL, 'Colinas del Bosque', '14608', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1131, 9, 11, NULL, 'Chimalcoyoc', '14630', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1132, 9, 11, NULL, 'Rinconada El Mirador', '14647', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1133, 9, 11, NULL, 'San Pedro Mártir', '14650', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1134, 9, 11, NULL, 'Heróico Colegio Militar', '14653', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1135, 9, 11, NULL, 'Toriello Guerra', '14050', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1136, 9, 11, NULL, 'Torres Tlalpan FOVISSSTE', '14098', 'Conjunto habitacional', '');
INSERT INTO `sys_localidades` VALUES (1137, 9, 11, NULL, 'Parque Nacional Bosque del Pedregal', '14219', 'Equipamiento', '');
INSERT INTO `sys_localidades` VALUES (1138, 9, 11, NULL, 'Cultura Maya', '14230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1139, 9, 11, NULL, 'Rinconada Coapa 2A Sección', '14325', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1140, 9, 11, NULL, 'San Bartolo El Chico', '14380', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1141, 9, 11, NULL, 'Arenal de Guadalupe', '14389', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1142, 9, 11, NULL, 'Nuevo Renacimiento de Axalco', '14408', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1143, 9, 11, NULL, 'Mesa de los Hornos', '14420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1144, 9, 11, NULL, 'Tepeximilpa la Paz', '14427', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1145, 9, 11, NULL, 'El Mirador 3A Sección', '14449', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1146, 9, 11, NULL, 'Arenal Tepepan', '14610', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1147, 9, 11, NULL, 'Valle de Tepepan', '14646', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1148, 9, 11, NULL, 'Juventud Unida', '14647', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1149, 9, 11, NULL, 'Santo Tomas Ajusco', '14710', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1150, 9, 11, NULL, 'Lomas de Cuilotepec', '14730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1151, 9, 11, NULL, 'Chimilli', '14749', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1152, 9, 11, NULL, 'Cuitlahuac', '14039', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1153, 9, 11, NULL, 'Cantera Puente de Piedra', '14040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1154, 9, 11, NULL, 'Pueblo Quieto', '14040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1155, 9, 11, NULL, 'Comuneros de Santa Úrsula', '14049', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1156, 9, 11, NULL, 'San Fernando', '14070', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1157, 9, 11, NULL, 'San Pedro Apóstol', '14070', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1158, 9, 11, NULL, 'Rincón del Pedregal', '14120', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1159, 9, 11, NULL, 'Residencial Pedregal Picacho', '14129', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1160, 9, 11, NULL, 'Colinas del Ajusco', '14208', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1161, 9, 11, NULL, 'Cuchilla de Padierna', '14220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1162, 9, 11, NULL, 'Miguel Hidalgo 2A Sección', '14250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1163, 9, 11, NULL, 'Miguel Hidalgo 1A Sección', '14260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1164, 9, 11, NULL, 'Vergel Tlalpan', '14310', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1165, 9, 11, NULL, 'Vergel del Sur', '14340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1166, 9, 11, NULL, 'Villa Lázaro Cárdenas', '14370', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1167, 9, 11, NULL, 'San Andrés Totoltepec', '14400', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1168, 9, 11, NULL, 'Fuentes Brotantes', '14410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1169, 9, 11, NULL, 'Santísima Trinidad', '14429', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1170, 9, 11, NULL, 'Dolores Tlali', '14654', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1171, 9, 11, NULL, 'Lomas de Tepemecatl', '14735', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1172, 9, 11, NULL, 'Mirador II', '14748', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1173, 9, 11, NULL, 'Rancho Viejo', '14750', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1174, 9, 11, NULL, 'Parres El Guarda', '14900', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1175, 9, 11, NULL, 'Zacatón', '14734', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1176, 9, 11, NULL, '2 de Octubre', '14739', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1177, 9, 11, NULL, 'San Jorge', '14790', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1178, 9, 11, NULL, 'Peña Pobre', '14060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1179, 9, 11, NULL, 'Pedregal de San Nicolás 2A Sección', '14100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1180, 9, 11, NULL, 'Pedregal de San Nicolás 5A Sección', '14100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1181, 9, 11, NULL, 'Pedregal del Lago', '14110', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1182, 9, 11, NULL, 'Jardines del Ajusco', '14200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1183, 9, 11, NULL, 'Six Flags (Reino Aventura)', '14219', 'Equipamiento', '');
INSERT INTO `sys_localidades` VALUES (1184, 9, 11, NULL, 'Miguel Hidalgo 3A Sección', '14250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1185, 9, 11, NULL, 'La Lonja', '14268', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1186, 9, 11, NULL, 'Residencial Miramontes', '14300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1187, 9, 11, NULL, 'Real del Sur', '14308', 'Condominio', '');
INSERT INTO `sys_localidades` VALUES (1188, 9, 11, NULL, 'Lotería Nacional', '14328', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1189, 9, 11, NULL, 'Residencial Hacienda Coapa', '14330', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1190, 9, 11, NULL, 'Sauzales Cebadales', '14334', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1191, 9, 11, NULL, 'San Lorenzo Huipulco', '14370', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1192, 9, 11, NULL, 'Hacienda San Juan', '14377', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1193, 9, 11, NULL, 'Guadalupe', '14388', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1194, 9, 11, NULL, 'Tecorral', '14409', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1195, 9, 11, NULL, 'Texcaltenco', '14426', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1196, 9, 11, NULL, 'San Juan Tepeximilpa', '14427', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1197, 9, 11, NULL, 'El Truenito', '14430', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1198, 9, 11, NULL, 'Rómulo Sánchez Mireles', '14070', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1199, 9, 11, NULL, 'La Joya', '14090', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1200, 9, 11, NULL, 'Pedregal de San Nicolás 3A Sección', '14100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1201, 9, 11, NULL, 'Pedregal de San Nicolás 4A Sección', '14100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1202, 9, 11, NULL, 'Cruz del Farol', '14248', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1203, 9, 11, NULL, 'La Fama', '14269', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1204, 9, 11, NULL, 'Paraje 38', '14275', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1205, 9, 11, NULL, 'Residencial Acoxpa', '14300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1206, 9, 11, NULL, 'Granjas Coapa', '14330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1207, 9, 11, NULL, 'Rinconada Coapa 1A Sección', '14330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1208, 9, 11, NULL, 'Residencial Villa Coapa', '14390', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1209, 9, 11, NULL, 'Villa Coapa', '14390', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1210, 9, 11, NULL, 'Villa Royale', '14399', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1211, 9, 11, NULL, 'Tlalpuente', '14460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1212, 9, 11, NULL, 'San Miguel Topilejo', '14500', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1213, 9, 11, NULL, 'Club de Golf México', '14620', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1214, 9, 11, NULL, 'Fuentes de Tepepan', '14643', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1215, 9, 11, NULL, 'Valle Verde o Lomas Verdes', '14655', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1216, 9, 11, NULL, 'Mirador del Valle', '14658', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1217, 9, 11, NULL, 'Lomas de Padierna Sur', '14740', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1218, 9, 11, NULL, 'Mirador I', '14748', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1219, 9, 11, NULL, 'Del Niño Jesús', '14080', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1220, 9, 11, NULL, 'Chichicaspatl', '14108', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1221, 9, 11, NULL, 'Lomas del Pedregal Framboyanes', '14150', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1222, 9, 11, NULL, 'Héroes de Padierna', '14200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1223, 9, 11, NULL, 'Torres de Padierna', '14209', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1224, 9, 11, NULL, 'Jardines en la Montaña', '14210', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1225, 9, 11, NULL, 'Lomas del Pedregal', '14220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1226, 9, 11, NULL, 'Lomas de Padierna', '14240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1227, 9, 11, NULL, 'Lomas Hidalgo', '14240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1228, 9, 11, NULL, 'De Caramagüey', '14267', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1229, 9, 11, NULL, 'Nueva Oriental Coapa', '14300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1230, 9, 11, NULL, 'Ex Hacienda Coapa', '14308', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1231, 9, 11, NULL, 'Urbano Coapa', '14337', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1232, 9, 11, NULL, 'Vergel de Coyoacán', '14340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1233, 9, 11, NULL, 'Residencial Chimali', '14370', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1234, 9, 11, NULL, 'Rincón de San Juan', '14378', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1235, 9, 11, NULL, 'A.M.S.A', '14380', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1236, 9, 11, NULL, 'Rancho los Colorines', '14386', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1237, 9, 11, NULL, 'Ex Hacienda San Juan de Dios', '14387', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1238, 9, 11, NULL, 'Narciso Mendoza', '14390', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1239, 9, 11, NULL, 'Cumbres de Tepetongo', '14420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1240, 9, 11, NULL, 'Tlaxcaltenco la Mesa', '14426', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1241, 9, 11, NULL, 'Plan de Ayala', '14470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1242, 9, 11, NULL, 'La Quinta', '14520', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1243, 9, 11, NULL, 'Valle Escondido', '14600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1244, 9, 11, NULL, 'Las Tórtolas', '14609', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1245, 9, 11, NULL, 'San Buenaventura', '14629', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1246, 9, 11, NULL, 'San Pedro Mártir FOVISSSTE', '14639', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1247, 9, 11, NULL, 'Tlalmille', '14657', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1248, 9, 11, NULL, 'Bosques del Pedregal', '14738', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1249, 9, 11, NULL, 'El Charco', '14780', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1250, 9, 11, NULL, 'Tlalpan Centro', '14000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1251, 9, 11, NULL, 'Pedregal de las Águilas', '14439', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1252, 9, 11, NULL, 'El Mirador 1A Sección', '14449', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1253, 9, 11, NULL, 'Atocpa', '14456', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1254, 9, 11, NULL, 'Ejidos de San Pedro Mártir', '14640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1255, 9, 11, NULL, 'San Miguel Ajusco', '14700', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1256, 9, 11, NULL, 'Belisario Domínguez Sección XVI', '14080', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1257, 9, 11, NULL, 'Solidaridad', '14273', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1258, 9, 11, NULL, 'Verano', '14276', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1259, 9, 11, NULL, 'Villa Valbadena', '14328', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1260, 9, 11, NULL, 'Villa Cuemanco INFONAVIT', '14336', 'Conjunto habitacional', '');
INSERT INTO `sys_localidades` VALUES (1261, 9, 11, NULL, 'Fuerza Armada de México', '14338', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1262, 9, 11, NULL, 'Jardines Villa Coapa', '14356', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1263, 9, 11, NULL, 'Villa Cuemanco', '14360', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1264, 9, 11, NULL, 'Magisterial Coapa', '14360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1265, 9, 11, NULL, 'Santa Úrsula Xitla', '14420', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1266, 9, 11, NULL, 'Tlalcoligia', '14430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1267, 9, 11, NULL, 'Pedregal de Santa Úrsula Xitla', '14438', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1268, 9, 11, NULL, 'El Mirador 2A Sección', '14449', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1269, 9, 11, NULL, 'Viveros Coatectlán', '14479', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1270, 9, 11, NULL, 'La Magdalena Petlacalco', '14480', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1271, 9, 11, NULL, 'Estación Ajusco', '14529', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1272, 9, 11, NULL, 'Estrella Mora', '14550', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1273, 9, 11, NULL, 'Villa Tlalpan', '14630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1274, 9, 11, NULL, 'Movimiento Organizado de Tlalpan', '14647', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1275, 9, 11, NULL, 'La Magueyera', '14654', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1276, 9, 11, NULL, 'Belvedere Ajusco', '14720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1277, 9, 11, NULL, 'San Nicolás 2', '14735', 'Campamento', '');
INSERT INTO `sys_localidades` VALUES (1278, 9, 11, NULL, 'Vistas del Pedregal', '14737', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1279, 9, 11, NULL, 'Héroes de 1910', '14760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1280, 9, 11, NULL, 'Pedregal de San Nicolás 1A Sección', '14100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1281, 9, 11, NULL, 'Lic. Emilio Portes Gil \"PEMEX\"', '14130', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1282, 9, 11, NULL, 'Fuentes del Pedregal', '14140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1283, 9, 11, NULL, 'Miguel Hidalgo 4A Sección', '14250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1284, 9, 11, NULL, 'Miguel Hidalgo', '14250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1285, 9, 11, NULL, 'El Capulín', '14260', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1286, 9, 11, NULL, 'Primavera', '14270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1287, 9, 11, NULL, 'Villa del Sur', '14307', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1288, 9, 11, NULL, 'Belisario Domínguez', '14310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1289, 9, 11, NULL, 'Floresta Coyoacán', '14310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1290, 9, 11, NULL, 'Tenorios', '14326', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1291, 9, 11, NULL, 'Villa del Puente', '14335', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1292, 9, 11, NULL, 'Magisterial', '14360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1293, 9, 11, NULL, 'Rinconada Las Hadas', '14390', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1294, 9, 11, NULL, 'Divisadero', '14406', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1295, 9, 11, NULL, 'Cantera', '14428', 'Fraccionamiento', '');
INSERT INTO `sys_localidades` VALUES (1296, 9, 11, NULL, 'La Palma', '14476', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1297, 9, 11, NULL, 'San Miguel Xicalco', '14490', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1298, 9, 11, NULL, 'María Esther Zuno de Echeverría', '14659', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1299, 9, 12, NULL, 'Las Peritas', '16010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1300, 9, 12, NULL, 'Ampliación Tepepan', '16029', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1301, 9, 12, NULL, 'La Noria', '16030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1302, 9, 12, NULL, 'Jardines del Sur', '16050', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1303, 9, 12, NULL, 'El Rosario', '16070', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1304, 9, 12, NULL, 'San Esteban', '16080', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1305, 9, 12, NULL, 'La Concha', '16210', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1306, 9, 12, NULL, 'Santa María Nativitas', '16450', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1307, 9, 12, NULL, 'Santa Cruz Acalpixca', '16500', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1308, 9, 12, NULL, 'Las Cruces', '16530', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1309, 9, 12, NULL, 'Los Reyes', '16605', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1310, 9, 12, NULL, 'San José', '16620', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1311, 9, 12, NULL, 'San Felipe', '16770', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1312, 9, 12, NULL, 'Bosque Residencial del Sur', '16010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1313, 9, 12, NULL, 'Pblo. Stgo.Tepalcatlalpan, U. H. Rinconada del Sur', '16059', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1314, 9, 12, NULL, 'El Mirador', '16060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1315, 9, 12, NULL, 'San Cristóbal', '16080', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1316, 9, 12, NULL, 'Apatlaco', '16513', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1317, 9, 12, NULL, 'Del Puente', '16513', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1318, 9, 12, NULL, 'San Andrés', '16604', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1319, 9, 12, NULL, 'San Antonio', '16607', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1320, 9, 12, NULL, 'Niños Héroes', '16614', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1321, 9, 12, NULL, 'San Isidro', '16739', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1322, 9, 12, NULL, 'Calyequita', '16750', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1323, 9, 12, NULL, 'Cerrillos Primera Sección', '16780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1324, 9, 12, NULL, 'San Juan Tepepan', '16020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1325, 9, 12, NULL, 'Huichapan', '16030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1326, 9, 12, NULL, 'Mercado de Flores Plantas y Hortalizas', '16036', 'Zona comercial', '');
INSERT INTO `sys_localidades` VALUES (1327, 9, 12, NULL, 'La Asunción', '16040', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1328, 9, 12, NULL, 'Santa Cruz Xochitepec', '16100', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1329, 9, 12, NULL, 'La Cañada', '16310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1330, 9, 12, NULL, 'El Jazmín', '16428', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1331, 9, 12, NULL, 'Pocitos', '16443', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1332, 9, 12, NULL, 'La Candelaria', '16609', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1333, 9, 12, NULL, 'San Luis Tlaxialtemalco', '16610', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1334, 9, 12, NULL, 'La Asunción', '16615', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1335, 9, 12, NULL, 'San Sebastián', '16617', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1336, 9, 12, NULL, 'San Andrés Ahuayucan', '16810', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1337, 9, 12, NULL, 'Santa Cruz Chavarrieta', '16840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1338, 9, 12, NULL, 'Santa Cruz de Guadalupe', '16860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1339, 9, 12, NULL, 'San Juan', '16000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1340, 9, 12, NULL, 'Paseos del Sur', '16010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1341, 9, 12, NULL, 'Santa María Tepepan', '16020', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1342, 9, 12, NULL, 'San Lorenzo La Cebada', '16035', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1343, 9, 12, NULL, 'Ampliación San Marcos Norte', '16038', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1344, 9, 12, NULL, 'San Lorenzo', '16040', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1345, 9, 12, NULL, 'Belén', '16070', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1346, 9, 12, NULL, 'San Pedro', '16090', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1347, 9, 12, NULL, 'Tablas de San Lorenzo', '16090', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1348, 9, 12, NULL, 'San Jerónimo', '16420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1349, 9, 12, NULL, 'La Gallera', '16514', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1350, 9, 12, NULL, 'Calpulco', '16514', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1351, 9, 12, NULL, 'Ahualapa', '16533', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1352, 9, 12, NULL, 'San Juan', '16629', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1353, 9, 12, NULL, 'Tierra Nueva', '16050', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1354, 9, 12, NULL, 'La Santísima', '16080', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1355, 9, 12, NULL, 'Xaltocan', '16090', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1356, 9, 12, NULL, 'Xochipilli', '16430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1357, 9, 12, NULL, 'Año de Juárez', '16440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1358, 9, 12, NULL, 'Ampliación Nativitas', '16459', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1359, 9, 12, NULL, '3 de Mayo', '16606', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1360, 9, 12, NULL, 'Guadalupita', '16740', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1361, 9, 12, NULL, 'Santiaguito', '16776', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1362, 9, 12, NULL, 'El Mirador', '16776', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1363, 9, 12, NULL, 'Cristo Rey', '16780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1364, 9, 12, NULL, 'Cerrillos Segunda Sección', '16780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1365, 9, 12, NULL, 'Nativitas', '16797', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1366, 9, 12, NULL, 'Santa Inés', '16810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1367, 9, 12, NULL, 'Del Carmen', '16720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1368, 9, 12, NULL, 'Cerrillos Tercera Sección', '16780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1369, 9, 12, NULL, 'Las Mesitas', '16799', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1370, 9, 12, NULL, 'Chapultepec', '16850', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1371, 9, 12, NULL, 'Santa Cecilia Tepetlapa', '16880', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1372, 9, 12, NULL, 'San Antonio', '16000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1373, 9, 12, NULL, 'Potrero de San Bernardino', '16030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1374, 9, 12, NULL, 'San Marcos', '16050', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1375, 9, 12, NULL, 'San Diego', '16080', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1376, 9, 12, NULL, 'Rancho Tejomulco', '16429', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1377, 9, 12, NULL, 'La Planta', '16520', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1378, 9, 12, NULL, 'Las Flores', '16530', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1379, 9, 12, NULL, 'Valle de Santa María', '16550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1380, 9, 12, NULL, 'Quirino Mendoza', '16710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1381, 9, 12, NULL, 'Las Animas', '16749', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1382, 9, 12, NULL, 'San Mateo Xalpa', '16800', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1383, 9, 12, NULL, 'La Concepción Tlacoapa', '16000', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1384, 9, 12, NULL, 'San Bartolo El Chico', '16010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1385, 9, 12, NULL, 'Ampliación La Noria', '16030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1386, 9, 12, NULL, '18', '16034', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1387, 9, 12, NULL, 'San Lucas Xochimanca', '16300', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1388, 9, 12, NULL, 'San Lucas Oriente', '16320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1389, 9, 12, NULL, 'Texmic', '16340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1390, 9, 12, NULL, 'San Lorenzo Atemoaya', '16400', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1391, 9, 12, NULL, 'Lomas de Nativitas', '16457', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1392, 9, 12, NULL, 'Tetitla', '16514', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1393, 9, 12, NULL, 'Santa Cecilia', '16616', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1394, 9, 12, NULL, 'La Guadalupana', '16629', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1395, 9, 12, NULL, 'San Juan Minas', '16640', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1396, 9, 12, NULL, 'Rosario Tlali', '16810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1397, 9, 12, NULL, 'El Calvario', '16813', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1398, 9, 12, NULL, 'Rinconada Coapa', '16035', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1399, 9, 12, NULL, 'La Guadalupita', '16070', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1400, 9, 12, NULL, 'Santa Crucita', '16070', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1401, 9, 12, NULL, 'Santiago Tepalcatlalpan', '16200', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1402, 9, 12, NULL, 'Lomas de Tonalco', '16410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1403, 9, 12, NULL, 'San Gregorio Atlapulco', '16600', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1404, 9, 12, NULL, 'San Juan Moyotepec', '16630', 'Barrio', '');
INSERT INTO `sys_localidades` VALUES (1405, 9, 12, NULL, 'El Sacrificio', '16780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1406, 9, 12, NULL, 'San Francisco Tlalnepantla', '16900', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1407, 9, 13, NULL, 'Del Valle Centro', '3100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1408, 9, 13, NULL, 'General Pedro María Anaya', '3340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1409, 9, 13, NULL, 'Postal', '3410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1410, 9, 13, NULL, 'Josefa Ortiz de Domínguez', '3430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1411, 9, 13, NULL, 'Villa de Cortes', '3530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1412, 9, 13, NULL, 'Américas Unidas', '3610', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1413, 9, 13, NULL, 'San Pedro de los Pinos', '3800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1414, 9, 13, NULL, 'Insurgentes San Borja', '3100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1415, 9, 13, NULL, 'Actipan', '3230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1416, 9, 13, NULL, 'Portales Sur', '3300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1417, 9, 13, NULL, 'Santa Cruz Atoyac', '3310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1418, 9, 13, NULL, 'Niños Héroes', '3440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1419, 9, 13, NULL, 'Iztaccihuatl', '3520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1420, 9, 13, NULL, 'Zacahuitzco', '3550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1421, 9, 13, NULL, 'Del Lago', '3640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1422, 9, 13, NULL, 'Letrán Valle', '3650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1423, 9, 13, NULL, '8 de Agosto', '3820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1424, 9, 13, NULL, 'Mixcoac', '3910', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1425, 9, 13, NULL, 'Piedad Narvarte', '3000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1426, 9, 13, NULL, 'Atenor Salas', '3010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1427, 9, 13, NULL, 'Tlacoquemécatl', '3200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1428, 9, 13, NULL, 'Álamos', '3400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1429, 9, 13, NULL, 'Nativitas', '3500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1430, 9, 13, NULL, 'Ermita', '3590', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1431, 9, 13, NULL, 'Ciudad de los Deportes', '3710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1432, 9, 13, NULL, 'Acacias', '3240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1433, 9, 13, NULL, 'Moderna', '3510', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1434, 9, 13, NULL, 'Del Carmen', '3540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1435, 9, 13, NULL, 'Periodista', '3620', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1436, 9, 13, NULL, 'San Juan', '3730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1437, 9, 13, NULL, 'Extremadura Insurgentes', '3740', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1438, 9, 13, NULL, 'Del Valle Norte', '3103', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1439, 9, 13, NULL, 'Del Valle Sur', '3104', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1440, 9, 13, NULL, 'Portales Norte', '3303', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1441, 9, 13, NULL, 'Residencial Emperadores', '3320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1442, 9, 13, NULL, 'Xoco', '3330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1443, 9, 13, NULL, 'Nápoles', '3810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1444, 9, 13, NULL, 'San José Insurgentes', '3900', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1445, 9, 13, NULL, 'Crédito Constructor', '3940', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1446, 9, 13, NULL, 'Narvarte Poniente', '3020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1447, 9, 13, NULL, 'Narvarte Oriente', '3023', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1448, 9, 13, NULL, 'Miguel Alemán', '3420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1449, 9, 13, NULL, 'Albert', '3560', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1450, 9, 13, NULL, 'Portales Oriente', '3570', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1451, 9, 13, NULL, 'Miravalle', '3580', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1452, 9, 13, NULL, 'Independencia', '3630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1453, 9, 13, NULL, 'San Simón Ticumac', '3660', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1454, 9, 13, NULL, 'Santa María Nonoalco', '3700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1455, 9, 13, NULL, 'Insurgentes Mixcoac', '3920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1456, 9, 13, NULL, 'Merced Gómez', '3930', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1457, 9, 13, NULL, 'Vértiz Narvarte', '3600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1458, 9, 13, NULL, 'Nochebuena', '3720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1459, 9, 13, NULL, 'Ampliación Nápoles', '3840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1460, 9, 14, NULL, 'Centro (Área 2)', '6010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1461, 9, 14, NULL, 'Felipe Pescador', '6280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1462, 9, 14, NULL, 'Santa María la Ribera', '6400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1463, 9, 14, NULL, 'Roma Norte', '6700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1464, 9, 14, NULL, 'Buenos Aires', '6780', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1465, 9, 14, NULL, 'Asturias', '6850', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1466, 9, 14, NULL, 'Vista Alegre', '6860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1467, 9, 14, NULL, 'Ampliación Asturias', '6890', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1468, 9, 14, NULL, 'Centro (Área 3)', '6020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1469, 9, 14, NULL, 'Tabacalera', '6030', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1470, 9, 14, NULL, 'Buenavista', '6350', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1471, 9, 14, NULL, 'Tránsito', '6820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1472, 9, 14, NULL, 'Centro (Área 8)', '6080', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1473, 9, 14, NULL, 'Atlampa', '6450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1474, 9, 14, NULL, 'San Rafael', '6470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1475, 9, 14, NULL, 'Esperanza', '6840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1476, 9, 14, NULL, 'Paulino Navarro', '6870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1477, 9, 14, NULL, 'Centro (Área 6)', '6060', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1478, 9, 14, NULL, 'Centro (Área 7)', '6070', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1479, 9, 14, NULL, 'Condesa', '6140', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1480, 9, 14, NULL, 'Hipódromo Condesa', '6170', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1481, 9, 14, NULL, 'Maza', '6270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1482, 9, 14, NULL, 'Santa María Insurgentes', '6430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1483, 9, 14, NULL, 'Roma Sur', '6760', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1484, 9, 14, NULL, 'Obrera', '6800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1485, 9, 14, NULL, 'Algarin', '6880', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1486, 9, 14, NULL, 'San Simón Tolnáhuac', '6920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1487, 9, 14, NULL, 'Centro (Área 1)', '6000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1488, 9, 14, NULL, 'Centro (Área 5)', '6050', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1489, 9, 14, NULL, 'Centro (Área 9)', '6090', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1490, 9, 14, NULL, 'Peralvillo', '6220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1491, 9, 14, NULL, 'Valle Gómez', '6240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1492, 9, 14, NULL, 'Ex-Hipódromo de Peralvillo', '6250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1493, 9, 14, NULL, 'Cuauhtémoc', '6500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1494, 9, 14, NULL, 'Centro (Área 4)', '6040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1495, 9, 14, NULL, 'Hipódromo', '6100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1496, 9, 14, NULL, 'Morelos', '6200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1497, 9, 14, NULL, 'Guerrero', '6300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1498, 9, 14, NULL, 'Juárez', '6600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1499, 9, 14, NULL, 'Doctores', '6720', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1500, 9, 14, NULL, 'Nonoalco Tlatelolco', '6900', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1501, 9, 15, NULL, 'Hermanos Serdán', '11220', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1502, 9, 15, NULL, 'Ignacio Manuel Altamirano', '11240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1503, 9, 15, NULL, 'Argentina Antigua', '11270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1504, 9, 15, NULL, 'Verónica Anzures', '11300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1505, 9, 15, NULL, 'Lomas Hermosa', '11200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1506, 9, 15, NULL, 'Lomas de Sotelo', '11200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1507, 9, 15, NULL, 'Argentina Poniente', '11230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1508, 9, 15, NULL, 'San Joaquín', '11260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1509, 9, 15, NULL, 'San Diego Ocoyoacac', '11290', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1510, 9, 15, NULL, 'Santo Tomas', '11340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1511, 9, 15, NULL, 'Agricultura', '11360', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1512, 9, 15, NULL, 'Ampliación Granada', '11529', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1513, 9, 15, NULL, 'Lomas de Chapultepec VIII Sección', '11000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1514, 9, 15, NULL, 'Lomas de Chapultepec VI Sección', '11000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1515, 9, 15, NULL, 'Mariano Escobedo', '11310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1516, 9, 15, NULL, 'Un Hogar Para Nosotros', '11330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1517, 9, 15, NULL, 'Peralitos', '11450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1518, 9, 15, NULL, 'Lago Norte', '11460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1519, 9, 15, NULL, 'Cuauhtémoc Pensil', '11490', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1520, 9, 15, NULL, 'Manuel Avila Camacho', '11610', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1521, 9, 15, NULL, 'Bosque de las Lomas', '11700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1522, 9, 15, NULL, 'Lomas Altas', '11950', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1523, 9, 15, NULL, 'Lomas de Chapultepec III Sección', '11000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1524, 9, 15, NULL, 'Bosque de Chapultepec II Sección', '11100', 'Equipamiento', '');
INSERT INTO `sys_localidades` VALUES (1525, 9, 15, NULL, 'México Tacuba', '11239', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1526, 9, 15, NULL, 'Pensil Norte', '11430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1527, 9, 15, NULL, 'San Juanico', '11440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1528, 9, 15, NULL, 'Dos Lagos', '11460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1529, 9, 15, NULL, 'Los Manzanos', '11460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1530, 9, 15, NULL, 'Irrigación', '11500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1531, 9, 15, NULL, 'Bosque de Chapultepec I Sección', '11580', 'Equipamiento', '');
INSERT INTO `sys_localidades` VALUES (1532, 9, 15, NULL, 'Escandón I Sección', '11800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1533, 9, 15, NULL, 'América', '11820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1534, 9, 15, NULL, 'Ahuehuetes Anáhuac', '11450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1535, 9, 15, NULL, 'Unidad Legaria IMSS', '11479', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1536, 9, 15, NULL, 'Pensil Sur', '11490', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1537, 9, 15, NULL, 'Anzures', '11590', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1538, 9, 15, NULL, 'Daniel Garza', '11830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1539, 9, 15, NULL, 'Observatorio', '11860', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1540, 9, 15, NULL, 'Tacubaya', '11870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1541, 9, 15, NULL, 'Lomas de Bezares', '11910', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1542, 9, 15, NULL, '10 de Abril', '11250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1543, 9, 15, NULL, 'México Nuevo', '11260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1544, 9, 15, NULL, 'Anáhuac I Sección', '11320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1545, 9, 15, NULL, 'Plutarco Elías Calles', '11350', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1546, 9, 15, NULL, 'Popotla', '11400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1547, 9, 15, NULL, 'Ventura Pérez de Alva', '11430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1548, 9, 15, NULL, 'Lago Sur', '11460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1549, 9, 15, NULL, 'Deportivo Pensil', '11470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1550, 9, 15, NULL, 'Francisco I Madero', '11480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1551, 9, 15, NULL, 'Popo', '11480', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1552, 9, 15, NULL, 'Residencial Militar', '11600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1553, 9, 15, NULL, 'Campo Militar 1', '11619', 'Equipamiento', '');
INSERT INTO `sys_localidades` VALUES (1554, 9, 15, NULL, 'Ampliación Daniel Garza', '11840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1555, 9, 15, NULL, 'Lomas de Chapultepec IV Sección', '11000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1556, 9, 15, NULL, 'Lomas de Chapultepec V Sección', '11000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1557, 9, 15, NULL, 'Lomas de Chapultepec VII Sección', '11000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1558, 9, 15, NULL, 'Bosque de Chapultepec III Sección', '11100', 'Equipamiento', '');
INSERT INTO `sys_localidades` VALUES (1559, 9, 15, NULL, 'Residencia Oficial de los Pinos', '11109', 'Gran usuario', '');
INSERT INTO `sys_localidades` VALUES (1560, 9, 15, NULL, 'San Lorenzo Tlaltenango', '11210', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1561, 9, 15, NULL, 'Huíchapan', '11290', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1562, 9, 15, NULL, 'Nextitla', '11420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1563, 9, 15, NULL, 'Reforma Pensil', '11440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1564, 9, 15, NULL, 'Modelo Pensil', '11450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1565, 9, 15, NULL, '5 de Mayo', '11470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1566, 9, 15, NULL, 'Reforma Social', '11650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1567, 9, 15, NULL, 'San Miguel Chapultepec II Sección', '11850', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1568, 9, 15, NULL, 'Lomas de Reforma', '11930', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1569, 9, 15, NULL, 'Lomas de Chapultepec I Sección', '11000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1570, 9, 15, NULL, 'Periodista', '11220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1571, 9, 15, NULL, 'Ampliación Torre Blanca', '11289', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1572, 9, 15, NULL, 'Tlaxpana', '11370', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1573, 9, 15, NULL, 'Tacuba', '11410', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1574, 9, 15, NULL, 'Polanco I Sección', '11510', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1575, 9, 15, NULL, 'Granada', '11520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1576, 9, 15, NULL, 'Hospital Central Militar', '11649', 'Gran usuario', '');
INSERT INTO `sys_localidades` VALUES (1577, 9, 15, NULL, 'San Miguel Chapultepec I Sección', '11850', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1578, 9, 15, NULL, 'Lomas de Chapultepec II Sección', '11000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1579, 9, 15, NULL, 'Molino del Rey', '11040', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1580, 9, 15, NULL, 'Torre Blanca', '11280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1581, 9, 15, NULL, 'Anáhuac II Sección', '11320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1582, 9, 15, NULL, 'Legaria', '11410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1583, 9, 15, NULL, 'Ampliación Popo', '11489', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1584, 9, 15, NULL, 'Polanco II Sección', '11530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1585, 9, 15, NULL, 'Polanco III Sección', '11540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1586, 9, 15, NULL, 'Polanco IV Sección', '11550', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1587, 9, 15, NULL, 'Polanco V Sección', '11560', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1588, 9, 15, NULL, 'Escandón II Sección', '11800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1589, 9, 15, NULL, '16 de Septiembre', '11810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1590, 9, 15, NULL, 'Real de las Lomas', '11920', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1591, 9, 16, NULL, 'Janitzio', '15200', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1592, 9, 16, NULL, '10 de Mayo', '15290', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1593, 9, 16, NULL, 'Azteca', '15320', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1594, 9, 16, NULL, 'Ampliación Penitenciaria', '15350', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1595, 9, 16, NULL, 'Ampliación Simón Bolívar', '15420', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1596, 9, 16, NULL, 'Aeronáutica Militar', '15970', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1597, 9, 16, NULL, 'Popular Rastro', '15220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1598, 9, 16, NULL, 'Michoacana', '15240', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1599, 9, 16, NULL, 'Morelos', '15270', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1600, 9, 16, NULL, 'Cuchilla Pantitlán', '15610', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1601, 9, 16, NULL, 'Arenal 3a Sección', '15660', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1602, 9, 16, NULL, '4 Árboles', '15730', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1603, 9, 16, NULL, 'Merced Balbuena', '15810', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1604, 9, 16, NULL, 'Artes Gráficas', '15830', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1605, 9, 16, NULL, 'Unidad Kennedy', '15950', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1606, 9, 16, NULL, '24 de Abril', '15980', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1607, 9, 16, NULL, 'Moctezuma 1a Sección', '15500', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1608, 9, 16, NULL, 'Peñón de los Baños', '15520', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1609, 9, 16, NULL, 'Industrial Puerto Aéreo', '15710', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1610, 9, 16, NULL, 'Sevilla', '15840', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1611, 9, 16, NULL, 'Ampliación Michoacana', '15250', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1612, 9, 16, NULL, '5o Tramo 20 de Noviembre', '15309', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1613, 9, 16, NULL, 'Tres Mosqueteros', '15330', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1614, 9, 16, NULL, 'Pensador Mexicano', '15510', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1615, 9, 16, NULL, 'Arenal 1a Sección', '15600', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1616, 9, 16, NULL, 'Caracol', '15630', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1617, 9, 16, NULL, 'Zaragoza Bahía', '15720', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1618, 9, 16, NULL, 'Del Parque', '15960', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1619, 9, 16, NULL, 'Puebla', '15020', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1620, 9, 16, NULL, 'Nicolás Bravo', '15220', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1621, 9, 16, NULL, 'Ampliación 20 de Noviembre', '15260', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1622, 9, 16, NULL, 'Venustiano Carranza', '15340', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1623, 9, 16, NULL, 'Escuela de Tiro', '15380', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1624, 9, 16, NULL, 'Romero Rubio', '15400', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1625, 9, 16, NULL, 'México (Lic. Benito Juárez)', '15620', 'Aeropuerto', '');
INSERT INTO `sys_localidades` VALUES (1626, 9, 16, NULL, 'Arenal 4a Sección', '15640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1627, 9, 16, NULL, 'Aviación Civil', '15740', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1628, 9, 16, NULL, 'Ampliación Aviación Civil', '15750', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1629, 9, 16, NULL, 'Magdalena Mixiuhca', '15850', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1630, 9, 16, NULL, 'General Ignacio Zaragoza', '15000', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1631, 9, 16, NULL, 'Zona Centro', '15100', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1632, 9, 16, NULL, 'Emilio Carranza', '15230', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1633, 9, 16, NULL, 'Ampliación Venustiano Carranza', '15339', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1634, 9, 16, NULL, 'Progresista', '15370', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1635, 9, 16, NULL, 'Aquiles Serdán', '15430', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1636, 9, 16, NULL, 'Damián Carmona', '15450', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1637, 9, 16, NULL, 'Revolución', '15460', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1638, 9, 16, NULL, 'Arenal Puerto Aéreo', '15640', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1639, 9, 16, NULL, 'Ampliación Caracol', '15650', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1640, 9, 16, NULL, 'Arenal 2a Sección', '15680', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1641, 9, 16, NULL, 'La Magdalena Mixiuhca', '15860', 'Pueblo', '');
INSERT INTO `sys_localidades` VALUES (1642, 9, 16, NULL, 'Aarón Sáenz', '15870', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1643, 9, 16, NULL, 'Candelaria de los Patos FOVISSSTE', '15120', 'Unidad habitacional', '');
INSERT INTO `sys_localidades` VALUES (1644, 9, 16, NULL, 'Valle Gómez', '15210', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1645, 9, 16, NULL, '20 de Noviembre', '15300', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1646, 9, 16, NULL, '7 de Julio', '15390', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1647, 9, 16, NULL, '1° de Mayo', '15440', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1648, 9, 16, NULL, 'Miguel Hidalgo', '15470', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1649, 9, 16, NULL, 'Santa Cruz Aviación', '15540', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1650, 9, 16, NULL, 'Adolfo López Mateos', '15670', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1651, 9, 16, NULL, 'Lorenzo Boturini', '15820', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1652, 9, 16, NULL, 'Valentín Gómez Farias', '15010', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1653, 9, 16, NULL, 'Penitenciaria', '15280', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1654, 9, 16, NULL, 'Felipe Ángeles', '15310', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1655, 9, 16, NULL, 'Simón Bolívar', '15410', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1656, 9, 16, NULL, 'Moctezuma 2a Sección', '15530', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1657, 9, 16, NULL, 'Federal', '15700', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1658, 9, 16, NULL, 'Jamaica', '15800', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1659, 9, 16, NULL, 'Jardín Balbuena', '15900', 'Colonia', '');
INSERT INTO `sys_localidades` VALUES (1660, 9, 16, NULL, 'Álvaro Obregón', '15990', 'Colonia', '');

-- ----------------------------
-- Table structure for sys_localidades_copy1
-- ----------------------------
DROP TABLE IF EXISTS `sys_localidades_copy1`;
CREATE TABLE `sys_localidades_copy1`  (
  `id_localidad` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `id_municipio` int(11) NOT NULL,
  `clave_localidad` int(11) NOT NULL,
  `localidad` varchar(75) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `codigo_postal` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `tipo_asentamiento` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `zona` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_localidad`) USING BTREE,
  INDEX `id_estado`(`id_estado`) USING BTREE,
  INDEX `id_municipio`(`id_municipio`) USING BTREE,
  INDEX `clave_localidad`(`clave_localidad`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 671 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_localidades_copy1
-- ----------------------------
INSERT INTO `sys_localidades_copy1` VALUES (1, 9, 1, 1, 'Azcapotzalco', '2070', 'Unidad habitacional', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (2, 9, 2, 1, 'Coyoacán', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (3, 9, 3, 1, 'Cuajimalpa de Morelos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (4, 9, 3, 10, 'Cruz Blanca', '5700', 'Colonia', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (5, 9, 3, 20, 'San Lorenzo Acopilco', '5410', 'Pueblo', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (6, 9, 3, 50, 'La Venta', '5520', 'Colonia', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (7, 9, 3, 54, 'Puerto las Cruces (Monte las Cruces)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (8, 9, 3, 55, 'Teopazulco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (9, 9, 3, 56, 'Valle de las Monjas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (10, 9, 3, 57, 'Prolongación Constitución', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (11, 9, 3, 58, 'Paraje Río Borracho', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (12, 9, 3, 59, 'El Zarco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (13, 9, 3, 60, 'La Bolsa (El Encinal)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (14, 9, 3, 62, 'Los Campesinos [Rancho]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (15, 9, 3, 63, 'Santa Rosa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (16, 9, 3, 64, 'Paraje Cerro de los Padres', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (17, 9, 3, 65, 'El Boji (San Jacinto)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (18, 9, 3, 66, 'Santa Laura [Rancho]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (19, 9, 3, 67, 'La Papa [Escuela Niños Héroes]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (20, 9, 3, 68, 'Convento del Desierto de los Leones', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (21, 9, 3, 69, 'La Troje', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (22, 9, 3, 70, 'Punta Galicia', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (23, 9, 3, 71, 'Cola de Pato', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (24, 9, 3, 73, 'Santiago Yacuitlalpan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (25, 9, 3, 74, 'Punta Ahuatenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (26, 9, 3, 75, 'Los Laureles [Rancho]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (27, 9, 4, 1, 'Gustavo A. Madero', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (28, 9, 5, 1, 'Iztacalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (29, 9, 6, 1, 'Iztapalapa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (30, 9, 7, 1, 'La Magdalena Contreras', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (31, 9, 7, 66, 'Manantiales de Monte Alegre', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (32, 9, 7, 71, 'Las Llantas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (33, 9, 7, 75, 'Segundo Dinamo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (34, 9, 7, 79, 'Las Golondrinas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (35, 9, 7, 80, 'Vivero Potreritos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (36, 9, 7, 81, 'Primer Dinamo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (37, 9, 7, 83, 'El Gavillero', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (38, 9, 7, 85, 'Camino de Sayula', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (39, 9, 7, 86, 'Coapanoaya', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (40, 9, 7, 88, 'Totolapa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (41, 9, 7, 89, 'Sehuaya', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (42, 9, 7, 90, 'Tercer Dinamo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (43, 9, 7, 92, 'Cuarto Dinamo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (44, 9, 7, 93, 'La Bodega', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (45, 9, 7, 94, 'La Campana [Rancho]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (46, 9, 7, 95, 'La Escondida', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (47, 9, 7, 96, 'La Polea', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (48, 9, 7, 97, 'Cerro Panza [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (49, 9, 7, 98, 'Valle del Tezontle', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (50, 9, 7, 99, 'Albergue Alpino Ajusco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (51, 9, 7, 100, 'Los Cedros', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (52, 9, 7, 101, 'Paraje el Rancho', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (53, 9, 7, 102, 'Los Tejocotes', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (54, 9, 7, 103, 'Paraje Ayla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (55, 9, 7, 104, 'Rancho Viejo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (56, 9, 7, 105, 'La Loma', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (57, 9, 7, 106, 'Prolongación Ermitaño', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (58, 9, 7, 107, 'Granja Soto', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (59, 9, 7, 108, 'Rincón Eslava', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (60, 9, 7, 109, 'La Cañada [Parque]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (61, 9, 7, 110, 'Paraje Chepecano', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (62, 9, 7, 111, 'Rancho Chichicaspa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (63, 9, 7, 112, 'Paraje Chichicaspa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (64, 9, 8, 1, 'Villa Milpa Alta', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (65, 9, 8, 11, 'San Antonio Tecómitl', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (66, 9, 8, 15, 'San Bartolomé Xicomulco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (67, 9, 8, 17, 'San Francisco Tecoxpa', '12700', 'Pueblo', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (68, 9, 8, 24, 'San Pablo Oztotepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (69, 9, 8, 29, 'San Pedro Atocpan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (70, 9, 8, 33, 'San Salvador Cuauhtenco', '12300', 'Pueblo', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (71, 9, 8, 36, 'Santa Ana Tlacotenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (72, 9, 8, 37, 'Cruztitla', '12100', 'Barrio', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (73, 9, 8, 39, 'Atlimeya', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (74, 9, 8, 41, 'Atoctienco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (75, 9, 8, 45, 'Los Pinos (Totulan)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (76, 9, 8, 46, 'Xoctonco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (77, 9, 8, 50, 'Cozcatlán', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (78, 9, 8, 52, 'La Herradura (Séptima Curva)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (79, 9, 8, 54, 'Zangahco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (80, 9, 8, 56, 'Hueycotzingo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (81, 9, 8, 62, 'Melhcalhca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (82, 9, 8, 66, 'Cuauhtec (El Mirador Santa Ana Tlacotenco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (83, 9, 8, 67, 'La Mora', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (84, 9, 8, 68, 'Metenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (85, 9, 8, 72, 'Tamasquititla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (86, 9, 8, 74, 'San Agustín el Alto', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (87, 9, 8, 77, 'San Marcos', '12920', 'Barrio', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (88, 9, 8, 79, 'Atlatlauco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (89, 9, 8, 81, 'Cuyucalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (90, 9, 8, 82, 'Iztauhagca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (91, 9, 8, 83, 'Tzotzomaco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (92, 9, 8, 84, 'Tlatepexco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (93, 9, 8, 87, 'Lagunilla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (94, 9, 8, 88, 'San Paocotitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (95, 9, 8, 90, 'Tlacopac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (96, 9, 8, 92, 'Tecolotzitzatzian (Piltongo)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (97, 9, 8, 93, 'Tehuisco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (98, 9, 8, 95, 'Ahuatatapanco (Metlalzintla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (99, 9, 8, 96, 'Tequianquiztunco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (100, 9, 8, 98, 'Tetexipezco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (101, 9, 8, 99, 'Tetlicuili (El Encinal)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (102, 9, 8, 100, 'Teuhtli', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (103, 9, 8, 101, 'Texcalahuitiel', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (104, 9, 8, 102, 'Texcayuca (Ojo de Agua)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (105, 9, 8, 103, 'Tezompa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (106, 9, 8, 104, 'Teziuhtepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (107, 9, 8, 105, 'Tetzumpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (108, 9, 8, 109, 'Tlaxala', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (109, 9, 8, 110, 'Ahuapapatlapa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (110, 9, 8, 112, 'Tetepanco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (111, 9, 8, 113, 'Cerrada Francisco I. Madero', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (112, 9, 8, 115, 'San José', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (113, 9, 8, 116, 'Hueytepetl', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (114, 9, 8, 117, 'Coximalipa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (115, 9, 8, 118, 'Tlaltepec (Casa del Comunero)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (116, 9, 8, 119, 'El Tulmiac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (117, 9, 8, 120, 'Corralixpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (118, 9, 8, 124, 'El Rancho', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (119, 9, 8, 126, 'Coyocalli', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (120, 9, 8, 129, 'Tlapalan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (121, 9, 8, 130, 'Retamatitla (Tepehuale)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (122, 9, 8, 131, 'Texalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (123, 9, 8, 134, 'Quepilco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (124, 9, 8, 135, 'Texococlixpa (Rancho Santa Elena)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (125, 9, 8, 136, 'Cuilotepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (126, 9, 8, 138, 'Barranca Seca (Pozo Ocho)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (127, 9, 8, 139, 'Teatlaco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (128, 9, 8, 140, 'Tlaloxtoc (Ejidos de Tecoxpa)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (129, 9, 8, 142, 'Atuzanco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (130, 9, 8, 147, 'El Potrero', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (131, 9, 8, 148, 'Jalisco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (132, 9, 8, 151, 'Miquixpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (133, 9, 8, 152, 'San Lorenzo Tlacoyucan', '12500', 'Pueblo', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (134, 9, 8, 154, 'Rinconada del Teoca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (135, 9, 8, 155, 'Tepepechimulco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (136, 9, 8, 156, 'Temoclaluca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (137, 9, 8, 158, 'Malacaxco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (138, 9, 8, 159, 'Cuatlixco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (139, 9, 8, 160, 'Tlaloxtutienco (Montesinos)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (140, 9, 8, 161, 'Coametzu', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (141, 9, 8, 163, 'Cuauhtunco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (142, 9, 8, 166, 'La Era', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (143, 9, 8, 167, 'Tepetenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (144, 9, 8, 168, 'San Isidro Cuatepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (145, 9, 8, 169, 'Xaluis (Ixtahuaca)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (146, 9, 8, 171, 'Tlacaxatl (Barrio Xochitepec)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (147, 9, 8, 172, 'Tlachachalipac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (148, 9, 8, 173, 'Camino Real a Tlaltenami', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (149, 9, 8, 174, 'Mecalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (150, 9, 8, 176, 'Zacatonco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (151, 9, 8, 178, 'Xali', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (152, 9, 8, 179, 'Texaxahuacalli', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (153, 9, 8, 180, 'Aguacasoliztintla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (154, 9, 8, 185, 'Zacaxontlipa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (155, 9, 8, 187, 'Santa Catarina (Piedra Blanca)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (156, 9, 8, 188, 'Cuauhtetec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (157, 9, 8, 189, 'Huitlalpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (158, 9, 8, 191, 'Texcolipan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (159, 9, 8, 192, 'Tetzmititla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (160, 9, 8, 195, 'Tlaxiomulco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (161, 9, 8, 197, 'Chichauhtonco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (162, 9, 8, 198, 'Tecoloxtitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (163, 9, 8, 199, 'Tapalaco (Amacapultitla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (164, 9, 8, 200, 'Teacalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (165, 9, 8, 201, 'Iztlalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (166, 9, 8, 202, 'Cuauhzontlipan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (167, 9, 8, 203, 'Huepaltepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (168, 9, 8, 204, 'Mecatlán (Rancho el Refugio)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (169, 9, 8, 205, 'Tecupilco (Kilómetro 17.5)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (170, 9, 8, 206, 'Xaxalpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (171, 9, 8, 207, 'Xaltepetitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (172, 9, 8, 208, 'Tetecolok', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (173, 9, 8, 209, 'Tlaxicoapa (Mulotla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (174, 9, 8, 210, 'Santa Rosa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (175, 9, 8, 211, 'Olla de Piedra', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (176, 9, 8, 213, 'El Zapote (Techultepec)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (177, 9, 8, 214, 'Maxulco (Barrio Cruztitla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (178, 9, 8, 215, 'El Pirul', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (179, 9, 8, 216, 'Santa Marta Casalan (Prolongación Avenida México Norte)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (180, 9, 8, 217, 'Zacuaztitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (181, 9, 8, 218, 'Rancho Paraíso Escondido', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (182, 9, 8, 219, 'Omaxal', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (183, 9, 8, 220, 'Mimiradorco (Camino Real al Monte)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (184, 9, 8, 222, 'Ahuatitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (185, 9, 8, 223, 'Texacazintla (Xacalixpa)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (186, 9, 8, 224, 'Chichilecas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (187, 9, 8, 225, 'Camino a la Granja', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (188, 9, 8, 226, 'Calle Capulines', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (189, 9, 8, 227, 'Temalacatl [Centro de Producción las Violetas]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (190, 9, 8, 228, 'Temoayan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (191, 9, 8, 229, 'Prolongación Xolotl', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (192, 9, 8, 230, 'Anayeli', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (193, 9, 8, 232, 'Meliaxco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (194, 9, 8, 233, 'Las Cruces Parte Alta (Tehuepanco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (195, 9, 8, 234, 'Cuapalipa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (196, 9, 8, 235, 'Tehuistitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (197, 9, 8, 236, 'Cuaxaltepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (198, 9, 8, 237, 'Tenopantitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (199, 9, 8, 238, 'Ocoteloloco (Tlaxcantitla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (200, 9, 8, 239, 'Tecpallo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (201, 9, 8, 241, 'Nuch Huaca (Techinantitle)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (202, 9, 8, 242, 'Cuacuahotlipa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (203, 9, 8, 243, 'Nacatulatlaxco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (204, 9, 8, 244, 'Tlacoxpa (Teshutla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (205, 9, 8, 245, 'Citlalcuac (Rancho el Paraíso Perdido)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (206, 9, 8, 246, 'Atoctenco (Prolongación Niños Héroes)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (207, 9, 8, 248, 'Paraje Huicalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (208, 9, 8, 249, 'Los Aguilar', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (209, 9, 8, 250, 'Tetexaloca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (210, 9, 8, 251, 'Prolongación Justo Sierra', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (211, 9, 8, 252, 'Acatlaco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (212, 9, 8, 253, 'Xalmoyo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (213, 9, 8, 254, 'Oluca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (214, 9, 8, 255, 'Pino Suárez', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (215, 9, 8, 256, 'Tlalcoxtepec (La Joya)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (216, 9, 8, 257, 'Camino Viejo a Santa Cruz', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (217, 9, 8, 258, 'Concla (Camino a Tlaltenamic)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (218, 9, 8, 259, 'Tlaltenami', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (219, 9, 8, 260, 'Mixquiahuac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (220, 9, 8, 261, 'Zacamoli', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (221, 9, 8, 263, 'Santa Ana (Cooperativa Ejidal)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (222, 9, 8, 264, 'Panuca (Kilómetro 27.5)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (223, 9, 8, 265, 'Tlaltepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (224, 9, 8, 266, 'Chimeo (Las Palmas)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (225, 9, 8, 267, 'El Tulmiac [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (226, 9, 8, 268, 'AA Milpa Alta', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (227, 9, 8, 269, 'El Cerrito', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (228, 9, 8, 270, 'Cerro Cuautzin [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (229, 9, 8, 271, 'San Miguel (Tecoxomayehualtitla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (230, 9, 8, 273, 'Texomulco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (231, 9, 8, 274, 'Prolongación Benito Juárez', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (232, 9, 8, 275, 'Tlalcocomoya', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (233, 9, 8, 276, 'Zozotlac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (234, 9, 8, 277, 'Atoctenco (Tlalaxco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (235, 9, 8, 278, 'Tecamac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (236, 9, 8, 280, 'Kilómetro 2 (Atocpan-Xicomulco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (237, 9, 8, 281, 'Zihuantemohuayan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (238, 9, 8, 282, 'Las Abejas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (239, 9, 8, 283, 'Tlatzala', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (240, 9, 8, 284, 'Tetzompa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (241, 9, 8, 285, 'Tuzanco (Prolongación Mina)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (242, 9, 8, 286, 'Rancho San José López Trejo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (243, 9, 8, 287, 'Ninguno', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (244, 9, 8, 288, 'Tlacopanco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (245, 9, 8, 289, 'Pixucaltitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (246, 9, 8, 290, 'Totomacuentla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (247, 9, 8, 291, 'Prolongación Veracruz Sur', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (248, 9, 8, 292, 'Joyas Parte Alta', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (249, 9, 8, 293, 'Camino de la Amistad', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (250, 9, 8, 294, 'Acuexcomatl', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (251, 9, 8, 295, 'Tlalcoxtepec (Prolongación Juan Escutia)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (252, 9, 8, 297, 'San Antonio Cuilotepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (253, 9, 8, 299, 'Tenichcalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (254, 9, 8, 300, 'San Nicolás Tetelco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (255, 9, 8, 301, 'El Tejocote', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (256, 9, 8, 302, 'Ejidos Tecoxpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (257, 9, 8, 303, 'Cerrada Arboledas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (258, 9, 8, 304, 'Emiliano Zapata (Avenida el Cerro)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (259, 9, 8, 305, 'Corraltitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (260, 9, 8, 306, 'Tepanoco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (261, 9, 8, 307, 'Prolongación Sinaloa Norte', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (262, 9, 8, 308, 'Santa Marta (Avenida Tlaxcala)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (263, 9, 8, 309, 'Zacatipla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (264, 9, 8, 310, 'Santa Marta Xolco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (265, 9, 8, 311, 'Cerrada Tehuacán', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (266, 9, 8, 312, 'Villa Hermosa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (267, 9, 8, 313, 'Totoxhpa (Cerrada Culiacán)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (268, 9, 8, 314, 'Cerrada Belisario Domínguez', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (269, 9, 8, 315, 'Nuchtla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (270, 9, 8, 316, 'Tehuizco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (271, 9, 8, 317, 'Achayatipac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (272, 9, 8, 318, 'Ayotepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (273, 9, 8, 319, 'Ochpantenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (274, 9, 8, 320, 'Ermita del Calvario', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (275, 9, 8, 321, 'La Virgen', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (276, 9, 8, 322, 'Matlahuacaloca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (277, 9, 8, 323, 'Tula (Huixtotlazintla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (278, 9, 8, 324, 'Tequimilpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (279, 9, 8, 326, 'Tlatlapantunco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (280, 9, 8, 328, 'San Agustín', '12070', 'Barrio', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (281, 9, 8, 330, 'La Concepción', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (282, 9, 8, 332, 'Los Angeles', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (283, 9, 8, 333, 'Tezontlipac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (284, 9, 8, 334, 'Camino a Telera', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (285, 9, 8, 337, 'Tlalzonco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (286, 9, 8, 338, 'Temazcaltitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (287, 9, 8, 339, 'Prolongación 5 de Mayo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (288, 9, 8, 340, 'Chautonco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (289, 9, 8, 341, 'Texotitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (290, 9, 8, 342, 'Coatepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (291, 9, 8, 344, 'Ocotitla', '12200', 'Barrio', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (292, 9, 8, 345, 'Toltecas Parte Alta (Cerrada Jacarandas)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (293, 9, 8, 347, 'Xochiatlaco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (294, 9, 8, 348, 'Huacaltunco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (295, 9, 8, 350, 'Las Palmas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (296, 9, 8, 351, 'Tlahuiztpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (297, 9, 8, 352, 'Zacacali', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (298, 9, 8, 353, 'Tepenahuac [Centro de Educación Ambiental]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (299, 9, 8, 354, 'Camino Viejo a Tlaltenamic', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (300, 9, 9, 1, 'Álvaro Obregón', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (301, 9, 9, 2, 'Cuauhtlamila', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (302, 9, 9, 213, 'Ampliación San Bernabé (Tenango)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (303, 9, 9, 214, 'Camino a la Bandera', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (304, 9, 9, 215, 'Tiximaloya', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (305, 9, 9, 216, 'El Ermitaño (Paraje el Chipil)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (306, 9, 9, 217, 'Texcalatlaco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (307, 9, 9, 218, 'El Campanario', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (308, 9, 9, 219, 'Apapaxtla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (309, 9, 10, 1, 'Tláhuac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (310, 9, 10, 11, 'San Andrés Mixquic', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (311, 9, 10, 21, 'San Juan Ixtayopan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (312, 9, 10, 24, 'San Nicolás Tetelco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (313, 9, 10, 26, 'Santa Catarina Yecahuitzotl', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (314, 9, 10, 69, 'San Miguel', '13070', 'Barrio', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (315, 9, 10, 71, 'Tabla los Pozos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (316, 9, 10, 72, 'Mesita del Capulín', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (317, 9, 10, 76, 'Ojo de Agua', '13450', 'Colonia', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (318, 9, 10, 81, 'San Miguel (Chinampas)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (319, 9, 10, 82, 'Santa Catarina (Tequexquipa)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (320, 9, 10, 86, 'Xila', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (321, 9, 10, 89, 'El Tetecon (El Solitario)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (322, 9, 10, 94, 'Chinampa San Juan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (323, 9, 10, 95, 'Fin de Galeana', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (324, 9, 10, 100, 'Puente de Tubo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (325, 9, 10, 103, 'Paraje Xometitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (326, 9, 10, 104, 'San Ignacio de Loyola', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (327, 9, 10, 108, 'Paraje Ayecac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (328, 9, 10, 110, 'La Ciénega', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (329, 9, 10, 111, 'Chinampas Tetelco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (330, 9, 10, 113, 'Lomas de Xocotlán', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (331, 9, 10, 116, 'Santa Catarina [Lienzo Charro]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (332, 9, 10, 119, 'Tierra Blanca Parte Alta', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (333, 9, 10, 120, 'Rancho las Siete Yuntas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (334, 9, 10, 122, 'Las Tablas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (335, 9, 10, 123, 'Mina Xaltepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (336, 9, 10, 124, 'Mina la Estancia', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (337, 9, 10, 125, 'Mina Texcocatitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (338, 9, 10, 126, 'Camino a Tlaltenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (339, 9, 10, 128, 'Prolongación Peña Alta', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (340, 9, 10, 129, 'Rancho los Pollitos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (341, 9, 10, 133, 'El Rancho (Rancho la Pistola del Ejido)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (342, 9, 10, 134, 'Tabla Telocuatitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (343, 9, 10, 136, 'El Pato', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (344, 9, 10, 137, 'Tabla 2-4', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (345, 9, 10, 138, 'Monserrat (Arenales Oaxaca)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (346, 9, 10, 140, 'El Paraíso (Mecoxtla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (347, 9, 10, 141, 'El Zapote (Colonia Ejidal)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (348, 9, 10, 142, 'Ampliación San Miguel', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (349, 9, 10, 143, 'Ninguno', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (350, 9, 10, 144, 'Camino a las Minas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (351, 9, 10, 145, 'Xalpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (352, 9, 10, 146, 'Desarrollo Eco Turístico Reyes Flores', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (353, 9, 10, 147, 'Tercer Callejón de Calvario', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (354, 9, 10, 148, 'Puertantitla (Camino al Cerro)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (355, 9, 10, 149, 'Prolongación el Rosario', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (356, 9, 10, 150, 'La Nopalera', '13220', 'Colonia', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (357, 9, 10, 151, 'Tercera Cerrada de Mazatepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (358, 9, 10, 152, 'Bugambilias', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (359, 9, 10, 153, 'Tezontitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (360, 9, 10, 154, 'Xalatlayco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (361, 9, 11, 1, 'Tlalpan', '14000', 'Colonia', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (362, 9, 11, 19, 'Parres (El Guarda)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (363, 9, 11, 26, 'San Miguel Ajusco', '14700', 'Pueblo', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (364, 9, 11, 27, 'San Miguel Topilejo', '14500', 'Pueblo', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (365, 9, 11, 103, 'Ampliación las Cruces', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (366, 9, 11, 104, 'La Cima Uno [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (367, 9, 11, 105, 'Apapaxtles', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (368, 9, 11, 108, 'Paraje Cercatenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (369, 9, 11, 109, 'Llano de Cantimplora', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (370, 9, 11, 110, 'Casa Solar', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (371, 9, 11, 112, 'Acueducto', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (372, 9, 11, 113, 'La Cima Dos [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (373, 9, 11, 114, 'Cuamino', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (374, 9, 11, 116, 'CORENA Regional 2 (El Crucero)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (375, 9, 11, 118, 'Estación la Cima', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (376, 9, 11, 119, 'Mezontepec [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (377, 9, 11, 123, 'Xacatixtla (Granja la Garriga)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (378, 9, 11, 124, 'Héroes de 1910', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (379, 9, 11, 128, 'Las Raíces', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (380, 9, 11, 129, 'Kilómetro 38', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (381, 9, 11, 130, 'Kilómetro 36.5 (El Crucero)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (382, 9, 11, 131, 'Las Maravillas (Kilómetro 37)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (383, 9, 11, 132, 'Kilómetro 33.5', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (384, 9, 11, 135, 'Lomas de Tepemecatl', '14735', 'Campamento', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (385, 9, 11, 140, 'El Oyamel', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (386, 9, 11, 141, 'El Paraíso', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (387, 9, 11, 143, 'Pentatlón', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (388, 9, 11, 144, 'Piedra Larga', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (389, 9, 11, 145, 'Piedras Blancas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (390, 9, 11, 150, 'Rancho Aprisco Cima', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (391, 9, 11, 152, 'Rancho Ramírez', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (392, 9, 11, 153, 'Rancho Roberto Camacho', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (393, 9, 11, 154, 'La Cueva del Oso', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (394, 9, 11, 155, 'La Fortaleza', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (395, 9, 11, 159, 'Rancho Santísima Trinidad', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (396, 9, 11, 160, 'Seminario Nazareno', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (397, 9, 11, 161, 'El Pedregal', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (398, 9, 11, 162, 'El Sifón', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (399, 9, 11, 164, 'Kilómetro 17 (Circuito Ajusco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (400, 9, 11, 165, 'Rancho las Trojes', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (401, 9, 11, 168, 'Xalcuitongo (La Asunción)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (402, 9, 11, 171, 'La Trinidad', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (403, 9, 11, 175, 'Siete Ocotes', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (404, 9, 11, 178, 'Quinta Gala (Kilómetro 35)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (405, 9, 11, 179, 'El Charco', '14780', 'Campamento', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (406, 9, 11, 192, 'Rancho Kyalami', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (407, 9, 11, 193, 'Los Sauces', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (408, 9, 11, 197, 'Rancho San Francisco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (409, 9, 11, 198, 'La Troje', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (410, 9, 11, 199, 'El Cofrecito', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (411, 9, 11, 200, 'Rancho Espiridión', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (412, 9, 11, 201, 'Rancho los Compadres', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (413, 9, 11, 202, 'Rancho el Paraíso', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (414, 9, 11, 204, 'Rancho los Pioneros', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (415, 9, 11, 205, 'El Divisadero', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (416, 9, 11, 207, 'Camino Viejo a San Andrés', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (417, 9, 11, 209, 'Rancho San Nicolás', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (418, 9, 11, 210, 'El Arenal', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (419, 9, 11, 216, 'Cuanejaque', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (420, 9, 11, 217, 'El Oyameyo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (421, 9, 11, 218, 'Parada Oyameyo (Kilómetro 31.5)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (422, 9, 11, 220, 'La Campana (Kilómetro 12)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (423, 9, 11, 221, 'La Rufina', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (424, 9, 11, 222, 'Nopaltitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (425, 9, 11, 229, 'Tres Cabañas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (426, 9, 11, 232, 'El Alambrado', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (427, 9, 11, 234, 'Estudios Ajusco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (428, 9, 11, 236, 'El Abrevadero', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (429, 9, 11, 237, 'Xomulco (Oyamertonco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (430, 9, 11, 239, 'Rancho Santa Rosa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (431, 9, 11, 240, 'Kilómetro 34 Circuito Ajusco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (432, 9, 11, 243, 'Los Caballos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (433, 9, 11, 244, 'La Bola', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (434, 9, 11, 246, 'Rancho Chico', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (435, 9, 11, 247, 'Rancho López Márquez', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (436, 9, 11, 249, 'Rancho los Cedros del Abuelo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (437, 9, 11, 250, 'Haro', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (438, 9, 11, 251, 'Quinta Santa Rosa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (439, 9, 11, 252, 'La Morucha', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (440, 9, 11, 253, 'Rancho San Patricio', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (441, 9, 11, 254, 'Barranquilla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (442, 9, 11, 256, 'La Capilla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (443, 9, 11, 257, 'Rancho Mezontepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (444, 9, 11, 258, 'Rancho Llano de Vidrio', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (445, 9, 11, 259, 'Llanito Largo [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (446, 9, 11, 261, 'Aguatenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (447, 9, 11, 262, 'El Sicomoro', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (448, 9, 11, 263, 'Tlamenelolpa (Los Encinos)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (449, 9, 11, 264, 'Predio Tepetzintla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (450, 9, 11, 265, 'La Candelaria', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (451, 9, 11, 266, 'La Providencia', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (452, 9, 11, 267, 'Finca Trancas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (453, 9, 11, 268, 'Kilómetro 32.3', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (454, 9, 11, 269, 'Temaxcatitla (Kilómetro 32.2)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (455, 9, 11, 270, 'Paraje de Apantenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (456, 9, 11, 271, 'Totoapan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (457, 9, 11, 272, 'Colonia Ocotla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (458, 9, 11, 275, 'Kilómetro 29.5', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (459, 9, 11, 276, 'Kilómetro 30', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (460, 9, 11, 277, 'Kilómetro 30.5', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (461, 9, 11, 278, 'José María Morelos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (462, 9, 11, 280, 'Los Eucaliptos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (463, 9, 11, 282, 'Ocotla Chico', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (464, 9, 11, 283, 'Paraje Atonco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (465, 9, 11, 290, 'La Herradura', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (466, 9, 11, 291, 'Carretera al Ajusco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (467, 9, 11, 292, 'El Pedregal', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (468, 9, 11, 295, 'Chahualixcantitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (469, 9, 11, 296, 'Lomas de San José', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (470, 9, 11, 299, 'Acueducto (Pedro Moreno)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (471, 9, 11, 300, 'Colonia San Juan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (472, 9, 11, 301, 'Colonia Aguayoto', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (473, 9, 11, 302, 'Los Encinos', '14239', 'Colonia', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (474, 9, 11, 303, 'Kilómetro 32.1', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (475, 9, 11, 305, 'Lienzo Charro Pepe Castro', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (476, 9, 11, 306, 'Tres Vientos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (477, 9, 11, 307, 'Jaltomatitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (478, 9, 11, 308, 'Kilómetro 7.5 (Circuito Ajusco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (479, 9, 11, 310, 'Camino a la Venta', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (480, 9, 11, 311, 'La Monera', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (481, 9, 11, 317, 'El Tianguillo (Kilómetro 19.5)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (482, 9, 11, 318, 'Criadero Kodik', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (483, 9, 11, 321, 'Camino Cantera Cantil', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (484, 9, 11, 323, 'Cortijo San Higinio', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (485, 9, 11, 325, 'Planta Abasolo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (486, 9, 11, 326, 'Cuauhtenco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (487, 9, 11, 327, 'Tepozán [Parque Ecoturístico]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (488, 9, 11, 328, 'Ejidos de San Andrés Totoltepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (489, 9, 11, 330, 'Área de los Venados (La SIREFA)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (490, 9, 11, 332, 'Prolongación Narciso Mendoza', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (491, 9, 11, 333, 'Prolongación Acueducto', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (492, 9, 11, 334, 'Granja los Pinos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (493, 9, 11, 335, 'Rancho el Tordi...yo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (494, 9, 11, 336, 'Agua Grande [Parque Recreativo]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (495, 9, 11, 337, 'Rancho Yamel', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (496, 9, 11, 338, 'Kilómetro 14.5', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (497, 9, 11, 339, 'El Oyamel', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (498, 9, 11, 340, 'Rancho Tres Hermanos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (499, 9, 11, 341, 'Las Cruces', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (500, 9, 11, 342, 'Rancho Matamoros', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (501, 9, 11, 343, 'Rancho Valentina', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (502, 9, 11, 345, 'Ermita Ajusco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (503, 9, 11, 346, 'El Cedral', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (504, 9, 11, 347, 'Las Calaveras (Doña Cristy)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (505, 9, 11, 350, 'Los Tlapancos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (506, 9, 11, 351, 'Carretera al Ajusco II', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (507, 9, 11, 352, 'Las Canteras', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (508, 9, 11, 353, 'Camino Antiguo a Cuernavaca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (509, 9, 11, 354, 'Cañada del Acueducto', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (510, 9, 11, 355, 'Acueducto 1ra. Sección', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (511, 9, 11, 356, 'El Campo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (512, 9, 11, 357, 'Cuatzontle', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (513, 9, 11, 358, 'El Arcoiris', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (514, 9, 11, 359, 'Tixtapaltongo (Loma de Ahuayoto)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (515, 9, 11, 360, 'Rancho Ahuayoto', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (516, 9, 11, 361, 'Oyametonco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (517, 9, 11, 362, 'Cansacaballos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (518, 9, 11, 363, 'Los Arcos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (519, 9, 11, 364, 'Cabaña Buenavista', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (520, 9, 11, 365, 'Ojo de Agua', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (521, 9, 11, 368, 'Tepelancoxtla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (522, 9, 11, 371, 'San Agustín', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (523, 9, 11, 373, 'Ispancolohuia', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (524, 9, 11, 374, 'Paraje Tlalmenelolpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (525, 9, 11, 376, 'Teteocotla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (526, 9, 11, 377, 'Paraje el Tezontle Acopiaxco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (527, 9, 11, 378, 'Rancho Viejo', '14750', 'Campamento', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (528, 9, 11, 379, 'Paraje el Negro', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (529, 9, 11, 380, 'Camino Viejo a Cuernavaca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (530, 9, 11, 381, 'Ololica (Loloigque)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (531, 9, 11, 382, 'Ninguno', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (532, 9, 11, 383, 'Kilómetro 31', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (533, 9, 11, 384, 'Acopiaxco [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (534, 9, 11, 385, 'Cerro Pelado [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (535, 9, 11, 386, 'La Rosa [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (536, 9, 11, 387, 'La Glorieta', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (537, 9, 11, 388, 'Paraje Altavista', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (538, 9, 11, 389, 'La Loma', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (539, 9, 11, 390, 'La Reja', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (540, 9, 11, 391, 'Popocotla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (541, 9, 11, 392, 'Colonia Cuauhtenco (Kilómetro 27)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (542, 9, 11, 393, 'Kilómetro 28 Sur', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (543, 9, 11, 394, 'Paraje Buenavista', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (544, 9, 11, 395, 'Los Encinos [Rancho]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (545, 9, 11, 396, 'Tezontitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (546, 9, 11, 397, 'Xictontle [Campamento Forestal]', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (547, 9, 11, 398, 'Rancho Teo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (548, 9, 11, 399, 'Piedra Suelta', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (549, 9, 11, 400, 'El Cristal', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (550, 9, 11, 401, 'El Retiro', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (551, 9, 11, 402, 'La Nube', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (552, 9, 11, 403, 'Las Castañas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (553, 9, 11, 404, 'San Carlos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (554, 9, 11, 405, 'Rancho Chato', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (555, 9, 11, 406, 'El Capricho', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (556, 9, 11, 407, 'El Sillar', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (557, 9, 11, 408, 'La Quinta Estación', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (558, 9, 11, 409, 'Rancho Nevado', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (559, 9, 11, 410, 'La Soledad', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (560, 9, 11, 411, 'Casas Blancas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (561, 9, 11, 412, 'Las Tinajas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (562, 9, 11, 413, 'El Arco Amarillo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (563, 9, 11, 414, 'El Guardita', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (564, 9, 11, 415, 'El Capricho', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (565, 9, 11, 416, 'Tlayelpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (566, 9, 12, 1, 'Xochimilco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (567, 9, 12, 91, 'Tepemimilco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (568, 9, 12, 96, 'Ixotitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (569, 9, 12, 111, 'Paraje Lila (El Ladrillo)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (570, 9, 12, 112, 'Paraje Texhuilo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (571, 9, 12, 113, 'Zacapa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (572, 9, 12, 118, 'Barrio San Antonio (Cruz Monte)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (573, 9, 12, 131, 'Tepepan', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (574, 9, 12, 134, 'Ampliación Chalmita', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (575, 9, 12, 135, 'El Mirador (Tetexaloca)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (576, 9, 12, 136, 'Tepexomulco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (577, 9, 12, 137, 'Tlachiultepec de Ahuayucan (Las Malvinas)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (578, 9, 12, 138, 'Tepetitla (Tlacoxpan)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (579, 9, 12, 139, 'Tlacualleli (El Calvario)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (580, 9, 12, 140, 'Tlaltepetla (Tehuistitla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (581, 9, 12, 143, 'Tlalatlaco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (582, 9, 12, 146, 'Tlatzala (Cuayuca)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (583, 9, 12, 147, 'Isla de las Muñecas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (584, 9, 12, 151, 'Tepuente', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (585, 9, 12, 153, 'Ahuatitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (586, 9, 12, 157, 'Tipipili', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (587, 9, 12, 160, 'Tochuca (San Salvador)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (588, 9, 12, 161, 'Tecanco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (589, 9, 12, 162, 'Pepelaxtla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (590, 9, 12, 163, 'Tecacalango', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (591, 9, 12, 164, 'Tzompole', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (592, 9, 12, 165, 'Cacalco (Tepextenco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (593, 9, 12, 168, 'Texalco (Joyas de Texalco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (594, 9, 12, 169, 'Apatlaco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (595, 9, 12, 172, 'Paraje de la Ciénega', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (596, 9, 12, 173, 'Paraje los Escondidos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (597, 9, 12, 177, 'Kilómetro 26', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (598, 9, 12, 178, 'Tlapizatil (Puente de Urrutia)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (599, 9, 12, 180, 'Tepexomulco las Rocas', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (600, 9, 12, 181, 'Ocotitla Tepachuxiac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (601, 9, 12, 182, 'Tecuyo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (602, 9, 12, 183, 'Hualpalcaltepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (603, 9, 12, 184, 'Atotle', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (604, 9, 12, 185, 'Los Tejocotes', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (605, 9, 12, 186, 'Granja R.R. (Los Ciruelos)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (606, 9, 12, 187, 'Tepepatlaxtle', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (607, 9, 12, 190, 'Tixculco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (608, 9, 12, 191, 'Tecoexcontitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (609, 9, 12, 192, 'Quinta Patricia', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (610, 9, 12, 193, 'El Potrero (Bosques de la Paz)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (611, 9, 12, 195, 'Paraje Tepanyecac', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (612, 9, 12, 196, 'Tepepula', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (613, 9, 12, 197, 'La Angostura', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (614, 9, 12, 198, 'Sihuatlixpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (615, 9, 12, 201, 'Cuatixi', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (616, 9, 12, 202, 'Paraje Zacapa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (617, 9, 12, 203, 'Santa Catarina (Piedra Blanca)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (618, 9, 12, 204, 'Huepaltepec', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (619, 9, 12, 205, 'Tecuanatla (Arenal Papanco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (620, 9, 12, 206, 'Tepepecalachico (Inopilco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (621, 9, 12, 207, 'Rancho la Flor', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (622, 9, 12, 208, 'Los Cedros', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (623, 9, 12, 209, 'Tepeclite', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (624, 9, 12, 210, 'Acalipa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (625, 9, 12, 213, 'Ampliación Bugambilias (Nauhtecpan)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (626, 9, 12, 214, 'Tepeyecac (El Arenal)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (627, 9, 12, 215, 'Tepexomulco (Kilómetro 27.8)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (628, 9, 12, 218, 'Ixcuicuilco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (629, 9, 12, 223, 'Chalma (Avenida de las Torres)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (630, 9, 12, 224, 'Corralón Policía Federal de Caminos', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (631, 9, 12, 226, 'Cocopalcuautla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (632, 9, 12, 229, 'Parada del Conejo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (633, 9, 12, 231, 'Tecanco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (634, 9, 12, 232, 'Atlaxco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (635, 9, 12, 234, 'Barrio Nochicala', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (636, 9, 12, 237, 'El Cedral', '16870', 'Campamento', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (637, 9, 12, 239, 'Ahuatitla (Texcopaxuli)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (638, 9, 12, 241, 'Tiziclipa', '16520', 'Campamento', 'Urbano');
INSERT INTO `sys_localidades_copy1` VALUES (639, 9, 12, 242, 'Atenco (Tlaquilpa)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (640, 9, 12, 243, 'Naxayopa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (641, 9, 12, 244, 'Coapantitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (642, 9, 12, 245, 'San Martín', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (643, 9, 12, 246, 'Francisco Villa (Tepejoyuca)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (644, 9, 12, 247, 'Pantiagua', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (645, 9, 12, 249, 'Chililico', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (646, 9, 12, 251, 'Camino al Panteón (Las Cruces)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (647, 9, 12, 252, 'Texopantitla (Chocolines)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (648, 9, 12, 253, 'Ilimunxutitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (649, 9, 12, 254, 'Tlacomulco (Kilómetro 25.5)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (650, 9, 12, 256, 'La Cienega', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (651, 9, 12, 257, 'Los Pinos (Tecacahuaco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (652, 9, 12, 258, 'Temamatla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (653, 9, 12, 259, 'Colexco (Tenochtitlan)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (654, 9, 12, 261, 'Milahuaytitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (655, 9, 12, 262, 'Paraje Nochicala', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (656, 9, 12, 263, 'San Juan Diego (Matlacuaitla)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (657, 9, 12, 264, 'Paraje Tlahuiteco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (658, 9, 12, 265, 'Moyocalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (659, 9, 12, 266, 'Cuahuticultitla', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (660, 9, 12, 267, 'Tizilingo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (661, 9, 12, 268, 'Alcanfores', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (662, 9, 12, 269, 'Bosques de la Paz', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (663, 9, 12, 270, 'Contlalco', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (664, 9, 12, 271, 'Tlalmelaca', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (665, 9, 12, 272, 'Xometitla (Tlalitenco)', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (666, 9, 12, 273, 'Zacaxontlicpa', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (667, 9, 13, 1, 'Benito Juárez', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (668, 9, 14, 1, 'Cuauhtémoc', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (669, 9, 15, 1, 'Miguel Hidalgo', '', '', '');
INSERT INTO `sys_localidades_copy1` VALUES (670, 9, 16, 1, 'Venustiano Carranza', '15340', 'Colonia', 'Urbano');

-- ----------------------------
-- Table structure for sys_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_log`;
CREATE TABLE `sys_log`  (
  `id_log` bigint(22) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(10) NOT NULL,
  `ip_address` varchar(40) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `user_agent` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `evento` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id_log`) USING BTREE,
  INDEX `idusuario`(`id_usuario`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 94 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_log
-- ----------------------------
INSERT INTO `sys_log` VALUES (1, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Cierre de sesión', '2017-11-15 06:59:39');
INSERT INTO `sys_log` VALUES (2, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Inicio de sesión', '2017-11-15 07:15:33');
INSERT INTO `sys_log` VALUES (3, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Inicio de sesión', '2017-11-15 20:43:25');
INSERT INTO `sys_log` VALUES (4, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_proyecto` = \'2\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto` = \'2\'', '2017-11-15 20:58:09');
INSERT INTO `sys_log` VALUES (5, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_proyecto` = \'1\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto` = \'1\'', '2017-11-15 20:58:22');
INSERT INTO `sys_log` VALUES (6, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_noticias` (`id_lang`, `id_metatag`, `titulo`, `descripcion`, `slug`, `portada`, `imagen_noticia`, `id_usuario`) VALUES (\'2\', NULL, \'NUEVO PROYECTOs(Copy)\', \'<p><strong><em><span style=\\\"color: rgb(226, 80, 65);\\\">NUEVO PROYECTOC<', '2017-11-15 21:06:59');
INSERT INTO `sys_log` VALUES (7, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos` (`id_lang`, `id_metatag`, `nombre`, `descripcion`, `fecha_proyecto`, `portada`, `imagen_grande`, `slug`, `show_in_home`, `id_usuario`) VALUES (\'2\', \'3\', \'prueba(Copy)\', \'<p>asdasdasd</p>\', \'2017-11-01\', \'assets/img/upl', '2017-11-15 21:27:44');
INSERT INTO `sys_log` VALUES (8, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos_sliders` (`descripcion`, `id_proyecto`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'cxczxcz\',3,\'1\',\'assets/img/uploads/20171115/Captura_de_pantalla_de_2017-11-05_13-26-212.png\',\'asddasdasd\'), (\'dasdasd\',3,\'1\',\'assets/i', '2017-11-15 21:27:44');
INSERT INTO `sys_log` VALUES (9, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_proyecto` = \'3\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto` = \'3\'', '2017-11-15 21:28:07');
INSERT INTO `sys_log` VALUES (10, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_proyecto` = \'3\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto` = \'3\'', '2017-11-15 21:32:34');
INSERT INTO `sys_log` VALUES (11, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos_sliders` SET `id_proyecto` = \'3\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto` = \'3\'', '2017-11-15 21:32:34');
INSERT INTO `sys_log` VALUES (12, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos_sliders` SET `id_proyecto_slide` = \'9\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto_slide` = \'9\'', '2017-11-16 00:40:52');
INSERT INTO `sys_log` VALUES (13, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos_sliders` SET `id_proyecto_slide` = \'8\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto_slide` = \'8\'', '2017-11-16 00:41:00');
INSERT INTO `sys_log` VALUES (14, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_lang` = \'1\', `id_metatag` = \'1\', `nombre` = \'prueba(Copy)1\', `descripcion` = \'<p>cxczxczc<span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojio', '2017-11-16 01:15:55');
INSERT INTO `sys_log` VALUES (15, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos_sliders` SET `id_proyecto_slide` = \'7\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto_slide` = \'7\'', '2017-11-16 01:15:55');
INSERT INTO `sys_log` VALUES (16, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos_sliders` (`descripcion`, `id_proyecto`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'2222222222222222222\\r\\n                            \',\'3\',\'1\',\'assets/img/uploads/20171116/IMG_20151219_062754-COLLAGE.jpg\',\'222222222\'', '2017-11-16 01:15:55');
INSERT INTO `sys_log` VALUES (17, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_lang` = \'1\', `id_metatag` = \'1\', `nombre` = \'prueba(Copy)1\', `descripcion` = \'<p>cxczxcz<span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojion', '2017-11-16 01:17:19');
INSERT INTO `sys_log` VALUES (18, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_lang` = \'1\', `id_metatag` = \'1\', `nombre` = \'prueba(Copy)1\', `descripcion` = \'<p><u><em><strong>cxczxcz</strong></em></u></p>\', `fecha_proyecto` = \'2017-11-16\', `slug` = \'prueba\', `show_in_home` = NULL, `id_usuario`', '2017-11-16 01:18:12');
INSERT INTO `sys_log` VALUES (19, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_lang` = \'1\', `id_metatag` = \'1\', `nombre` = \'prueba(Copy)1\', `descripcion` = \'<p><span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1', '2017-11-16 01:23:05');
INSERT INTO `sys_log` VALUES (20, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos_sliders` SET `id_proyecto_slide` = \'10\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto_slide` = \'10\'', '2017-11-16 01:27:39');
INSERT INTO `sys_log` VALUES (21, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_lang` = \'1\', `id_metatag` = \'1\', `nombre` = \'prueba(Copy)1\', `descripcion` = \'<p><span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1', '2017-11-16 01:27:59');
INSERT INTO `sys_log` VALUES (22, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos_sliders` SET `id_proyecto_slide` = \'11\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_proyecto_slide` = \'11\'', '2017-11-16 01:27:59');
INSERT INTO `sys_log` VALUES (23, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos_sliders` (`descripcion`, `id_proyecto`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'                            333333\\r\\n                            \',\'3\',\'1\',\'assets/img/uploads/20171116/IMG_20160717_215212.jpg\',\'333', '2017-11-16 01:27:59');
INSERT INTO `sys_log` VALUES (24, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_lang` = \'1\', `id_metatag` = \'4\', `nombre` = \'prueba(Copy)1\', `descripcion` = \'<p><span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1', '2017-11-16 01:28:37');
INSERT INTO `sys_log` VALUES (25, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_proyectos` SET `id_lang` = \'1\', `id_metatag` = \'4\', `nombre` = \'prueba(Copy)1\', `descripcion` = \'<p><span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/ajax/libs/emojione/2.0.1', '2017-11-16 01:31:19');
INSERT INTO `sys_log` VALUES (26, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios` (`id_lang`, `id_metatag`, `titulo`, `descripcion`, `slug`, `id_usuario`, `portada`) VALUES (\'1\', \'3\', \'ddasdasd\', \'<p>asdasdasd</p>\', \'dsadasd\', \'1\', \'assets/img/uploads/20171116/ady.jpg\')', '2017-11-16 02:30:17');
INSERT INTO `sys_log` VALUES (27, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios_sliders` (`descripcion`, `id_servicio`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'asdasd\',1,\'1\',\'assets/img/uploads/20171116/Captura_de_pantalla_de_2016-11-04_10-03-443.png\',\'dqsdasd\'), (\'dasdasdasd\',1,\'1\',\'assets/im', '2017-11-16 02:30:17');
INSERT INTO `sys_log` VALUES (28, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios` (`id_lang`, `id_metatag`, `titulo`, `descripcion`, `slug`, `id_usuario`, `portada`) VALUES (\'1\', \'3\', \'SERVICIO 1\', \'<p><strong>SERVICIO 1 <span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: ur', '2017-11-16 02:33:12');
INSERT INTO `sys_log` VALUES (29, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios_sliders` (`descripcion`, `id_servicio`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'JUNIOR\',2,\'1\',\'assets/img/uploads/20171116/IMG_20151219_062754-COLLAGE1.jpg\',\'JUNIOR\'), (\'PROGRAMADOR\',2,\'1\',\'assets/img/uploads/20171', '2017-11-16 02:33:12');
INSERT INTO `sys_log` VALUES (30, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios` SET `id_servicio` = \'2\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_servicio` = \'2\'', '2017-11-16 02:38:41');
INSERT INTO `sys_log` VALUES (31, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios_sliders` SET `id_servicio` = \'2\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_servicio` = \'2\'', '2017-11-16 02:38:41');
INSERT INTO `sys_log` VALUES (32, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios` SET `id_servicio` = \'1\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_servicio` = \'1\'', '2017-11-16 02:38:45');
INSERT INTO `sys_log` VALUES (33, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios_sliders` SET `id_servicio` = \'1\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_servicio` = \'1\'', '2017-11-16 02:38:45');
INSERT INTO `sys_log` VALUES (34, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos` (`id_lang`, `id_metatag`, `nombre`, `descripcion`, `fecha_proyecto`, `portada`, `imagen_grande`, `slug`, `show_in_home`, `id_usuario`) VALUES (\'1\', \'4\', \'prueba(Copy)1(Copia)\', \'<p><span class=\\\"fr-emoticon fr-deletabl', '2017-11-16 02:49:29');
INSERT INTO `sys_log` VALUES (35, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos_sliders` (`descripcion`, `id_proyecto`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'cxczxcz\',4,\'1\',\'assets/img/uploads/20171115/Captura_de_pantalla_de_2017-11-05_13-26-212.png\',\'asddasdasd\'), (\'                        ', '2017-11-16 02:49:29');
INSERT INTO `sys_log` VALUES (36, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos` (`id_lang`, `id_metatag`, `nombre`, `descripcion`, `fecha_proyecto`, `portada`, `imagen_grande`, `slug`, `show_in_home`, `id_usuario`) VALUES (\'1\', \'4\', \'prueba(Copy)1(Copia)(Copia)\', \'<p><span class=\\\"fr-emoticon fr-d', '2017-11-16 02:49:49');
INSERT INTO `sys_log` VALUES (37, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos_sliders` (`descripcion`, `id_proyecto`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'cxczxcz\',5,\'1\',\'assets/img/uploads/20171115/Captura_de_pantalla_de_2017-11-05_13-26-212.png\',\'asddasdasd\'), (\'                        ', '2017-11-16 02:49:49');
INSERT INTO `sys_log` VALUES (38, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos` (`id_lang`, `id_metatag`, `nombre`, `descripcion`, `fecha_proyecto`, `portada`, `imagen_grande`, `slug`, `show_in_home`, `id_usuario`) VALUES (\'1\', \'4\', \'prueba(Copy)1(Copia)(Copia)(Copia)\', \'<p><span class=\\\"fr-emotic', '2017-11-16 02:51:08');
INSERT INTO `sys_log` VALUES (39, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos_sliders` (`descripcion`, `id_proyecto`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'cxczxcz\',6,\'1\',\'assets/img/uploads/20171115/Captura_de_pantalla_de_2017-11-05_13-26-212.png\',\'asddasdasd\'), (\'                        ', '2017-11-16 02:51:08');
INSERT INTO `sys_log` VALUES (40, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos` (`id_lang`, `id_metatag`, `nombre`, `descripcion`, `fecha_proyecto`, `portada`, `imagen_grande`, `slug`, `show_in_home`, `id_usuario`) VALUES (\'1\', \'3\', \'proyecto3(Copia)\', \'<p>proyecto3</p>\', \'2017-11-10\', \'assets/img', '2017-11-16 02:51:16');
INSERT INTO `sys_log` VALUES (41, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_proyectos_sliders` (`descripcion`, `id_proyecto`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'proyecto3\',7,\'1\',\'assets/img/uploads/20171115/Captura_de_pantalla_de_2017-11-05_13-26-21.png\',\'proyecto3\')', '2017-11-16 02:51:16');
INSERT INTO `sys_log` VALUES (42, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios` (`id_lang`, `id_metatag`, `titulo`, `descripcion`, `portada`, `slug`, `id_usuario`) VALUES (\'1\', \'3\', \'SERVICIO 1(Copia)\', \'<p><strong>SERVICIO 1 <span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"backgro', '2017-11-16 02:52:12');
INSERT INTO `sys_log` VALUES (43, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios_sliders` (`descripcion`, `id_servicio`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'JUNIOR\',3,\'1\',\'assets/img/uploads/20171116/IMG_20151219_062754-COLLAGE1.jpg\',\'JUNIOR\'), (\'PROGRAMADOR\',3,\'1\',\'assets/img/uploads/20171', '2017-11-16 02:52:12');
INSERT INTO `sys_log` VALUES (44, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios` SET `id_lang` = \'2\', `id_metatag` = \'5\', `titulo` = \'SERVICIO 1(Copy)\', `descripcion` = \'<p><strong>SERVICIO 1 <span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/aj', '2017-11-16 03:20:56');
INSERT INTO `sys_log` VALUES (45, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios_sliders` (`descripcion`, `id_servicio`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'\',\'3\',\'1\',\'assets/img/uploads/20171116/Captura_de_pantalla_de_2017-11-02_16-40-02.png\',\'\')', '2017-11-16 03:20:56');
INSERT INTO `sys_log` VALUES (46, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios_sliders` SET `id_servicio_slide` = \'6\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_servicio_slide` = \'6\'', '2017-11-16 03:25:36');
INSERT INTO `sys_log` VALUES (47, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios` SET `id_lang` = \'2\', `id_metatag` = \'5\', `titulo` = \'SERVICIO 1(Copy)\', `descripcion` = \'<p><strong>SERVICIO 1 <span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/aj', '2017-11-16 03:25:47');
INSERT INTO `sys_log` VALUES (48, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios_sliders` SET `id_servicio_slide` = \'7\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_servicio_slide` = \'7\'', '2017-11-16 03:25:47');
INSERT INTO `sys_log` VALUES (49, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios_sliders` (`descripcion`, `id_servicio`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'                            \\r\\n                            \',\'3\',\'1\',\'assets/img/uploads/20171116/ady1.jpg\',\'\')', '2017-11-16 03:25:47');
INSERT INTO `sys_log` VALUES (50, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios` SET `id_lang` = \'2\', `id_metatag` = \'5\', `titulo` = \'SERVICIO 1(Copy)\', `descripcion` = \'<p><strong>SERVICIO 1 <span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/aj', '2017-11-16 03:26:43');
INSERT INTO `sys_log` VALUES (51, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios_sliders` (`descripcion`, `id_servicio`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'fdsfsdfsdf\',\'3\',\'1\',\'assets/img/uploads/20171116/cinepolis_vip.png\',\'dsfsdfsdf\')', '2017-11-16 03:26:43');
INSERT INTO `sys_log` VALUES (52, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios` SET `id_lang` = \'2\', `id_metatag` = \'5\', `titulo` = \'SERVICIO 1(Copy)\', `descripcion` = \'<p><strong>SERVICIO 1 <span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/aj', '2017-11-16 03:27:22');
INSERT INTO `sys_log` VALUES (53, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios` SET `id_lang` = \'2\', `id_metatag` = \'5\', `titulo` = \'SERVICIO 1(Copy)\', `descripcion` = \'<p><strong>SERVICIO 1 <span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/aj', '2017-11-16 03:30:31');
INSERT INTO `sys_log` VALUES (54, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios` SET `id_lang` = \'2\', `id_metatag` = \'5\', `titulo` = \'SERVICIO 1(Copy)\', `descripcion` = \'<p><strong>SERVICIO 1 <span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"background: url(https://cdnjs.cloudflare.com/aj', '2017-11-16 03:31:11');
INSERT INTO `sys_log` VALUES (55, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios_sliders` SET `id_servicio_slide` = \'8\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_servicio_slide` = \'8\'', '2017-11-16 03:31:11');
INSERT INTO `sys_log` VALUES (56, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios_sliders` (`descripcion`, `id_servicio`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'cascsacsccsa\\r\\n                            \',\'3\',\'1\',\'assets/img/uploads/20171116/IMG_20160717_2152123.jpg\',\'cascas\')', '2017-11-16 03:31:11');
INSERT INTO `sys_log` VALUES (57, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios` (`id_lang`, `id_metatag`, `titulo`, `descripcion`, `portada`, `slug`, `id_usuario`) VALUES (\'2\', \'5\', \'SERVICIO 1(Copy)(Copy)\', \'<p><strong>SERVICIO 1 <span class=\\\"fr-emoticon fr-deletable fr-emoticon-img\\\" style=\\\"ba', '2017-11-16 03:31:44');
INSERT INTO `sys_log` VALUES (58, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_servicios_sliders` (`descripcion`, `id_servicio`, `id_usuario`, `ruta_img`, `titulo`) VALUES (\'JUNIOR\',4,\'1\',\'assets/img/uploads/20171116/IMG_20151219_062754-COLLAGE1.jpg\',\'JUNIOR\'), (\'fdsfsdfsdf\',4,\'1\',\'assets/img/uploads/201711', '2017-11-16 03:31:44');
INSERT INTO `sys_log` VALUES (59, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios` SET `id_servicio` = \'4\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_servicio` = \'4\'', '2017-11-16 03:31:50');
INSERT INTO `sys_log` VALUES (60, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_servicios_sliders` SET `id_servicio` = \'4\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_servicio` = \'4\'', '2017-11-16 03:31:50');
INSERT INTO `sys_log` VALUES (61, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_clientes` (`cliente`, `orden`, `id_usuario`, `ruta_img`) VALUES (\'prueba\', \'1\', \'1\', \'assets/img/uploads/20171118/aloft.jpg\')', '2017-11-18 15:39:38');
INSERT INTO `sys_log` VALUES (62, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `arbibe`.`tbl_clientes` (`cliente`, `orden`, `id_usuario`, `ruta_img`) VALUES (\'prueba\', \'2\', \'1\', \'assets/img/uploads/20171118/corporativo-sunglass.jpg\')', '2017-11-18 15:40:33');
INSERT INTO `sys_log` VALUES (63, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = \'2\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_cliente` = \'2\'', '2017-11-18 15:49:00');
INSERT INTO `sys_log` VALUES (64, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = \'1\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_cliente` = \'1\'', '2017-11-18 15:49:03');
INSERT INTO `sys_log` VALUES (65, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = NULL, `cliente` = \'prueba_edit\', `id_usuario_edit` = \'1\', `ruta_img` = \'assets/img/uploads/20171118/four-points-1.jpg\'\nWHERE `id_cliente` IS NULL', '2017-11-18 16:02:18');
INSERT INTO `sys_log` VALUES (66, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = NULL, `cliente` = \'prueba121221\', `id_usuario_edit` = \'1\', `ruta_img` = \'assets/img/uploads/20171118/casa-playacar.jpg\'\nWHERE `id_cliente` IS NULL', '2017-11-18 16:03:32');
INSERT INTO `sys_log` VALUES (67, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = \'1\', `cliente` = \'pruebasadsdasd\', `id_usuario_edit` = \'1\', `ruta_img` = \'assets/img/uploads/20171118/hotel-el-carmen.jpg\'\nWHERE `id_cliente` = \'1\'', '2017-11-18 16:05:02');
INSERT INTO `sys_log` VALUES (68, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = \'2\', `cliente` = \'pruebadsadasd\', `id_usuario_edit` = \'1\', `ruta_img` = \'assets/img/uploads/20171118/cacao-experience1.jpg\'\nWHERE `id_cliente` = \'2\'', '2017-11-18 16:07:10');
INSERT INTO `sys_log` VALUES (69, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = \'2\', `cliente` = \'pruebadsadasd\', `id_usuario_edit` = \'1\'\nWHERE `id_cliente` = \'2\'', '2017-11-18 16:08:03');
INSERT INTO `sys_log` VALUES (70, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = \'2\', `cliente` = \'pruebadsadasd\', `orden` = \'2\', `id_usuario_edit` = \'1\'\nWHERE `id_cliente` = \'2\'', '2017-11-18 16:08:30');
INSERT INTO `sys_log` VALUES (71, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = \'1\', `cliente` = \'test\', `orden` = \'14444\', `id_usuario_edit` = \'1\'\nWHERE `id_cliente` = \'1\'', '2017-11-18 16:11:39');
INSERT INTO `sys_log` VALUES (72, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `arbibe`.`tbl_clientes` SET `id_cliente` = \'2\', `id_usuario_edit` = \'1\', `activo` = 0\nWHERE `id_cliente` = \'2\'', '2017-11-18 16:11:47');
INSERT INTO `sys_log` VALUES (73, 32, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_usuarios` SET `id_usuario` = \'32\', `username` = \'Shernandez\', `id_rol` = \'2\', `id_perfil` = \'1\', `id_lang` = \'1\', `dias_expiracion` = \'91\'\nWHERE `id_usuario` = \'32\'', '2018-08-14 04:10:24');
INSERT INTO `sys_log` VALUES (74, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_personales` SET `id_personal` = \'24\', `nombre` = \'PRUEBA\', `paterno` = \'DEL\', `materno` = \'SYSTEM\', `correo_emp` = \'localhost@prueba\', `tel_movil` = \'55555\', `id_usuario_update` = \'1\'\nWHERE `id_personal` = \'24\'', '2018-08-14 04:10:54');
INSERT INTO `sys_log` VALUES (75, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_personales` SET `id_personal` = \'23\', `nombre` = \'Saúl\', `paterno` = \'Hernández\', `materno` = \'Nicasio\', `correo_emp` = \'shernandez_developer@outlook.com\', `tel_movil` = \'w\', `id_usuario_update` = \'1\'\nWHERE `id_personal` = \'23\'', '2018-08-14 04:11:14');
INSERT INTO `sys_log` VALUES (76, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_personales` SET `id_personal` = \'23\', `nombre` = \'Saúl\', `paterno` = \'Hernández\', `materno` = \'Nicasio\', `correo_emp` = \'shernandez_developer@outlook.com\', `tel_movil` = \'w\', `id_usuario_update` = \'1\'\nWHERE `id_personal` = \'23\'', '2018-08-14 04:12:29');
INSERT INTO `sys_log` VALUES (77, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_personales` SET `id_personal` = \'23\', `nombre` = \'Saúl\', `paterno` = \'Hernández\', `materno` = \'Nicasio\', `correo_emp` = \'shernandez_developer@outlook.com\', `tel_movil` = \'w\', `id_usuario_update` = \'1\'\nWHERE `id_personal` = \'23\'', '2018-08-14 04:12:38');
INSERT INTO `sys_log` VALUES (78, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_personales` SET `id_personal` = \'23\', `nombre` = \'Saúl\', `paterno` = \'Hernández\', `materno` = \'Nicasio\', `correo_emp` = \'shernandez_developer@outlook.com\', `tel_movil` = \'w\', `id_usuario_update` = \'1\'\nWHERE `id_personal` = \'23\'', '2018-08-14 04:13:20');
INSERT INTO `sys_log` VALUES (79, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_personales` SET `id_personal` = \'23\', `nombre` = \'Saúl\', `paterno` = \'Hernández\', `materno` = \'Nicasio\', `correo_emp` = \'shernandez_developer@outlook.com\', `tel_movil` = \'w\', `id_usuario_update` = \'1\'\nWHERE `id_personal` = \'23\'', '2018-08-14 04:13:29');
INSERT INTO `sys_log` VALUES (80, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_personales` SET `id_personal` = \'23\', `nombre` = \'Saúl\', `paterno` = \'Hernández\', `materno` = \'Nicasio\', `correo_emp` = \'shernandez_developer@outlook.com\', `tel_movil` = \'w\', `id_usuario_update` = \'1\'\nWHERE `id_personal` = \'23\'', '2018-08-14 04:15:44');
INSERT INTO `sys_log` VALUES (81, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_personales` SET `id_personal` = \'23\', `nombre` = \'Saúl\', `paterno` = \'Hernández\', `materno` = \'Nicasio\', `correo_emp` = \'shernandez_developer@outlook.com\', `tel_movil` = \'w\', `id_usuario_update` = \'1\'\nWHERE `id_personal` = \'23\'', '2018-08-14 04:16:15');
INSERT INTO `sys_log` VALUES (82, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `ecommerce`.`sys_personales` (`nombre`, `paterno`, `materno`, `tel_movil`, `correo_emp`, `id_usuario`) VALUES (\'prueba\', \'demos\', \'usuario\', \'\', \'hernan.06_saul@hotmail.com\', \'1\')', '2018-08-14 04:19:24');
INSERT INTO `sys_log` VALUES (83, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `ecommerce`.`sys_usuarios` (`id_personal`, `id_rol`, `id_perfil`, `dias_expiracion`, `id_lang`, `username`, `token`) VALUES (33, \'3\', \'7\', \'91\', \'1\', \'Pdemos\', \'5a0d60ad5efe68f84f05cfb1df08067c\')', '2018-08-14 04:19:24');
INSERT INTO `sys_log` VALUES (84, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `ecommerce`.`sys_personales` (`nombre`, `paterno`, `materno`, `tel_movil`, `correo_emp`, `id_usuario`) VALUES (\'system\', \'test\', \'\', \'\', \'hernan.06_saul@hotmail.com\', \'1\')', '2018-08-14 04:21:38');
INSERT INTO `sys_log` VALUES (85, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'INSERT INTO `ecommerce`.`sys_usuarios` (`id_personal`, `id_rol`, `id_perfil`, `dias_expiracion`, `id_lang`, `username`, `token`) VALUES (34, \'5\', \'6\', \'91\', \'1\', \'Stest\', \'6a3a8f3d87bc4a5bf53f9e9355d57cc5\')', '2018-08-14 04:21:38');
INSERT INTO `sys_log` VALUES (86, 34, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_usuarios` SET `id_usuario` = \'34\', `username` = \'Stest\', `id_rol` = \'5\', `id_perfil` = \'6\', `id_lang` = \'1\', `dias_expiracion` = \'91\'\nWHERE `id_usuario` = \'34\'', '2018-08-14 04:22:29');
INSERT INTO `sys_log` VALUES (87, 34, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_usuarios` SET `id_usuario` = \'34\', `username` = \'Stest\', `id_rol` = \'4\', `id_perfil` = \'6\', `id_lang` = \'1\', `dias_expiracion` = \'91\'\nWHERE `id_usuario` = \'34\'', '2018-08-14 04:22:38');
INSERT INTO `sys_log` VALUES (88, 34, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_usuarios` SET `id_usuario` = \'34\', `username` = \'Stest\', `id_rol` = \'4\', `id_perfil` = \'5\', `id_lang` = \'1\', `dias_expiracion` = \'91\'\nWHERE `id_usuario` = \'34\'', '2018-08-14 04:22:47');
INSERT INTO `sys_log` VALUES (89, 34, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_usuarios` SET `id_usuario` = \'34\', `username` = \'Stest\', `id_rol` = \'4\', `id_perfil` = \'5\', `id_lang` = \'2\', `dias_expiracion` = \'91\'\nWHERE `id_usuario` = \'34\'', '2018-08-14 04:22:54');
INSERT INTO `sys_log` VALUES (90, 34, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_usuarios` SET `id_usuario` = \'34\', `username` = \'Stest\', `id_rol` = \'2\', `id_perfil` = \'5\', `id_lang` = \'2\', `dias_expiracion` = \'91\'\nWHERE `id_usuario` = \'34\'', '2018-08-14 04:23:06');
INSERT INTO `sys_log` VALUES (91, 34, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_usuarios` SET `id_usuario` = \'34\', `activo` = 0\nWHERE `id_usuario` = \'34\'', '2018-08-14 04:25:15');
INSERT INTO `sys_log` VALUES (92, 34, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'UPDATE `ecommerce`.`sys_usuarios` SET `id_usuario` = \'34\', `activo` = 1\nWHERE `id_usuario` = \'34\'', '2018-08-14 04:25:25');
INSERT INTO `sys_log` VALUES (93, 1, '::1', 'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/56.0.2924.87 Safari/537.36', 'Cierre de sesión', '2018-08-14 05:31:06');

-- ----------------------------
-- Table structure for sys_menus
-- ----------------------------
DROP TABLE IF EXISTS `sys_menus`;
CREATE TABLE `sys_menus`  (
  `id_menu` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Esta tabla identifica los men├║s que se muestran en la p├ígina de sicac',
  `id_padre` int(11) NOT NULL DEFAULT 0,
  `short_key` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `nivel` enum('padre','padre_n2','hijo','simple') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `posicion` enum('HORIZONTAL','VERTICAL') CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `toggle` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `orden_menu` int(2) NULL DEFAULT NULL,
  `url` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `icono` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `orden_submenu` int(2) NOT NULL DEFAULT 1,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'Nombre que identifica al menu',
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `activo` tinyint(1) NULL DEFAULT 1,
  PRIMARY KEY (`id_menu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_menus
-- ----------------------------
INSERT INTO `sys_menus` VALUES (1, 0, 'menu_dashboard', 'simple', 'VERTICAL', NULL, 1, 'admin/dashboard', 'dashboard', 1, 'Enlace para el Dashboard', '2017-02-25 15:08:08', 1);
INSERT INTO `sys_menus` VALUES (2, 0, 'menu_home', 'simple', 'HORIZONTAL', NULL, 1, 'home', 'home', 1, 'Enlace para el Home', '2017-02-25 15:09:52', 0);
INSERT INTO `sys_menus` VALUES (3, 0, 'menu_user', 'padre', 'HORIZONTAL', 'dropdown', 2, '#', 'perm_identity', 0, 'Enlace para las opciones del perfil', '2017-02-25 15:11:21', 1);
INSERT INTO `sys_menus` VALUES (4, 3, 'menu_cuenta', 'hijo', 'HORIZONTAL', NULL, NULL, 'admin/cuenta', '', 1, 'Enlace para ir al perfil', '2017-02-25 15:20:18', 0);
INSERT INTO `sys_menus` VALUES (5, 3, 'menu_loguot', 'hijo', 'HORIZONTAL', NULL, NULL, 'admin/logout', '', 2, 'Enlace para desloguearse', '2017-02-25 15:20:57', 1);
INSERT INTO `sys_menus` VALUES (6, 0, 'menu_catalogos', 'padre', 'VERTICAL', 'collapse', 3, 'admin/catalogos', 'assignment', 1, NULL, '2017-05-25 00:07:14', 1);
INSERT INTO `sys_menus` VALUES (7, 10, 'menu_usuarios', 'hijo', 'VERTICAL', NULL, NULL, 'admin/usuarios', '', 2, 'admin users', '2017-06-24 16:42:11', 1);
INSERT INTO `sys_menus` VALUES (8, 10, 'menu_perfiles', 'hijo', 'VERTICAL', NULL, 4, 'admin/perfiles', '', 1, 'admin perfiles', '2017-06-24 16:44:37', 1);
INSERT INTO `sys_menus` VALUES (9, 10, 'menu_personales', 'hijo', 'VERTICAL', NULL, NULL, 'admin/personales', '', 1, 'personales cun cuenta para el acceso al sstema', '2017-07-13 00:03:02', 1);
INSERT INTO `sys_menus` VALUES (10, 0, 'menu_admin', 'padre', 'VERTICAL', 'collapse', 2, 'admin/administracion', 'assignment_turned_in', 1, NULL, '2017-07-26 18:58:11', 1);

-- ----------------------------
-- Table structure for sys_municipios
-- ----------------------------
DROP TABLE IF EXISTS `sys_municipios`;
CREATE TABLE `sys_municipios`  (
  `id_municipio` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_estado` int(11) NOT NULL,
  `clave_municipio` int(11) NOT NULL,
  `municipio` varchar(80) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_municipio`, `id_estado`, `clave_municipio`) USING BTREE,
  INDEX `id_estado`(`id_estado`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_municipios
-- ----------------------------
INSERT INTO `sys_municipios` VALUES (1, 9, 2, 'Azcapotzalco');
INSERT INTO `sys_municipios` VALUES (2, 9, 3, 'Coyoacán');
INSERT INTO `sys_municipios` VALUES (3, 9, 4, 'Cuajimalpa de Morelos');
INSERT INTO `sys_municipios` VALUES (4, 9, 5, 'Gustavo A. Madero');
INSERT INTO `sys_municipios` VALUES (5, 9, 6, 'Iztacalco');
INSERT INTO `sys_municipios` VALUES (6, 9, 7, 'Iztapalapa');
INSERT INTO `sys_municipios` VALUES (7, 9, 8, 'La Magdalena Contreras');
INSERT INTO `sys_municipios` VALUES (8, 9, 9, 'Milpa Alta');
INSERT INTO `sys_municipios` VALUES (9, 9, 10, 'Álvaro Obregón');
INSERT INTO `sys_municipios` VALUES (10, 9, 11, 'Tláhuac');
INSERT INTO `sys_municipios` VALUES (11, 9, 12, 'Tlalpan');
INSERT INTO `sys_municipios` VALUES (12, 9, 13, 'Xochimilco');
INSERT INTO `sys_municipios` VALUES (13, 9, 14, 'Benito Juárez');
INSERT INTO `sys_municipios` VALUES (14, 9, 15, 'Cuauhtémoc');
INSERT INTO `sys_municipios` VALUES (15, 9, 16, 'Miguel Hidalgo');
INSERT INTO `sys_municipios` VALUES (16, 9, 17, 'Venustiano Carranza');

-- ----------------------------
-- Table structure for sys_paises
-- ----------------------------
DROP TABLE IF EXISTS `sys_paises`;
CREATE TABLE `sys_paises`  (
  `id_pais` int(3) NOT NULL AUTO_INCREMENT,
  `pais` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `capital` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `id_lang` int(5) NOT NULL,
  `descripcion` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_pais`) USING BTREE,
  UNIQUE INDEX `unico`(`pais`) USING BTREE,
  INDEX `id_lang`(`id_lang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_paises
-- ----------------------------
INSERT INTO `sys_paises` VALUES (1, 'México', 'Ciudad de México', 1, '', 1);
INSERT INTO `sys_paises` VALUES (2, 'Estados Unidos', 'Washington D. C.', 2, '', 1);

-- ----------------------------
-- Table structure for sys_personales
-- ----------------------------
DROP TABLE IF EXISTS `sys_personales`;
CREATE TABLE `sys_personales`  (
  `id_personal` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `paterno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `materno` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_area` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `correo_personal` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel_movil` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel_casa` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `direccion` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_estado` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_municipio` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_localidad` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `codigo_postal` int(5) NULL DEFAULT NULL,
  `fecha_nacimiento` date NULL DEFAULT NULL,
  `correo_emp` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel_emp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tel_movil_emp` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `ext` varchar(5) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_update` int(1) NULL DEFAULT NULL,
  `timestamp_update` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_personal`) USING BTREE,
  UNIQUE INDEX `correo_personal`(`correo_personal`) USING BTREE,
  INDEX `id_area`(`id_area`) USING BTREE,
  INDEX `id_localidad`(`id_localidad`) USING BTREE,
  INDEX `id_estado`(`id_estado`) USING BTREE,
  INDEX `id_usuario`(`id_usuario`) USING BTREE,
  INDEX `id_usuario_update`(`id_usuario_update`) USING BTREE,
  INDEX `id_municipio`(`id_municipio`) USING BTREE,
  INDEX `tel_movil`(`tel_movil`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_personales
-- ----------------------------
INSERT INTO `sys_personales` VALUES (1, 'ROOT', 'DEL', 'SISTEMA', '0', 'hernan.06_saul@hotmail.com', '5569722848', NULL, 'DF', '', NULL, '', 0, '0000-00-00', '', '', '', NULL, 0, '2017-07-13 22:52:44', NULL, '2017-07-13 23:02:13', 0);
INSERT INTO `sys_personales` VALUES (23, 'Saúl', 'Hernández', 'Nicasio', '5', 'shernandez_developer@outlook.com1', 'w', 'w', 'LA INDEPEND', '24', '1871', '213184', 79973, '0000-00-00', 'shernandez_developer@outlook.com', '111', 'dd', '111', 1, '2017-08-03 00:19:53', 1, '2017-08-17 23:19:55', 1);
INSERT INTO `sys_personales` VALUES (24, 'PRUEBA', 'DEL', 'SYSTEM', '7', 'localhost@prueba', '55555', '55555', 'los mangos ', '24', '1871', '213184', 79973, '0000-00-00', 'localhost@prueba', '55555', '345543', '66666', 1, '2017-08-17 23:33:10', 1, '2017-08-18 00:44:16', 1);
INSERT INTO `sys_personales` VALUES (25, 'PRUEBA1', 'DEL1', 'SYSTEM1', '2', 'test@localhost', '22', '22', 'mmmmmmmmmmm', '24', '1817', '204298', 79767, '0000-00-00', 'test@localhost', '333', '333', '333', 1, '2017-08-17 23:37:52', 1, '2017-08-18 00:44:16', 1);
INSERT INTO `sys_personales` VALUES (26, 'USUARIO', 'NO', 'CREADO', '5', 'prueba@prueba', '', '', 'prueba@prue', '1', '1', '3', 456, '0000-00-00', 'prueba@prueba', '4566342', '123456789', '12323', 1, '2017-08-17 23:48:09', 1, '2017-11-03 02:17:27', 0);
INSERT INTO `sys_personales` VALUES (32, 'Saul', 'hernandez', 'nicasio', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'telpocatzin@outlook.com', NULL, NULL, NULL, 1, '2017-11-03 01:43:42', NULL, NULL, 1);
INSERT INTO `sys_personales` VALUES (34, 'system', 'test', '', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'hernan.06_saul@hotmail.com', NULL, NULL, NULL, 1, '2018-08-14 04:21:38', NULL, NULL, 1);

-- ----------------------------
-- Table structure for sys_usuarios
-- ----------------------------
DROP TABLE IF EXISTS `sys_usuarios`;
CREATE TABLE `sys_usuarios`  (
  `id_usuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `id_personal` int(11) NOT NULL,
  `id_rol` int(2) NULL DEFAULT NULL,
  `id_perfil` int(5) NOT NULL,
  `username` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `password` varchar(100) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_spanish_ci NULL DEFAULT NULL,
  `dias_expiracion` int(2) NULL DEFAULT 91 COMMENT 'ingrese 0 para indefinido',
  `intentos_fallidos` int(1) NULL DEFAULT 0,
  `id_lang` int(5) NOT NULL,
  `id_archivo` int(11) NULL DEFAULT NULL,
  `inicio` varchar(50) CHARACTER SET utf8 COLLATE utf8_spanish_ci NOT NULL DEFAULT 'admin/home',
  `fecha_creacion` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `update_pass` timestamp(0) NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP(0),
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_usuario`) USING BTREE,
  UNIQUE INDEX `id_personal`(`id_personal`) USING BTREE,
  INDEX `perfilusuario`(`id_perfil`) USING BTREE,
  INDEX `archivo`(`id_archivo`) USING BTREE,
  INDEX `id_lang`(`id_lang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8 COLLATE = utf8_spanish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of sys_usuarios
-- ----------------------------
INSERT INTO `sys_usuarios` VALUES (1, 1, 1, 0, 'root', '7b24afc8bc80e548d66c4e7ff72171c5', NULL, 0, 0, 1, 0, 'admin/dashboard', '2017-06-24 05:08:09', '2017-11-15 03:41:27', 1);
INSERT INTO `sys_usuarios` VALUES (20, 23, 2, 7, 'shernandez_developer@outlook.com', '24ba209995b0df0f83ea83ab0abc2558', '0bde0d5c194e2543e396ccd19b9fddf4', 91, 0, 1, NULL, 'admin/home', '2017-08-03 00:19:53', '2017-11-02 23:55:37', 0);
INSERT INTO `sys_usuarios` VALUES (21, 24, 2, 1, 'localhost@prueba', '', 'c1576fe8c29b150655e9354e7a28992f', 91, 0, 1, NULL, 'admin/home', '2017-08-17 23:33:10', '2017-11-02 23:55:38', 1);
INSERT INTO `sys_usuarios` VALUES (22, 25, 4, 1, 'test123', '', '099604dab70cb1e8ee5586880bce57fc', 91, 0, 1, NULL, 'admin/home', '2017-08-17 23:37:52', '2017-11-03 02:17:22', 1);
INSERT INTO `sys_usuarios` VALUES (26, 26, 3, 6, 'test1234', 'e4e251542f2ad32970c7941b3ff865f2', '', 91, 0, 1, NULL, 'admin/home', '2017-08-19 14:03:25', '2017-11-03 02:17:27', 0);
INSERT INTO `sys_usuarios` VALUES (32, 32, 2, 1, 'Shernandez', 'd2a29418b64297bd841eedc67fff7118', '', 91, 0, 1, NULL, 'admin/home', '2017-11-03 01:43:42', '2017-11-03 02:17:14', 1);
INSERT INTO `sys_usuarios` VALUES (34, 34, 2, 5, 'Stest', '', '6a3a8f3d87bc4a5bf53f9e9355d57cc5', 91, 0, 2, NULL, 'admin/home', '2018-08-14 04:21:38', '2018-08-14 04:25:25', 1);

-- ----------------------------
-- Table structure for tbl_archivos
-- ----------------------------
DROP TABLE IF EXISTS `tbl_archivos`;
CREATE TABLE `tbl_archivos`  (
  `id_archivo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'carga de archivos del sitio',
  `fecha` datetime(0) NULL DEFAULT NULL COMMENT 'fecha en la que se subió el archivo',
  `nombre` varchar(350) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'nombre del archivo',
  `archivo` longblob NOT NULL,
  `extension` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'extensión del archivo',
  `mime` varchar(450) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `usuario` int(11) NOT NULL COMMENT 'usuario que subió el archivo',
  `comentario` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_archivo`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- View structure for vw_personales_usuarios
-- ----------------------------
DROP VIEW IF EXISTS `vw_personales_usuarios`;
CREATE VIEW `vw_personales_usuarios` AS select `TP`.`id_personal` AS `id_personal`,`TU`.`id_usuario` AS `id_usuario`,`TP`.`nombre` AS `nombre`,`TP`.`paterno` AS `paterno`,`TP`.`materno` AS `materno`,`TP`.`id_area` AS `id_area`,`TP`.`correo_personal` AS `correo_personal`,`TP`.`tel_movil` AS `tel_movil`,`TP`.`tel_casa` AS `tel_casa`,`TP`.`direccion` AS `direccion`,`TP`.`id_estado` AS `id_estado`,`TP`.`id_municipio` AS `id_municipio`,`TP`.`id_localidad` AS `id_localidad`,`TP`.`codigo_postal` AS `codigo_postal`,`TP`.`fecha_nacimiento` AS `fecha_nacimiento`,`TP`.`correo_emp` AS `correo_emp`,`TP`.`correo_emp` AS `email`,`TP`.`tel_emp` AS `tel_emp`,`TP`.`tel_movil_emp` AS `tel_movil_emp`,`TP`.`ext` AS `ext`,`TU`.`id_perfil` AS `id_perfil`,`TPF`.`perfil` AS `perfil`,`CR`.`id_rol` AS `id_rol`,`CR`.`rol` AS `rol`,`TU`.`username` AS `username`,`TU`.`password` AS `password`,`TU`.`id_lang` AS `id_lang`,`TU`.`token` AS `token`,`SL`.`short_key` AS `short_key`,`TU`.`inicio` AS `inicio`,`TU`.`id_archivo` AS `id_archivo`,`TU`.`activo` AS `activo`,`TU`.`dias_expiracion` AS `dias_expiracion`,`TU`.`intentos_fallidos` AS `intentos_fallidos`,(to_days(curdate()) - to_days(`TU`.`update_pass`)) AS `dias_transcurridos` from (((((`sys_personales` `TP` left join `sys_usuarios` `TU` on(((`TP`.`id_personal` = `TU`.`id_personal`) and (`TU`.`activo` = 1)))) left join `cat_roles` `CR` on((`TU`.`id_rol` = `CR`.`id_rol`))) left join `sys_languages` `SL` on((`TU`.`id_lang` = `SL`.`id_lang`))) left join `cat_perfiles` `TPF` on((`TU`.`id_perfil` = `TPF`.`id_perfil`))) left join `tbl_archivos` `TA` on((`TU`.`id_archivo` = `TA`.`id_archivo`)));

SET FOREIGN_KEY_CHECKS = 1;
