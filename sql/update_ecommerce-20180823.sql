CREATE TABLE `cat_categorias` (
  `id_categoria` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) DEFAULT NULL,
  `categoria` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_edit` int(11) DEFAULT NULL,
  `timestamp_edit` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_categoria`) USING BTREE,
  KEY `id_usuario` (`id_usuario`),
  KEY `id_usuario_edit` (`id_usuario_edit`),
  KEY `activo` (`activo`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

CREATE TABLE `ecommerce`.`cat_laboratorios`  (
  `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NULL,
  `laboratorio` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_edit` int(11) NULL,
  `timestamp_edit` timestamp NULL ON UPDATE CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_laboratorio`),
  INDEX(`id_usuario`),
  INDEX(`id_usuario_edit`),
  INDEX(`activo`)
) ENGINE = MyISAM DEFAULT CHARSET = utf8;

CREATE TABLE `ecommerce`.`cat_presentaciones` (
  `id_presentacion` int ( 11 ) NOT NULL AUTO_INCREMENT,
  `clave` varchar ( 50 ) DEFAULT NULL,
  `presentacion` varchar ( 255 ) NOT NULL,
  `id_usuario` int ( 11 ) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_edit` int ( 11 ) DEFAULT NULL,
  `timestamp_edit` timestamp NULL ON UPDATE CURRENT_TIMESTAMP,
  `activo` tinyint ( 1 ) NOT NULL DEFAULT '1',
  PRIMARY KEY ( `id_presentacion` ) USING BTREE, 
  INDEX(`id_usuario`),
  INDEX(`id_usuario_edit`),
  INDEX(`activo`)
) ENGINE = MyISAM DEFAULT CHARSET = utf8;

CREATE TABLE `tbl_productos` (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_categoria` int(11) NOT NULL,
  `id_presentacion` int(11) DEFAULT NULL,
  `id_laboratorio` int(11) NOT NULL,
  `nombre_generico` varchar(255) NOT NULL,
  `nombre_comercial` varchar(255) DEFAULT NULL,
  `concentracion` varchar(100) DEFAULT NULL,
  `contenido` varchar(100) DEFAULT NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_edit` int(11) DEFAULT NULL,
  `timestamp_edit` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_producto`) USING BTREE,
  KEY `id_categoria` (`id_categoria`)
  KEY `id_presentacion` (`id_presentacion`),
  KEY `id_laboratorio` (`id_laboratorio`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_usuario_edit` (`id_usuario_edit`),
  KEY `activo` (`activo`),
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `ecommerce`.`cat_roles` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`sys_menus` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`sys_paises` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`sys_estados` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`cat_perfiles` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`sys_languages` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`sys_municipios` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`sys_localidades` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`cat_laboratorios` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`cat_presentaciones` ENGINE = MyISAM;
ALTER TABLE `ecommerce`.`cat_tipos_personales` ENGINE = MyISAM;


INSERT INTO `ecommerce`.`sys_menus`(`id_padre`, `short_key`, `nivel`, `posicion`, `orden_menu`, `url`, `icono` , `descripcion`) 
  VALUES (0, 'menu_productos', 'simple', 'VERTICAL', 4, 'admin/productos', 'local_pharmacy', 'productos de las farmacias ');

INSERT INTO `ecommerce`.`sys_menus`(`id_padre`, `short_key`, `nivel`, `posicion`, `orden_menu`, `url`) 
VALUES (6, 'menu_laboratorios', 'hijo', 'VERTICAL', 1, 'admin/laboratorios');

INSERT INTO `ecommerce`.`sys_menus`(`id_padre`, `short_key`, `nivel`, `posicion`, `orden_menu`, `url`) 
VALUES (6, 'menu_presentaciones', 'hijo', 'VERTICAL', 2, 'admin/presentaciones');

INSERT INTO `ecommerce`.`sys_menus`(`id_padre`, `short_key`, `nivel`, `posicion`, `url`) 
VALUES (6, 'menu_categoria', 'hijo', 'VERTICAL', 'admin/categorias');
