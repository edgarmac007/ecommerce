ALTER TABLE `ecommerce`.`tbl_empresas` 
MODIFY COLUMN `id_estado` int(11) NOT NULL DEFAULT 9 AFTER `id_pais`;

ALTER TABLE `ecommerce`.`tbl_sucursales` 
MODIFY COLUMN `id_estado` int(11) NOT NULL DEFAULT 9 AFTER `id_pais`;