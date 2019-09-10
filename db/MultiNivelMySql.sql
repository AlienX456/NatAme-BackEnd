/* ---------------------------------------------------- */
/*  Generated by Enterprise Architect Version 13.5 		*/
/*  Created On : 09-Sep-2019 5:41:52 PM 				*/
/*  DBMS       : MySql 						*/
/* ---------------------------------------------------- */

SET FOREIGN_KEY_CHECKS=0 
;

/* Drop Tables */

DROP TABLE IF EXISTS `Categoria` CASCADE
;

DROP TABLE IF EXISTS `Cliente` CASCADE
;

DROP TABLE IF EXISTS `Cliente_Pedido` CASCADE
;

DROP TABLE IF EXISTS `Grado` CASCADE
;

DROP TABLE IF EXISTS `Impuesto` CASCADE
;

DROP TABLE IF EXISTS `ModoDePago` CASCADE
;

DROP TABLE IF EXISTS `Pais` CASCADE
;

DROP TABLE IF EXISTS `Pedido` CASCADE
;

DROP TABLE IF EXISTS `Producto` CASCADE
;

DROP TABLE IF EXISTS `Producto_pedido` CASCADE
;

DROP TABLE IF EXISTS `Producto_Region` CASCADE
;

DROP TABLE IF EXISTS `Producto_Subcategoria` CASCADE
;

DROP TABLE IF EXISTS `Region` CASCADE
;

DROP TABLE IF EXISTS `RepresentanteVentas` CASCADE
;

DROP TABLE IF EXISTS `RepresentanteVentas_Cliente` CASCADE
;

DROP TABLE IF EXISTS `Subcategoria` CASCADE
;

/* Create Tables */

CREATE TABLE `Categoria`
(
	`IDCATEGORIA` DECIMAL(8,0) NOT NULL,
	`NOMBRECATEGORIA` VARCHAR(50) NULL,
	CONSTRAINT `PK_CATEOGORIA` PRIMARY KEY (`IDCATEGORIA` ASC)
)

;

CREATE TABLE `Cliente`
(
	`CEDULA` DECIMAL(8,0) NOT NULL,
	`NOMBRECLIENTE` VARCHAR(50) NULL,
	`APELLIDOCLIENTE` VARCHAR(50) NULL,
	`TELEFONO` VARCHAR(50) NULL,
	`DIRECCION` VARCHAR(50) NULL,
	`CIUDAD` VARCHAR(50) NULL,
	`CORREOELECTRONICO` VARCHAR(50) NULL,
	CONSTRAINT `PK_CLIENTE` PRIMARY KEY (`CEDULA` ASC)
)

;

CREATE TABLE `Cliente_Pedido`
(
	`FECHAPEDIDO` DATETIME NULL,
	`IDPEDIDO` DECIMAL(8,0) NULL,
	`CEDULA` DECIMAL(8,0) NULL,
	`IDCLIENTEPEDIDO` DECIMAL(8,0) NOT NULL,
	CONSTRAINT `PK_Cliente_Pedi_01` PRIMARY KEY (`IDCLIENTEPEDIDO` ASC)
)

;

CREATE TABLE `Grado`
(
	`IDGRADO` DECIMAL(8,2) NOT NULL,
	`NOMBREGRADO` VARCHAR(50) NULL,
	`DESCRIPCIONGRADO` VARCHAR(50) NULL,
	CONSTRAINT `PK_GRADO` PRIMARY KEY (`IDGRADO` ASC)
)

;

CREATE TABLE `Impuesto`
(
	`IDIMPUESTO` DECIMAL(8,0) NOT NULL,
	`IVA` DECIMAL(4,2) NOT NULL,
	`TIPOPRODUCTO` VARCHAR(50) NULL,
	`FECHAINICIO` DATETIME NULL,
	`FECHAFINAL` DATETIME NULL,
	CONSTRAINT `PK_IMPUESTO` PRIMARY KEY (`IDIMPUESTO` ASC)
)

;

CREATE TABLE `ModoDePago`
(
	`IDMODODEPAGO` DECIMAL(8,0) NOT NULL,
	`NOMBREMODODEPAGO` VARCHAR(50) NULL,
	CONSTRAINT `PK_ModoDePago` PRIMARY KEY (`IDMODODEPAGO` ASC)
)

;

CREATE TABLE `Pais`
(
	`IDPAIS` DECIMAL(8,0) NOT NULL,
	`NOMBREPAIS` VARCHAR(50) NOT NULL,
	CONSTRAINT `PK_ID` PRIMARY KEY (`IDPAIS` ASC)
)

;

