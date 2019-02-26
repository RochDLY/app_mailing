-- MySQL Script generated by MySQL Workbench
-- Tue Feb 26 10:23:29 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`clef`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clef` (
  `id_clef` INT NOT NULL AUTO_INCREMENT,
  `mail_clef` VARCHAR(50) NULL,
  PRIMARY KEY (`id_clef`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`coordonnee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`coordonnee` (
  `id_coordonnee` INT NOT NULL AUTO_INCREMENT,
  `url_labo_coordonnee` VARCHAR(45) NULL,
  `nom_prenom_coordonnee` VARCHAR(75) NULL,
  `ville_coordonnee` VARCHAR(45) NULL,
  `pays_coordonnee` VARCHAR(45) NULL,
  `langue_coordonnee` VARCHAR(45) NULL,
  `email_secondaire_coordonnee` VARCHAR(45) NULL,
  `responsableLabo_coordonnee` TINYINT NULL,
  `clientIste_coordonnee` TINYINT NULL,
  `membreEditorial_coordonnee` TINYINT NULL,
  `clef_id_clef` INT NOT NULL,
  PRIMARY KEY (`id_coordonnee`, `clef_id_clef`),
  INDEX `fk_coordonnee_clef1_idx` (`clef_id_clef` ASC) VISIBLE,
  CONSTRAINT `fk_coordonnee_clef1`
    FOREIGN KEY (`clef_id_clef`)
    REFERENCES `mydb`.`clef` (`id_clef`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`nomenclature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`nomenclature` (
  `id_nomenclature` INT NOT NULL AUTO_INCREMENT,
  `code_nomenclature` INT NULL,
  `clef_id_clef` INT NOT NULL,
  PRIMARY KEY (`id_nomenclature`, `clef_id_clef`),
  INDEX `fk_nomenclature_clef1_idx` (`clef_id_clef` ASC) VISIBLE,
  CONSTRAINT `fk_nomenclature_clef1`
    FOREIGN KEY (`clef_id_clef`)
    REFERENCES `mydb`.`clef` (`id_clef`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`affiliation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`affiliation` (
  `id_affiliation` INT NOT NULL AUTO_INCREMENT,
  `nom_affiliation` VARCHAR(45) NULL,
  `clef_id_clef` INT NOT NULL,
  PRIMARY KEY (`id_affiliation`, `clef_id_clef`),
  INDEX `fk_affiliation_clef1_idx` (`clef_id_clef` ASC) VISIBLE,
  CONSTRAINT `fk_affiliation_clef1`
    FOREIGN KEY (`clef_id_clef`)
    REFERENCES `mydb`.`clef` (`id_clef`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`infos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`infos` (
  `id_infos` INT NOT NULL AUTO_INCREMENT,
  `autre_infos` MEDIUMTEXT NULL,
  `clef_id_clef` INT NOT NULL,
  PRIMARY KEY (`id_infos`, `clef_id_clef`),
  INDEX `fk_infos_clef1_idx` (`clef_id_clef` ASC) VISIBLE,
  CONSTRAINT `fk_infos_clef1`
    FOREIGN KEY (`clef_id_clef`)
    REFERENCES `mydb`.`clef` (`id_clef`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`maj`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`maj` (
  `id_maj` INT NOT NULL AUTO_INCREMENT,
  `date_maj` DATE NULL,
  `clef_id_clef` INT NOT NULL,
  PRIMARY KEY (`id_maj`, `clef_id_clef`),
  INDEX `fk_maj_clef1_idx` (`clef_id_clef` ASC) VISIBLE,
  CONSTRAINT `fk_maj_clef1`
    FOREIGN KEY (`clef_id_clef`)
    REFERENCES `mydb`.`clef` (`id_clef`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
