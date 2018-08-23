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

CREATE TABLE `ecommerce`.`cat_laboratorios`  (
  `id_laboratorio` int(11) NOT NULL AUTO_INCREMENT,
  `clave` varchar(50) NULL,
  `laboratorio` varchar(255) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_edit` int(11) NULL,
  `timestamp_edit` timestamp NULL ON UPDATE CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id_laboratorio`)
  INDEX(`id_usuario`),
  INDEX(`id_usuario_edit`),
  INDEX(`activo`)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

CREATE TABLE `ecommerce`.`cat_presentaciones` (
  `id_presentacion` int ( 11 ) NOT NULL AUTO_INCREMENT,
  `clave` varchar ( 50 ) DEFAULT NULL,
  `presentacion` varchar ( 255 ) NOT NULL,
  `id_usuario` int ( 11 ) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_edit` int ( 11 ) DEFAULT NULL,
  `timestamp_edit` timestamp NULL ON UPDATE CURRENT_TIMESTAMP,
  `activo` tinyint ( 1 ) NOT NULL DEFAULT '1',
  PRIMARY KEY ( `id_presentacion` ) USING BTREE 
  INDEX(`id_usuario`),
  INDEX(`id_usuario_edit`),
  INDEX(`activo`)
) ENGINE = INNODB DEFAULT CHARSET = utf8;

CREATE TABLE `ecommerce`.`tbl_productos`  (
  `id_producto` int(11) NOT NULL AUTO_INCREMENT,
  `id_presentacion` int(11) NULL,
  `id_laboratorio` int(11) NOT NULL,
  `nombre_generico` varchar(255) NOT NULL,
  `nombre_comercial` varchar(255) NULL,
  `concentracion` varchar(100) NULL,
  `contenido` varchar(100) NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_edit` int(11) NULL,
  `timestamp_edit` timestamp NULL ON UPDATE CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  PRIMARY KEY ( `id_producto` ) USING BTREE 
  INDEX(`id_presentacion`),
  INDEX(`id_laboratorio`),
  INDEX(`id_usuario`),
  INDEX(`id_usuario_edit`),
  INDEX(`activo`)
) ENGINE = INNODB DEFAULT CHARSET = utf8;