CREATE TABLE `Pedido`
(
	`IDPEDIDO` DECIMAL(8,0) NOT NULL,
	`ESTADOPEDIDO` VARCHAR(50) NULL,
	`CALIFICACION` VARCHAR(50) NULL,
	`IDMODODEPAGO` DECIMAL(8,0) NULL,
	CONSTRAINT `PK_PEDIDO` PRIMARY KEY (`IDPEDIDO` ASC)
)

;

CREATE TABLE `Producto`
(
	`IDPRODUCTO` DECIMAL(8,0) NOT NULL,
	`NOMBREPRODUCTO` VARCHAR(50) NOT NULL,
	`IDIMPUESTO` DECIMAL(8,0) NULL,
	CONSTRAINT `PK_PRODUCTO` PRIMARY KEY (`IDPRODUCTO` ASC)
)

;

CREATE TABLE `Producto_pedido`
(
	`ID_DETALLE` DECIMAL(8,0) NOT NULL,
	`IDPEDIDO` DECIMAL(8,0) NOT NULL,
	`CANTIDAD` DECIMAL(8,0) NOT NULL,
	`IDPRODUCTO` DECIMAL(8,0) NOT NULL,
	CONSTRAINT `PK_Producto_pedido` PRIMARY KEY (`ID_DETALLE` ASC)
)

;

CREATE TABLE `Producto_Region`
(
	`IDPRODUCTOREGION` DECIMAL(8,0) NOT NULL,
	`PRECIO` DECIMAL(8,2) NULL,
	`IDREGION` DECIMAL(8,0) NULL,
	`IDPRODUCTO` DECIMAL(8,0) NULL,
	CONSTRAINT `PK_PRODUCTO_REGION` PRIMARY KEY (`IDPRODUCTOREGION` ASC)
)

;

CREATE TABLE `Producto_Subcategoria`
(
	`ID` DECIMAL(8,0) NOT NULL,
	`FECHACLASIFICACION` VARCHAR(50) NULL,
	`IDSUBCATEGORIA` DECIMAL(8,0) NULL,
	`IDPRODUCTO` DECIMAL(8,0) NULL,
	CONSTRAINT `PK_Producto_Subcategoria` PRIMARY KEY (`ID` ASC)
)

;

CREATE TABLE `Region`
(
	`IDREGION` DECIMAL(8,0) NOT NULL,
	`NOMBREREGION` VARCHAR(50) NOT NULL,
	`IDPAIS` DECIMAL(8,0) NOT NULL,
	CONSTRAINT `PK_REGION` PRIMARY KEY (`IDREGION` ASC)
)

;

CREATE TABLE `RepresentanteVentas`
(
	`IDENTIFICACION` DECIMAL(8,0) NOT NULL,
	`NOMBRE` VARCHAR(50) NOT NULL,
	`CORREOELECTRONICO` VARCHAR(50) NULL,
	`GENERO` VARCHAR(50) NOT NULL,
	`FECHANACIMIENTO` DATETIME NOT NULL,
	`FECHACONTRATO` DATETIME NOT NULL,
	`TELEFONOCONTACTO` VARCHAR(50) NULL,
	`DIRECCION` VARCHAR(50) NULL,
	`IDGRADO` DECIMAL(8,0) NOT NULL,
	`ESDIRECTOR` DECIMAL(1,1) NOT NULL,
	`IDREGION` DECIMAL(8,0) NOT NULL,
	CONSTRAINT `PK_IDENTIFICACION` PRIMARY KEY (`IDENTIFICACION` ASC)
)

;

CREATE TABLE `RepresentanteVentas_Cliente`
(
	`FECHAINICIO` DATETIME NOT NULL,
	`FECHAFIN` DATETIME NULL,
	`ID` DECIMAL(10,0) NOT NULL,
	`ID_REPRESENTANTE` DECIMAL(8,0) NOT NULL,
	`ID_CLIENTE` DECIMAL(8,0) NOT NULL,
	CONSTRAINT `PK_REPRESENTANTEVENTAS_CLIENTE` PRIMARY KEY (`ID` ASC)
)

;

CREATE TABLE `Subcategoria`
(
	`IDSUBCATEGORIA` DECIMAL(8,0) NOT NULL,
	`NOMBRESUBCATEGORIA` VARCHAR(50) NOT NULL,
	`DESCRIPCIONSUBCATEGORIA` VARCHAR(50) NULL,
	`IDCATEGORIA` DECIMAL(8,0) NULL,
	CONSTRAINT `PK_SUBCATEGORIA` PRIMARY KEY (`IDSUBCATEGORIA` ASC)
)

;

/* Create Primary Keys, Indexes, Uniques, Checks */

ALTER TABLE `Cliente_Pedido` 
 ADD INDEX `IXFK_Cliente_Pedido_Cliente` (`CEDULA` ASC)
;

ALTER TABLE `Cliente_Pedido` 
 ADD INDEX `IXFK_Cliente_Pedido_Pedido` (`IDPEDIDO` ASC)
