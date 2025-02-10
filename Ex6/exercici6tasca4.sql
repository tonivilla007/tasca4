-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici6
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici6
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici6` ;
USE `exercici6` ;

-- -----------------------------------------------------
-- Table `exercici6`.`Avions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici6`.`Avions` (
  `idAvions` INT NOT NULL,
  `Companyia` VARCHAR(45) NULL,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Capacitat` INT NULL,
  PRIMARY KEY (`idAvions`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici6`.`Vols`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici6`.`Vols` (
  `idVols` INT NOT NULL,
  `Numero` VARCHAR(7) NULL,
  `Origen` VARCHAR(45) NULL,
  `Destí` VARCHAR(45) NULL,
  `HSortida` VARCHAR(45) NULL,
  `HArribada` VARCHAR(45) NULL,
  `Avions_idAvions` INT NOT NULL,
  PRIMARY KEY (`idVols`),
  INDEX `fk_Vols_Avions1_idx` (`Avions_idAvions` ASC) VISIBLE,
  CONSTRAINT `fk_Vols_Avions1`
    FOREIGN KEY (`Avions_idAvions`)
    REFERENCES `exercici6`.`Avions` (`idAvions`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici6`.`Passatgers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici6`.`Passatgers` (
  `idPassatgers` INT NOT NULL,
  `DNI` VARCHAR(9) NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Telefon` VARCHAR(12) NULL,
  `Email` VARCHAR(45) NULL,
  `Direccio` VARCHAR(100) NULL,
  PRIMARY KEY (`idPassatgers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici6`.`Reserva`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici6`.`Reserva` (
  `idReserva` INT NOT NULL,
  `Data` VARCHAR(45) NULL,
  `Numero` VARCHAR(45) NULL,
  `Import` VARCHAR(45) NULL,
  `Passatgers_idPassatgers` INT NOT NULL,
  `Vols_idVols` INT NOT NULL,
  PRIMARY KEY (`idReserva`),
  INDEX `fk_Reserva_Passatgers_idx` (`Passatgers_idPassatgers` ASC) VISIBLE,
  INDEX `fk_Reserva_Vols1_idx` (`Vols_idVols` ASC) VISIBLE,
  CONSTRAINT `fk_Reserva_Passatgers`
    FOREIGN KEY (`Passatgers_idPassatgers`)
    REFERENCES `exercici6`.`Passatgers` (`idPassatgers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Reserva_Vols1`
    FOREIGN KEY (`Vols_idVols`)
    REFERENCES `exercici6`.`Vols` (`idVols`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
