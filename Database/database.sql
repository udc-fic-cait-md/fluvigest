SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `fluvigest` ;
CREATE SCHEMA IF NOT EXISTS `fluvigest` DEFAULT CHARACTER SET utf8 ;
USE `fluvigest` ;

-- -----------------------------------------------------
-- Table `fluvigest`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`usuarios` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario` VARCHAR(45) NOT NULL ,
  `contrasinal` VARCHAR(45) NOT NULL COMMENT 'Táboa que almacena os datos de acceso dos usuarios da aplicación\n' ,
  `nome` VARCHAR(45) NULL ,
  `apelidos` VARCHAR(100) NULL ,
  `datacreacion` TIMESTAMP NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`modelos_contadores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`modelos_contadores` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`modelos_contadores` (
  `id` INT NOT NULL ,
  `marca` VARCHAR(45) NULL ,
  `modelo` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`barrios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`barrios` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`barrios` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'Táboa que almacena os datos dos distintos barrios da cidade\n';


-- -----------------------------------------------------
-- Table `fluvigest`.`ruas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`ruas` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`ruas` (
  `id` INT NOT NULL ,
  `nome` VARCHAR(45) NULL ,
  `zona` VARCHAR(45) NULL ,
  `barrios_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_ruas_barrios1_idx` (`barrios_id` ASC) ,
  CONSTRAINT `fk_ruas_barrios1`
    FOREIGN KEY (`barrios_id` )
    REFERENCES `fluvigest`.`barrios` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`abonados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`abonados` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`abonados` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(100) NOT NULL ,
  `apellidos` VARCHAR(150) NOT NULL ,
  `telefono` VARCHAR(20) NULL ,
  `razon_social` VARCHAR(45) NULL ,
  `nif` VARCHAR(12) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`tipo_forma_pagos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`tipo_forma_pagos` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`tipo_forma_pagos` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(150) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`contratos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`contratos` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`contratos` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `fecha_inicio` DATE NOT NULL ,
  `fecha_fin` DATE NULL ,
  `abonado_id` INT NOT NULL ,
  `tipo_forma_pago_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_contratos_abonados1` (`abonado_id` ASC) ,
  INDEX `fk_contratos_tipo_forma_pagos` (`tipo_forma_pago_id` ASC) ,
  CONSTRAINT `fk_contratos_abonados1`
    FOREIGN KEY (`abonado_id` )
    REFERENCES `fluvigest`.`abonados` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contratos_tipo_forma_pagos`
    FOREIGN KEY (`tipo_forma_pago_id` )
    REFERENCES `fluvigest`.`tipo_forma_pagos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`inmobles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`inmobles` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`inmobles` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `numero` VARCHAR(10) NULL ,
  `piso` VARCHAR(45) NULL ,
  `portal` VARCHAR(5) NULL ,
  `porta` VARCHAR(5) NULL ,
  `nome` VARCHAR(100) NULL ,
  `orde` INT NULL ,
  `cod_postal` VARCHAR(10) NULL ,
  `escaleira` VARCHAR(45) NULL ,
  `ruas_id` INT NOT NULL ,
  `inmoblescol` VARCHAR(45) NULL ,
  `contrato_id` INT NULL ,
  PRIMARY KEY (`id`, `ruas_id`) ,
  INDEX `fk_inmobles_ruas1_idx` (`ruas_id` ASC) ,
  INDEX `fk_inmobles_contratos` (`contrato_id` ASC) ,
  CONSTRAINT `fk_inmobles_ruas1`
    FOREIGN KEY (`ruas_id` )
    REFERENCES `fluvigest`.`ruas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inmobles_contratos`
    FOREIGN KEY (`contrato_id` )
    REFERENCES `fluvigest`.`contratos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Táboa de cada unha das vivendas ou locais comerciais que teñ' /* comment truncated */;


-- -----------------------------------------------------
-- Table `fluvigest`.`contadores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`contadores` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`contadores` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `num_serie` VARCHAR(45) NOT NULL ,
  `calibre` VARCHAR(45) NULL ,
  `data_instalacion` DATE NULL ,
  `data_retirada` DATE NULL ,
  `modelos_contadores_id` INT NOT NULL ,
  `inmobles_id` INT NOT NULL ,
  `data_revision` DATE NULL ,
  `estado` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_contadores_modelos_contadores1` (`modelos_contadores_id` ASC) ,
  INDEX `fk_contadores_inmobles1` (`inmobles_id` ASC) ,
  CONSTRAINT `fk_contadores_modelos_contadores1`
    FOREIGN KEY (`modelos_contadores_id` )
    REFERENCES `fluvigest`.`modelos_contadores` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contadores_inmobles1`
    FOREIGN KEY (`inmobles_id` )
    REFERENCES `fluvigest`.`inmobles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Táboa coa información dos contadores instalados agora e tamé' /* comment truncated */;


-- -----------------------------------------------------
-- Table `fluvigest`.`tincidencias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`tincidencias` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`tincidencias` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `descricion` VARCHAR(250) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
COMMENT = 'Táboa que almacena as descricións das incidencias máis común' /* comment truncated */;


-- -----------------------------------------------------
-- Table `fluvigest`.`lecturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`lecturas` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`lecturas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `lectura` DECIMAL(20,0) NULL ,
  `incidencia` VARCHAR(250) NULL ,
  `data` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `lectura_anterior` DECIMAL(20,0) NULL ,
  `usuarios_id` INT NOT NULL ,
  `contadores_id` INT NOT NULL ,
  `tincidencias_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_lecturas_usuarios1` (`usuarios_id` ASC) ,
  INDEX `fk_lecturas_contadores1` (`contadores_id` ASC) ,
  INDEX `fk_lecturas_tincidencias1` (`tincidencias_id` ASC) ,
  CONSTRAINT `fk_lecturas_usuarios1`
    FOREIGN KEY (`usuarios_id` )
    REFERENCES `fluvigest`.`usuarios` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturas_contadores1`
    FOREIGN KEY (`contadores_id` )
    REFERENCES `fluvigest`.`contadores` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturas_tincidencias1`
    FOREIGN KEY (`tincidencias_id` )
    REFERENCES `fluvigest`.`tincidencias` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Táboa para almacenar as distintas lecturas de contadores.';


-- -----------------------------------------------------
-- Table `fluvigest`.`persoas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`persoas` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`persoas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(250) NOT NULL ,
  `NIF` VARCHAR(9) NOT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC) )
