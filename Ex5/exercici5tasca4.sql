-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici5
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici5
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici5` ;
USE `exercici5` ;

-- -----------------------------------------------------
-- Table `exercici5`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici5`.`Client` (
  `idClient` INT NOT NULL,
  `DNI` VARCHAR(9) CHARACTER SET 'armscii8' NULL,
  `Nom` VARCHAR(50) NULL,
  `Cognom` VARCHAR(50) NULL,
  `Correu` VARCHAR(45) NULL,
  `Telefon` VARCHAR(12) NULL,
  `Usuari` VARCHAR(45) NULL,
  `Contraseña` VARCHAR(20) NULL,
  PRIMARY KEY (`idClient`),
  UNIQUE INDEX `Usuari_UNIQUE` (`Usuari` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici5`.`Vehicle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici5`.`Vehicle` (
  `idVehicle` INT NOT NULL,
  `NumCarroseria` VARCHAR(45) NULL,
  `Matricula` VARCHAR(7) NULL,
  `Marca` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Client_idClient` INT NOT NULL,
  PRIMARY KEY (`idVehicle`),
  UNIQUE INDEX `Matricula_UNIQUE` (`Matricula` ASC) VISIBLE,
  INDEX `fk_Vehicle_Client_idx` (`Client_idClient` ASC) VISIBLE,
  CONSTRAINT `fk_Vehicle_Client`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `exercici5`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici5`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici5`.`Empleat` (
  `idEmpleat` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognom` VARCHAR(45) NULL,
  `Telefon` VARCHAR(9) NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici5`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici5`.`Cita` (
  `idCita` INT NOT NULL,
  `Data` VARCHAR(10) NULL,
  `Hora` VARCHAR(4) NULL,
  `Box` VARCHAR(45) NULL,
  `Vehicle_idVehicle` INT NOT NULL,
  `Empleat_idEmpleat` INT NOT NULL,
  PRIMARY KEY (`idCita`),
  INDEX `fk_Cita_Vehicle1_idx` (`Vehicle_idVehicle` ASC) VISIBLE,
  INDEX `fk_Cita_Empleat1_idx` (`Empleat_idEmpleat` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Vehicle1`
    FOREIGN KEY (`Vehicle_idVehicle`)
    REFERENCES `exercici5`.`Vehicle` (`idVehicle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Empleat1`
    FOREIGN KEY (`Empleat_idEmpleat`)
    REFERENCES `exercici5`.`Empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
