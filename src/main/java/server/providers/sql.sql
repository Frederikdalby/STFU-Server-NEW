-- MySQL Script generated by MySQL Workbench
-- Thu Oct 19 15:45:38 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema stfu
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema stfu
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `stfu` DEFAULT CHARACTER SET latin1 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `stfu`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stfu`.`students` (
  `idStudent` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(100) NOT NULL,
  `lastName` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `createdTime` LONGTEXT NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`idStudent`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `idStudent_UNIQUE` (`idStudent` ASC))
  ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`tokens`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tokens` (
  `token` VARCHAR(255) NOT NULL,
  `students_idStudent` INT(11) NOT NULL,
  PRIMARY KEY (`token`, `students_idStudent`),
  INDEX `fk_tokens_students_idx` (`students_idStudent` ASC),
  CONSTRAINT `fk_tokens_students`
  FOREIGN KEY (`students_idStudent`)
  REFERENCES `stfu`.`students` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB;

USE `stfu` ;

-- -----------------------------------------------------
-- Table `stfu`.`dsevent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stfu`.`dsevent` (
  `idEvent` INT(11) NOT NULL AUTO_INCREMENT,
  `eventName` VARCHAR(100) NOT NULL,
  `idStudent` VARCHAR(100) NOT NULL,
  `location` VARCHAR(100) NOT NULL,
  `price` INT(11) NOT NULL,
  `eventDate` DATE NOT NULL,
  `description` LONGTEXT NOT NULL,
  PRIMARY KEY (`idEvent`),
  UNIQUE INDEX `idEvent_UNIQUE` (`idEvent` ASC))
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `stfu`.`students_has_dsevent`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `stfu`.`students_has_dsevent` (
  `students_idStudent` INT(11) NOT NULL,
  `dsevent_idEvent` INT(11) NOT NULL,
  PRIMARY KEY (`students_idStudent`, `dsevent_idEvent`),
  INDEX `fk_students_has_dsevent_dsevent1_idx` (`dsevent_idEvent` ASC),
  INDEX `fk_students_has_dsevent_students_idx` (`students_idStudent` ASC),
  CONSTRAINT `fk_students_has_dsevent_dsevent1`
  FOREIGN KEY (`dsevent_idEvent`)
  REFERENCES `stfu`.`dsevent` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_dsevent_students`
  FOREIGN KEY (`students_idStudent`)
  REFERENCES `stfu`.`students` (`idStudent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
  ENGINE = InnoDB
  DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