ENGINE = InnoDB
COMMENT = 'Táboa coa información de clientes';


-- -----------------------------------------------------
-- Table `fluvigest`.`abonos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`abonos` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`abonos` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `inmobles_id` INT NOT NULL ,
  `persoas_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_abonos_inmobles1` (`inmobles_id` ASC) ,
  INDEX `fk_abonos_persoas1` (`persoas_id` ASC) ,
  CONSTRAINT `fk_abonos_inmobles1`
    FOREIGN KEY (`inmobles_id` )
    REFERENCES `fluvigest`.`inmobles` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_abonos_persoas1`
    FOREIGN KEY (`persoas_id` )
    REFERENCES `fluvigest`.`persoas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`tLogs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`tLogs` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`tLogs` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `data` TIMESTAMP NOT NULL ,
  `descricion` VARCHAR(250) NOT NULL ,
  `usuarios_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tLogs_usuarios1` (`usuarios_id` ASC) ,
  CONSTRAINT `fk_tLogs_usuarios1`
    FOREIGN KEY (`usuarios_id` )
    REFERENCES `fluvigest`.`usuarios` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`facturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`facturas` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`facturas` (
  `id_facturas` INT NOT NULL ,
  `fecha_factura` DATE NOT NULL ,
  `nombre_cliente` VARCHAR(45) NOT NULL ,
  `ap1_cliente` VARCHAR(45) NOT NULL ,
  `ap2_cliente` VARCHAR(45) NOT NULL ,
  `direccion` VARCHAR(45) NOT NULL ,
  `dni` VARCHAR(10) NOT NULL ,
  `cod_postal` INT NOT NULL ,
  `id_contrato` INT NOT NULL ,
  PRIMARY KEY (`id_facturas`) ,
  INDEX `fk_facturas_contrato1_idx` (`id_contrato` ASC) ,
  CONSTRAINT `fk_facturas_contrato1`
    FOREIGN KEY (`id_contrato` )
    REFERENCES `fluvigest`.`contratos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`linea_factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`linea_factura` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`linea_factura` (
  `id_detalle_factura` INT NOT NULL ,
  `linea_factura` INT NOT NULL ,
  `periodo` DATE NOT NULL ,
  `cantidad` INT NOT NULL ,
  `concepto` VARCHAR(200) NOT NULL ,
  `importe` DOUBLE NOT NULL ,
  `id_facturas` INT NOT NULL ,
  PRIMARY KEY (`id_detalle_factura`) ,
  UNIQUE INDEX `idLINEA_FACTURA_UNIQUE` (`id_detalle_factura` ASC) ,
  INDEX `fk_detalle_factura_facturas1_idx` (`id_facturas` ASC) ,
  CONSTRAINT `fk_detalle_factura_facturas1`
    FOREIGN KEY (`id_facturas` )
    REFERENCES `fluvigest`.`facturas` (`id_facturas` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`tipo_servicios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`tipo_servicios` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`tipo_servicios` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(200) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`tipo_tarifas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`tipo_tarifas` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`tipo_tarifas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nombre` VARCHAR(45) NOT NULL ,
  `descripcion` VARCHAR(150) NULL ,
  `tipo_servicio_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tipo_tarifas_tipo_servicios` (`tipo_servicio_id` ASC) ,
  CONSTRAINT `fk_tipo_tarifas_tipo_servicios`
    FOREIGN KEY (`tipo_servicio_id` )
    REFERENCES `fluvigest`.`tipo_servicios` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`tarifas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`tarifas` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`tarifas` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `precio` DOUBLE NOT NULL ,
  `fecha_inicio` DATE NOT NULL ,
  `fecha_fin` DATE NULL ,
  `tipo_tarifa_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_tarifas_tipo_tarifas` (`tipo_tarifa_id` ASC) ,
  CONSTRAINT `fk_tarifas_tipo_tarifas`
    FOREIGN KEY (`tipo_tarifa_id` )
    REFERENCES `fluvigest`.`tipo_tarifas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`servicio_contratados`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`servicio_contratados` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`servicio_contratados` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `contrato_id` INT NULL ,
  `tipo_servicio_id` INT NULL ,
  `fecha_inicio` DATE NOT NULL ,
  `fecha_fin` DATE NULL ,
  `tipo_tarifa_id` INT NOT NULL ,
  INDEX `fk_CONTRATO_has_SERVICIOS_SERVICIOS1_idx` (`tipo_servicio_id` ASC) ,
  INDEX `fk_CONTRATO_has_SERVICIOS_CONTRATO1_idx` (`contrato_id` ASC) ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_servicio_contratados_tipo_tarifas` (`tipo_tarifa_id` ASC) ,
  CONSTRAINT `fk_CONTRATO_has_SERVICIOS_CONTRATO1`
    FOREIGN KEY (`contrato_id` )
    REFERENCES `fluvigest`.`contratos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONTRATO_has_SERVICIOS_SERVICIOS1`
    FOREIGN KEY (`tipo_servicio_id` )
    REFERENCES `fluvigest`.`tipo_servicios` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicio_contratados_tipo_tarifas`
    FOREIGN KEY (`tipo_tarifa_id` )
    REFERENCES `fluvigest`.`tipo_tarifas` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`domiciliaciones`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`domiciliaciones` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`domiciliaciones` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `ccc` VARCHAR(15) NOT NULL ,
  `titular` VARCHAR(150) NOT NULL ,
  `dirección` VARCHAR(120) NOT NULL ,
  `telefono` VARCHAR(20) NOT NULL ,
  `nif` VARCHAR(12) NOT NULL ,
  `fecha_inicio` DATE NOT NULL ,
  `fecha_fin` DATE NULL COMMENT 'La domiciliación activa es aquella que \'fecha_fin IS NULL\'' ,
  `contrato_id` INT NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_domiciliaciones_contratos` (`contrato_id` ASC) ,
  CONSTRAINT `fk_domiciliaciones_contratos`
    FOREIGN KEY (`contrato_id` )
    REFERENCES `fluvigest`.`contratos` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`recibos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`recibos` ;

CREATE  TABLE IF NOT EXISTS `fluvigest`.`recibos` (
  `id` INT NOT NULL ,
  `domiciliacion_id` INT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_recibos_domiciliaciones` (`domiciliacion_id` ASC) ,
  CONSTRAINT `fk_recibos_domiciliaciones`
    FOREIGN KEY (`domiciliacion_id` )
    REFERENCES `fluvigest`.`domiciliaciones` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `fluvigest`.`tipo_forma_pagos`
