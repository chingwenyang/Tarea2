-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Optica
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Optica` ;

-- -----------------------------------------------------
-- Schema Optica
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Optica` DEFAULT CHARACTER SET utf8 ;
USE `Optica` ;

-- -----------------------------------------------------
-- Table `Optica`.`Direccion`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Direccion` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Direccion` (
  `idDireccion` INT NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(45) NOT NULL,
  `num_calle` INT NOT NULL,
  `piso` INT NOT NULL,
  `puerta` INT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  `codigo_p` INT NOT NULL,
  `país` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idDireccion`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`Proveedor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Proveedor` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Proveedor` (
  `idProveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(45) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `Direccion_idDireccion` INT NOT NULL,
  PRIMARY KEY (`idProveedor`),
  INDEX `fk_Proveedor_Direccion_idx` (`Direccion_idDireccion` ASC) VISIBLE,
  CONSTRAINT `fk_Proveedor_Direccion`
    FOREIGN KEY (`Direccion_idDireccion`)
    REFERENCES `Optica`.`Direccion` (`idDireccion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`Cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Cliente` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Cliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `correo_elec` VARCHAR(45) NOT NULL,
  `fecha_regi` DATETIME NOT NULL,
  `cliente_recomenda` VARCHAR(45) NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`Empleado`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Empleado` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Optica`.`Gafa`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Optica`.`Gafa` ;

CREATE TABLE IF NOT EXISTS `Optica`.`Gafa` (
  `idGafa` INT NOT NULL AUTO_INCREMENT,
  `provedor` VARCHAR(45) NOT NULL,
  `Proveedor_idProveedor` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `cristal_gradu_der` VARCHAR(45) NOT NULL,
  `cristal_gradu_izq` VARCHAR(45) NOT NULL,
  `marco` VARCHAR(45) NOT NULL,
  `cristal_color_der` VARCHAR(45) NOT NULL,
  `cristal_color_izq` VARCHAR(45) NOT NULL,
  `precio` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `Empleado_idEmpleado` INT NOT NULL,
  PRIMARY KEY (`idGafa`),
  INDEX `fk_Gafa_Proveedor1_idx` (`Proveedor_idProveedor` ASC) VISIBLE,
  INDEX `fk_Gafa_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  INDEX `fk_Gafa_Empleado1_idx` (`Empleado_idEmpleado` ASC) VISIBLE,
  CONSTRAINT `fk_Gafa_Proveedor1`
    FOREIGN KEY (`Proveedor_idProveedor`)
    REFERENCES `Optica`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gafa_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `Optica`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Gafa_Empleado1`
    FOREIGN KEY (`Empleado_idEmpleado`)
    REFERENCES `Optica`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
