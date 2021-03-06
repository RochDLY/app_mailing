-- MySQL Script generated by MySQL Workbench
-- Wed Feb 27 10:19:05 2019
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
CREATE SCHEMA IF NOT EXISTS `prospection` DEFAULT CHARACTER SET utf8 ;
USE `prospection` ;

-- -----------------------------------------------------
-- Table `mydb`.`etab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`etab` (
  `id_etab` INT NOT NULL AUTO_INCREMENT,
  `url_labo_etab` VARCHAR(45) NULL,
  `ville_etab` VARCHAR(45) NULL,
  `cp_etab` INT NULL,
  `pays_etab` VARCHAR(45) NULL,
  `responsableLabo_etab` TINYINT NULL,
  `affiliation1_etab` VARCHAR(45) NULL,
  `affiliation2_etab` VARCHAR(45) NULL,
  `origine_etab` VARCHAR(45) NULL,
  `adresse_etab` VARCHAR(45) NULL,
  PRIMARY KEY (`id_etab`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prospect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`prospect` (
  `id_prospect` INT NOT NULL AUTO_INCREMENT,
  `nom_prenom` VARCHAR(45) NULL,
  `langue_propect` VARCHAR(45) NULL,
  `email_prospect` VARCHAR(45) NULL,
  `email2_prospect` VARCHAR(45) NULL,
  `clientIste_prospect` VARCHAR(45) NULL,
  `membreEdito_prospect` VARCHAR(45) NULL,
  PRIMARY KEY (`id_prospect`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`nomenclature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`nomenclature` (
  `id_nomenclature` INT NOT NULL,
  `code` VARCHAR(45) NULL,
  `label` VARCHAR(45) NULL,
  PRIMARY KEY (`id_nomenclature`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prospect_nomenclature`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`prospect_nomenclature` (
  `id_prospect` INT NOT NULL,
  `id_nomenclature` INT NOT NULL,
  `maj` VARCHAR(45) NULL,
  PRIMARY KEY (`id_prospect`, `id_nomenclature`),
  INDEX `fk_prospect_has_nomenclature_nomenclature1_idx` (`id_nomenclature` ASC),
  INDEX `fk_prospect_has_nomenclature_prospect_idx` (`id_prospect` ASC),
  CONSTRAINT `fk_prospect_has_nomenclature_prospect`
    FOREIGN KEY (`id_prospect`)
    REFERENCES `mydb`.`prospect` (`id_prospect`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prospect_has_nomenclature_nomenclature1`
    FOREIGN KEY (`id_nomenclature`)
    REFERENCES `mydb`.`nomenclature` (`id_nomenclature`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`export`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`export` (
  `id_export` INT NOT NULL AUTO_INCREMENT,
  `date_gen` DATETIME NULL,
  `criteres` VARCHAR(255) NULL,
  `fichier` VARCHAR(45) NULL,
  PRIMARY KEY (`id_export`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prospect_export`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`prospect_export` (
  `id_prospect` INT NOT NULL,
  `export_id_export` INT NOT NULL,
  `maj` VARCHAR(45) NULL,
  PRIMARY KEY (`id_prospect`, `export_id_export`),
  INDEX `fk_prospect_has_export_export1_idx` (`export_id_export` ASC),
  INDEX `fk_prospect_has_export_prospect1_idx` (`id_prospect` ASC),
  CONSTRAINT `fk_prospect_has_export_prospect1`
    FOREIGN KEY (`id_prospect`)
    REFERENCES `mydb`.`prospect` (`id_prospect`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prospect_has_export_export1`
    FOREIGN KEY (`export_id_export`)
    REFERENCES `mydb`.`export` (`id_export`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`prospect_etab`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`prospect_etab` (
  `id_prospect` INT NOT NULL,
  `id_etab` INT NOT NULL,
  `maj` DATETIME NULL,
  PRIMARY KEY (`id_prospect`, `id_etab`),
  INDEX `fk_prospect_has_etablissement_etablissement1_idx` (`id_etab` ASC),
  INDEX `fk_prospect_has_etablissement_prospect1_idx` (`id_prospect` ASC),
  CONSTRAINT `fk_prospect_has_etablissement_prospect1`
    FOREIGN KEY (`id_prospect`)
    REFERENCES `mydb`.`prospect` (`id_prospect`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_prospect_has_etablissement_etablissement1`
    FOREIGN KEY (`id_etab`)
    REFERENCES `mydb`.`etab` (`id_etab`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`import`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`import` (
  `id_import` INT NOT NULL,
  `fichier` VARCHAR(45) NULL,
  `maj` VARCHAR(45) NULL,
  PRIMARY KEY (`id_import`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`import_data`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `prospection`.`import_data` (
  `id_import_data` INT NOT NULL,
  `col1` VARCHAR(45) NULL,
  `col2` VARCHAR(45) NULL,
  `col3` VARCHAR(45) NULL,
  `maj` DATETIME NULL,
  `id_import` INT NOT NULL,
  `id_obj` INT NULL,
  `type_obj` VARCHAR(45) NULL,
  `action_obj` VARCHAR(45) NULL,
  PRIMARY KEY (`id_import_data`, `id_import`),
  INDEX `fk_import_data_import1_idx` (`id_import` ASC),
  CONSTRAINT `fk_import_data_import1`
    FOREIGN KEY (`id_import`)
    REFERENCES `mydb`.`import` (`id_import`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