-- -----------------------------------------------------
START TRANSACTION;
USE `fluvigest`;
INSERT INTO `fluvigest`.`tipo_forma_pagos` (`id`, `nombre`, `descripcion`) VALUES (NULL, 'efectivo', '');
INSERT INTO `fluvigest`.`tipo_forma_pagos` (`id`, `nombre`, `descripcion`) VALUES (NULL, 'domiciliacion', NULL);

COMMIT;

-- -----------------------------------------------------
-- Data for table `fluvigest`.`tipo_servicios`
-- -----------------------------------------------------
START TRANSACTION;
USE `fluvigest`;
INSERT INTO `fluvigest`.`tipo_servicios` (`id`, `nombre`, `descripcion`) VALUES (1, 'agua', 'Servicio de agua');
INSERT INTO `fluvigest`.`tipo_servicios` (`id`, `nombre`, `descripcion`) VALUES (2, 'basura', 'Servicio de recogida de basura');
INSERT INTO `fluvigest`.`tipo_servicios` (`id`, `nombre`, `descripcion`) VALUES (3, 'alcantarillado', 'Servicio de alcantarillado');

COMMIT;

-- -----------------------------------------------------
-- Data for table `fluvigest`.`tipo_tarifas`
-- -----------------------------------------------------
START TRANSACTION;
USE `fluvigest`;
INSERT INTO `fluvigest`.`tipo_tarifas` (`id`, `nombre`, `descripcion`, `tipo_servicio_id`) VALUES (NULL, 'agua-doméstica', NULL, 1);
INSERT INTO `fluvigest`.`tipo_tarifas` (`id`, `nombre`, `descripcion`, `tipo_servicio_id`) VALUES (NULL, 'agua-empresarial', NULL, 1);
INSERT INTO `fluvigest`.`tipo_tarifas` (`id`, `nombre`, `descripcion`, `tipo_servicio_id`) VALUES (NULL, 'agua-industrial', NULL, 1);
INSERT INTO `fluvigest`.`tipo_tarifas` (`id`, `nombre`, `descripcion`, `tipo_servicio_id`) VALUES (NULL, 'basura-doméstica', NULL, 2);
INSERT INTO `fluvigest`.`tipo_tarifas` (`id`, `nombre`, `descripcion`, `tipo_servicio_id`) VALUES (NULL, 'basura-empresarial', NULL, 2);
INSERT INTO `fluvigest`.`tipo_tarifas` (`id`, `nombre`, `descripcion`, `tipo_servicio_id`) VALUES (NULL, 'basura-industrial', NULL, 2);
INSERT INTO `fluvigest`.`tipo_tarifas` (`id`, `nombre`, `descripcion`, `tipo_servicio_id`) VALUES (NULL, 'alcantarillado-doméstico', NULL, 3);
INSERT INTO `fluvigest`.`tipo_tarifas` (`id`, `nombre`, `descripcion`, `tipo_servicio_id`) VALUES (NULL, 'alcantarillado-empresarial', NULL, 3);
INSERT INTO `fluvigest`.`tipo_tarifas` (`id`, `nombre`, `descripcion`, `tipo_servicio_id`) VALUES (NULL, 'alcantarillado-industrial', NULL, 3);

COMMIT;
