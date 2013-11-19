SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `fluvigest` ;
CREATE SCHEMA IF NOT EXISTS `fluvigest` DEFAULT CHARACTER SET utf8 ;
USE `fluvigest` ;

-- -----------------------------------------------------
-- Table `fluvigest`.`usuarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`usuarios` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`usuarios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `usuario` VARCHAR(45) NOT NULL,
  `contrasinal` VARCHAR(45) NOT NULL COMMENT 'Táboa que almacena os datos de acceso dos usuarios da aplicación\n',
  `nome` VARCHAR(45) NULL,
  `apelidos` VARCHAR(100) NULL,
  `datacreacion` TIMESTAMP NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `usuario_UNIQUE` (`usuario` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`modelos_contadores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`modelos_contadores` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`modelos_contadores` (
  `id` INT NOT NULL,
  `marca` VARCHAR(45) NULL,
  `modelo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`barrios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`barrios` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`barrios` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Táboa que almacena os datos dos distintos barrios da cidade\n';


-- -----------------------------------------------------
-- Table `fluvigest`.`ruas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`ruas` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`ruas` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `zona` VARCHAR(45) NULL,
  `barrios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_ruas_barrios1_idx` (`barrios_id` ASC),
  CONSTRAINT `fk_ruas_barrios1`
    FOREIGN KEY (`barrios_id`)
    REFERENCES `fluvigest`.`barrios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`inmobles`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`inmobles` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`inmobles` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `numero` VARCHAR(10) NULL,
  `piso` VARCHAR(45) NULL,
  `portal` VARCHAR(5) NULL,
  `porta` VARCHAR(5) NULL,
  `nome` VARCHAR(100) NULL,
  `orde` INT NULL,
  `cod_postal` VARCHAR(10) NULL,
  `escaleira` VARCHAR(45) NULL,
  `ruas_id` INT NOT NULL,
  PRIMARY KEY (`id`, `ruas_id`),
  INDEX `fk_inmobles_ruas1_idx` (`ruas_id` ASC),
  CONSTRAINT `fk_inmobles_ruas1`
    FOREIGN KEY (`ruas_id`)
    REFERENCES `fluvigest`.`ruas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Táboa de cada unha das vivendas ou locais comerciais que teñ /* comment truncated */ /*en un contador noso.*/';


-- -----------------------------------------------------
-- Table `fluvigest`.`contrato`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`contrato` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`contrato` (
  `id_contratos` INT NOT NULL,
  `num_contrato` VARCHAR(45) NOT NULL,
  `fecha_contrato` DATE NOT NULL,
  `activo` TINYINT(1) NOT NULL,
  PRIMARY KEY (`id_contratos`),
  UNIQUE INDEX `idcontratos_UNIQUE` (`id_contratos` ASC),
  UNIQUE INDEX `num_contrato_UNIQUE` (`num_contrato` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`contadores`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`contadores` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`contadores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `num_serie` VARCHAR(45) NOT NULL,
  `data_instalacion` DATE NULL,
  `data_retirada` DATE NULL,
  `modelos_contadores_id` INT NOT NULL,
  `inmobles_id` INT NOT NULL,
  `data_revision` DATE NULL,
  `estado` VARCHAR(45) NULL,
  `CONTRATO_idcontratos` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contadores_modelos_contadores1` (`modelos_contadores_id` ASC),
  INDEX `fk_contadores_inmobles1` (`inmobles_id` ASC),
  INDEX `fk_contadores_CONTRATO1_idx` (`CONTRATO_idcontratos` ASC),
  CONSTRAINT `fk_contadores_modelos_contadores1`
    FOREIGN KEY (`modelos_contadores_id`)
    REFERENCES `fluvigest`.`modelos_contadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contadores_inmobles1`
    FOREIGN KEY (`inmobles_id`)
    REFERENCES `fluvigest`.`inmobles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contadores_CONTRATO1`
    FOREIGN KEY (`CONTRATO_idcontratos`)
    REFERENCES `fluvigest`.`contrato` (`id_contratos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Táboa coa información dos contadores instalados agora e tamé /* comment truncated */ /*n histórico.*/';


-- -----------------------------------------------------
-- Table `fluvigest`.`tincidencias`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`tincidencias` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`tincidencias` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `descricion` VARCHAR(250) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB
COMMENT = 'Táboa que almacena as descricións das incidencias máis común /* comment truncated */ /*s*/';


-- -----------------------------------------------------
-- Table `fluvigest`.`lecturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`lecturas` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`lecturas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `lectura` DECIMAL(20,0) NULL,
  `incidencia` VARCHAR(250) NULL,
  `data` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lectura_anterior` DECIMAL(20,0) NULL,
  `usuarios_id` INT NOT NULL,
  `contadores_id` INT NOT NULL,
  `tincidencias_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_lecturas_usuarios1` (`usuarios_id` ASC),
  INDEX `fk_lecturas_contadores1` (`contadores_id` ASC),
  INDEX `fk_lecturas_tincidencias1` (`tincidencias_id` ASC),
  CONSTRAINT `fk_lecturas_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `fluvigest`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturas_contadores1`
    FOREIGN KEY (`contadores_id`)
    REFERENCES `fluvigest`.`contadores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturas_tincidencias1`
    FOREIGN KEY (`tincidencias_id`)
    REFERENCES `fluvigest`.`tincidencias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COMMENT = 'Táboa para almacenar as distintas lecturas de contadores.';


-- -----------------------------------------------------
-- Table `fluvigest`.`persoas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`persoas` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`persoas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(250) NOT NULL,
  `NIF` VARCHAR(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `NIF_UNIQUE` (`NIF` ASC))
ENGINE = InnoDB
COMMENT = 'Táboa coa información de clientes';


-- -----------------------------------------------------
-- Table `fluvigest`.`abonos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`abonos` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`abonos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `inmobles_id` INT NOT NULL,
  `persoas_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_abonos_inmobles1` (`inmobles_id` ASC),
  INDEX `fk_abonos_persoas1` (`persoas_id` ASC),
  CONSTRAINT `fk_abonos_inmobles1`
    FOREIGN KEY (`inmobles_id`)
    REFERENCES `fluvigest`.`inmobles` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_abonos_persoas1`
    FOREIGN KEY (`persoas_id`)
    REFERENCES `fluvigest`.`persoas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`tLogs`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`tLogs` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`tLogs` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` TIMESTAMP NOT NULL,
  `descricion` VARCHAR(250) NOT NULL,
  `usuarios_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tLogs_usuarios1` (`usuarios_id` ASC),
  CONSTRAINT `fk_tLogs_usuarios1`
    FOREIGN KEY (`usuarios_id`)
    REFERENCES `fluvigest`.`usuarios` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`facturas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`facturas` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`facturas` (
  `id_facturas` INT NOT NULL,
  `fecha_factura` DATE NOT NULL,
  `contrato_id_contratos` INT NOT NULL,
  PRIMARY KEY (`id_facturas`),
  INDEX `fk_facturas_contrato1_idx` (`contrato_id_contratos` ASC),
  CONSTRAINT `fk_facturas_contrato1`
    FOREIGN KEY (`contrato_id_contratos`)
    REFERENCES `fluvigest`.`contrato` (`id_contratos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`linea_factura`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`linea_factura` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`linea_factura` (
  `id_detalle_factura` INT NOT NULL,
  `linea_factura` INT NOT NULL,
  `periodo` DATE NOT NULL,
  `cantidad` INT NOT NULL,
  `concepto` VARCHAR(200) NOT NULL,
  `importe` DOUBLE NOT NULL,
  `id_facturas` INT NOT NULL,
  PRIMARY KEY (`id_detalle_factura`),
  UNIQUE INDEX `idLINEA_FACTURA_UNIQUE` (`id_detalle_factura` ASC),
  INDEX `fk_detalle_factura_facturas1_idx` (`id_facturas` ASC),
  CONSTRAINT `fk_detalle_factura_facturas1`
    FOREIGN KEY (`id_facturas`)
    REFERENCES `fluvigest`.`facturas` (`id_facturas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`tarifas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`tarifas` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`tarifas` (
  `id_tarifas` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NOT NULL,
  PRIMARY KEY (`id_tarifas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`servicios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`servicios` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`servicios` (
  `id_servicios` INT NOT NULL,
  `nombre` VARCHAR(45) NULL,
  `descripcion` VARCHAR(45) NULL,
  `tarifas_id_tarifas` INT NOT NULL,
  PRIMARY KEY (`id_servicios`, `tarifas_id_tarifas`),
  INDEX `fk_servicios_tarifas1_idx` (`tarifas_id_tarifas` ASC),
  CONSTRAINT `fk_servicios_tarifas1`
    FOREIGN KEY (`tarifas_id_tarifas`)
    REFERENCES `fluvigest`.`tarifas` (`id_tarifas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `fluvigest`.`contrato_servicio`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `fluvigest`.`contrato_servicio` ;

CREATE TABLE IF NOT EXISTS `fluvigest`.`contrato_servicio` (
  `contrato_idcontratos` INT NOT NULL,
  `servicios_id_servicios` INT NOT NULL,
  `fecha` DATE NOT NULL,
  `importe_servicios` DOUBLE NOT NULL,
  PRIMARY KEY (`contrato_idcontratos`, `servicios_id_servicios`, `fecha`, `importe_servicios`),
  INDEX `fk_CONTRATO_has_SERVICIOS_SERVICIOS1_idx` (`servicios_id_servicios` ASC),
  INDEX `fk_CONTRATO_has_SERVICIOS_CONTRATO1_idx` (`contrato_idcontratos` ASC),
  CONSTRAINT `fk_CONTRATO_has_SERVICIOS_CONTRATO1`
    FOREIGN KEY (`contrato_idcontratos`)
    REFERENCES `fluvigest`.`contrato` (`id_contratos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_CONTRATO_has_SERVICIOS_SERVICIOS1`
    FOREIGN KEY (`servicios_id_servicios`)
    REFERENCES `fluvigest`.`servicios` (`id_servicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
GRANT USAGE ON *.* TO fluvigest;
 DROP USER fluvigest;
SET SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';
CREATE USER 'fluvigest' IDENTIFIED BY 'fluvigest';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
