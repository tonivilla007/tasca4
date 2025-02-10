-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici4
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici4
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici4` ;
USE `exercici4` ;

-- -----------------------------------------------------
-- Table `exercici4`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici4`.`client` (
  `idclient` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `VIP` INT NULL DEFAULT 0,
  PRIMARY KEY (`idclient`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici4`.`Venedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici4`.`Venedor` (
  `idVenedor` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `NOM` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `NumSS` VARCHAR(45) NULL,
  PRIMARY KEY (`idVenedor`),
  UNIQUE INDEX `DNI_UNIQUE` (`DNI` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici4`.`TipusPolissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici4`.`TipusPolissa` (
  `idTipusPolissa` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(255) NULL,
  PRIMARY KEY (`idTipusPolissa`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici4`.`polissa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici4`.`polissa` (
  `idpolissa` INT NOT NULL,
  `Num Polissa` VARCHAR(25) NULL,
  `client_idclient` INT NOT NULL,
  `Venedor_idVenedor` INT NOT NULL,
  `TipusPolissa_idTipusPolissa` INT NOT NULL,
  `Preu anual` INT NULL,
  `Tipuspagament` VARCHAR(45) NULL,
  `DataContratacio` VARCHAR(10) NULL,
  `IniciVigencia` VARCHAR(10) NULL,
  `FiVigencia` VARCHAR(10) NULL,
  PRIMARY KEY (`idpolissa`),
  INDEX `fk_polissa_client_idx` (`client_idclient` ASC) VISIBLE,
  INDEX `fk_polissa_Venedor1_idx` (`Venedor_idVenedor` ASC) VISIBLE,
  INDEX `fk_polissa_TipusPolissa1_idx` (`TipusPolissa_idTipusPolissa` ASC) VISIBLE,
  CONSTRAINT `fk_polissa_client`
    FOREIGN KEY (`client_idclient`)
    REFERENCES `exercici4`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_polissa_Venedor1`
    FOREIGN KEY (`Venedor_idVenedor`)
    REFERENCES `exercici4`.`Venedor` (`idVenedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_polissa_TipusPolissa1`
    FOREIGN KEY (`TipusPolissa_idTipusPolissa`)
    REFERENCES `exercici4`.`TipusPolissa` (`idTipusPolissa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
