-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici2b
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici2b
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici2b` ;
USE `exercici2b` ;

-- -----------------------------------------------------
-- Table `exercici2b`.`Pel.licula`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2b`.`Pel.licula` (
  `idPel.licula` INT NOT NULL,
  `Titol` VARCHAR(45) NULL,
  `Classificacio` VARCHAR(45) NULL,
  `genere` VARCHAR(45) NULL,
  `director` VARCHAR(45) NULL,
  `durada` VARCHAR(45) NULL,
  PRIMARY KEY (`idPel.licula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2b`.`Projecció`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2b`.`Projecció` (
  `idProjecció` INT NOT NULL,
  `Cine` VARCHAR(45) NULL,
  `Pelicula` VARCHAR(45) NULL,
  `data` VARCHAR(45) NULL,
  `hora` VARCHAR(45) NULL,
  `sala` VARCHAR(45) NULL,
  PRIMARY KEY (`idProjecció`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2b`.`Cine`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2b`.`Cine` (
  `idCine` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `poblacio` VARCHAR(45) NULL,
  `NombreSales` VARCHAR(45) NULL,
  `Pel.licula_idPel.licula` INT NOT NULL,
  `Projecció_idProjecció` INT NOT NULL,
  PRIMARY KEY (`idCine`),
  INDEX `fk_Cine_Pel.licula_idx` (`Pel.licula_idPel.licula` ASC) VISIBLE,
  INDEX `fk_Cine_Projecció1_idx` (`Projecció_idProjecció` ASC) VISIBLE,
  CONSTRAINT `fk_Cine_Pel.licula`
    FOREIGN KEY (`Pel.licula_idPel.licula`)
    REFERENCES `exercici2b`.`Pel.licula` (`idPel.licula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cine_Projecció1`
    FOREIGN KEY (`Projecció_idProjecció`)
    REFERENCES `exercici2b`.`Projecció` (`idProjecció`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2b`.`Tarifa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2b`.`Tarifa` (
  `idTarifa` INT NOT NULL,
  `cine` VARCHAR(45) NULL,
  `Tipus` VARCHAR(45) NULL,
  `Preu` VARCHAR(45) NULL,
  `Cine_idCine` INT NOT NULL,
  PRIMARY KEY (`idTarifa`),
  INDEX `fk_Tarifa_Cine1_idx` (`Cine_idCine` ASC) VISIBLE,
  CONSTRAINT `fk_Tarifa_Cine1`
    FOREIGN KEY (`Cine_idCine`)
    REFERENCES `exercici2b`.`Cine` (`idCine`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