;

ALTER TABLE `Pedido` 
 ADD INDEX `IXFK_Pedido_ModoDePago` (`IDMODODEPAGO` ASC)
;

ALTER TABLE `Producto` 
 ADD INDEX `IXFK_Producto_Impuesto` (`IDIMPUESTO` ASC)
;

ALTER TABLE `Producto_pedido` 
 ADD INDEX `IXFK_Producto_pedido_Pedido` (`IDPEDIDO` ASC)
;

ALTER TABLE `Producto_pedido` 
 ADD INDEX `IXFK_Producto_pedido_Producto` (`IDPRODUCTO` ASC)
;

ALTER TABLE `Producto_Region` 
 ADD INDEX `IXFK_Producto_Region_Producto` (`IDPRODUCTO` ASC)
;

ALTER TABLE `Producto_Region` 
 ADD INDEX `IXFK_Producto_Region_Region` (`IDREGION` ASC)
;

ALTER TABLE `Producto_Subcategoria` 
 ADD INDEX `IXFK_Producto_Sub_Subcate01` (`IDSUBCATEGORIA` ASC)
;

ALTER TABLE `Region` 
 ADD INDEX `IXFK_Region_Pais` (`IDPAIS` ASC)
;

ALTER TABLE `RepresentanteVentas` 
 ADD INDEX `IXFK_RepresentanteVentas_01` (`IDREGION` ASC)
;

ALTER TABLE `RepresentanteVentas` 
 ADD INDEX `IXFK_RepresentanteVentas_Grado` (`IDGRADO` ASC)
;

ALTER TABLE `RepresentanteVentas_Cliente` 
 ADD INDEX `IXFK_REPRESENTANT_VC` (`ID_REPRESENTANTE` ASC)
;

ALTER TABLE `RepresentanteVentas_Cliente` 
 ADD INDEX `IXFK_RepresentanteVen_Cli01` (`ID_CLIENTE` ASC)
;

ALTER TABLE `Subcategoria` 
 ADD INDEX `IXFK_Subcategoria_Categoria` (`IDCATEGORIA` ASC)
;

/* Create Foreign Key Constraints */

ALTER TABLE `Cliente_Pedido` 
 ADD CONSTRAINT `FK_Cliente_Pedido_Cliente`
	FOREIGN KEY (`CEDULA`) REFERENCES `Cliente` (`CEDULA`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Cliente_Pedido` 
 ADD CONSTRAINT `FK_Cliente_Pedido_Pedido`
	FOREIGN KEY (`IDPEDIDO`) REFERENCES `Pedido` (`IDPEDIDO`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Pedido` 
 ADD CONSTRAINT `FK_Pedido_ModoDePago`
	FOREIGN KEY (`IDMODODEPAGO`) REFERENCES `ModoDePago` (`IDMODODEPAGO`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Producto_pedido` 
 ADD CONSTRAINT `FK_Producto_pedido_Pedido`
	FOREIGN KEY (`IDPEDIDO`) REFERENCES `Pedido` (`IDPEDIDO`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Producto_pedido` 
 ADD CONSTRAINT `FK_Producto_pedido_Producto`
	FOREIGN KEY (`IDPRODUCTO`) REFERENCES `Producto` (`IDPRODUCTO`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Producto_Region` 
 ADD CONSTRAINT `FK_Producto_Region_Region`
	FOREIGN KEY (`IDREGION`) REFERENCES `Region` (`IDREGION`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Producto_Subcategoria` 
 ADD CONSTRAINT `FK_PRODUCTO_SUB_SUBCATEGORI`
	FOREIGN KEY (`IDSUBCATEGORIA`) REFERENCES  () ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Producto_Subcategoria` 
 ADD CONSTRAINT `FK_PRODUCTO_SUBCAT_PRODUCTO`
	FOREIGN KEY (`IDPRODUCTO`) REFERENCES `Producto` (`IDPRODUCTO`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `Region` 
 ADD CONSTRAINT `FK_Region_Pais`
	FOREIGN KEY (`IDPAIS`) REFERENCES `Pais` (`IDPAIS`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `RepresentanteVentas` 
 ADD CONSTRAINT `FK_RepresentanteVentas_Region`
	FOREIGN KEY (`IDREGION`) REFERENCES `Region` (`IDREGION`) ON DELETE No Action ON UPDATE No Action
;

ALTER TABLE `RepresentanteVentas_Cliente` 
 ADD CONSTRAINT `FK_REPRESENTANT_VC`
	FOREIGN KEY (`ID_REPRESENTANTE`) REFERENCES `RepresentanteVentas` (`IDENTIFICACION`) ON DELETE No Action ON UPDATE No Action
;

SET FOREIGN_KEY_CHECKS=1 
;
