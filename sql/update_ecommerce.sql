ALTER TABLE `ecommerce`.`tbl_empresas` 
MODIFY COLUMN `id_estado` int(11) NOT NULL DEFAULT 9 AFTER `id_pais`;

ALTER TABLE `ecommerce`.`tbl_sucursales` 
MODIFY COLUMN `id_estado` int(11) NOT NULL DEFAULT 9 AFTER `id_pais`;

CREATE TABLE `tbl_empresas_empleados` (
  `id_empresa_empleado` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `id_sucursal` int(11) NOT NULL,
  `id_personal` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `id_usuario_edit` int(11) DEFAULT NULL,
  `timestam_edit` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `activo` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_empresa_empleado`),
  KEY `id_empresa` (`id_empresa`),
  KEY `id_sucursal` (`id_sucursal`),
  KEY `id_personal` (`id_personal`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_usuario_edit` (`id_usuario_edit`),
  KEY `activo` (`activo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;