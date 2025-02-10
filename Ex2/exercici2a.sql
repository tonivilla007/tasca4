-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici2a
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici2a
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici2a` ;
USE `exercici2a` ;

-- -----------------------------------------------------
-- Table `exercici2a`.`Pacients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2a`.`Pacients` (
  `idPacient` INT NOT NULL,
  `Nom Cognom` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NULL,
  `direccio` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NOT NULL,
  `Seguretat Social` VARCHAR(45) NULL,
  PRIMARY KEY (`idPacient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2a`.`Metge`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2a`.`Metge` (
  `idMetge` INT NOT NULL,
  `Nom Cognom` VARCHAR(45) NOT NULL,
  `Especialitat` VARCHAR(45) NOT NULL,
  `Carrec` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMetge`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici2a`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici2a`.`Consulta` (
  `idConsulta INT` INT NOT NULL AUTO_INCREMENT,
  `pacient` VARCHAR(45) NOT NULL,
  `data` VARCHAR(45) NOT NULL,
  `Metge` VARCHAR(45) NOT NULL,
  `Llit` VARCHAR(45) NOT NULL,
  `Planta` VARCHAR(45) NOT NULL,
  `Diagnostic` VARCHAR(45) NOT NULL,
  `Metge_idMetge` INT NOT NULL,
  `Pacients_idPacient` INT NOT NULL,
  PRIMARY KEY (`idConsulta INT`),
  INDEX `fk_Consulta_Metge1_idx` (`Metge_idMetge` ASC) VISIBLE,
  INDEX `fk_Consulta_Pacients1_idx` (`Pacients_idPacient` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_Metge1`
    FOREIGN KEY (`Metge_idMetge`)
    REFERENCES `exercici2a`.`Metge` (`idMetge`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Pacients1`
    FOREIGN KEY (`Pacients_idPacient`)
    REFERENCES `exercici2a`.`Pacients` (`idPacient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
