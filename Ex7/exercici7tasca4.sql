-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema exercici7
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema exercici7
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `exercici7` ;
USE `exercici7` ;

-- -----------------------------------------------------
-- Table `exercici7`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici7`.`Client` (
  `idClient` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici7`.`Empleat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici7`.`Empleat` (
  `idEmpleat` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Cognoms` VARCHAR(45) NULL,
  `Adresa` VARCHAR(45) NULL,
  `Telefon` VARCHAR(45) NULL,
  `DNaixement` VARCHAR(45) NULL,
  `DNI` VARCHAR(45) NULL,
  PRIMARY KEY (`idEmpleat`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici7`.`Ticket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici7`.`Ticket` (
  `id` INT NOT NULL,
  `NumFac` VARCHAR(45) NULL,
  `Dia` VARCHAR(45) NULL,
  `Hora` VARCHAR(45) NULL,
  `Empleat_idEmpleat` INT NOT NULL,
  `Client_idClient` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Ticket_Empleat_idx` (`Empleat_idEmpleat` ASC) VISIBLE,
  INDEX `fk_Ticket_Client1_idx` (`Client_idClient` ASC) VISIBLE,
  CONSTRAINT `fk_Ticket_Empleat`
    FOREIGN KEY (`Empleat_idEmpleat`)
    REFERENCES `exercici7`.`Empleat` (`idEmpleat`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Ticket_Client1`
    FOREIGN KEY (`Client_idClient`)
    REFERENCES `exercici7`.`Client` (`idClient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici7`.`Producte`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici7`.`Producte` (
  `idProducte` INT NOT NULL,
  `Nom` VARCHAR(45) NULL,
  `Descripcio` VARCHAR(200) NULL,
  `Preu` VARCHAR(45) NULL,
  `IVA` VARCHAR(45) NULL,
  `CodiBarres` VARCHAR(45) NULL,
  PRIMARY KEY (`idProducte`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `exercici7`.`LiniaTicket`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `exercici7`.`LiniaTicket` (
  `idLiniaTicket` INT NOT NULL,
  `Descompte` VARCHAR(45) NULL,
  `ImportTotal` VARCHAR(45) NULL,
  `Ticket_id` INT NOT NULL,
  `Producte_idProducte` INT NOT NULL,
  PRIMARY KEY (`idLiniaTicket`),
  INDEX `fk_LiniaTicket_Ticket1_idx` (`Ticket_id` ASC) VISIBLE,
  INDEX `fk_LiniaTicket_Producte1_idx` (`Producte_idProducte` ASC) VISIBLE,
  CONSTRAINT `fk_LiniaTicket_Ticket1`
    FOREIGN KEY (`Ticket_id`)
    REFERENCES `exercici7`.`Ticket` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_LiniaTicket_Producte1`
    FOREIGN KEY (`Producte_idProducte`)
    REFERENCES `exercici7`.`Producte` (`idProducte`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
