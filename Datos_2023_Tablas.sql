-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema nominas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema nominascategorias
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `nominas` DEFAULT CHARACTER SET utf8mb3 ;
USE `nominas` ;

-- -----------------------------------------------------
-- Table `nominas`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nominas`.`categorias` (
  `IdCategoria` INT NOT NULL,
  `NombreCategoria` VARCHAR(75) NOT NULL,
  `SalarioBaseCategoria` DOUBLE NOT NULL,
  `ComplementoCategoria` DOUBLE NOT NULL,
  PRIMARY KEY (`IdCategoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nominas`.`empresas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nominas`.`empresas` (
  `IdEmpresa` INT NOT NULL,
  `Nombre` VARCHAR(100) NOT NULL,
  `CIF` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`IdEmpresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nominas`.`trabajador`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nominas`.`trabajador` (
  `idtrabajador` INT NOT NULL,
  `Nombre` VARCHAR(50) NOT NULL,
  `Apellido1` VARCHAR(75) NOT NULL,
  `Apellido2` VARCHAR(75) NULL DEFAULT NULL,
  `NIFNIE` VARCHAR(10) NULL DEFAULT NULL,
  `email` VARCHAR(75) NULL DEFAULT NULL,
  `FechaAlta` DATE NULL DEFAULT NULL,
  `CodigoCuenta` VARCHAR(20) NULL DEFAULT NULL,
  `IBAN` VARCHAR(24) NULL DEFAULT NULL,
  `BajaLaboral` DATE NULL DEFAULT NULL,
  `AltaLaboral` DATE NULL DEFAULT NULL,
  `IdEmpresa` INT NOT NULL,
  `IdCategoria` INT NOT NULL,
  PRIMARY KEY (`idtrabajador`),
  INDEX `FK_ID_EMPRESAS_idx` (`IdEmpresa` ASC) VISIBLE,
  INDEX `FK_ID_CATEGORIAS_idx` (`IdCategoria` ASC) VISIBLE,
  CONSTRAINT `FK_ID_CATEGORIAS`
    FOREIGN KEY (`IdCategoria`)
    REFERENCES `nominas`.`categorias` (`IdCategoria`),
  CONSTRAINT `FK_ID_EMPRESAS`
    FOREIGN KEY (`IdEmpresa`)
    REFERENCES `nominas`.`empresas` (`IdEmpresa`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `nominas`.`nomina`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nominas`.`nomina` (
  `IdNomina` INT NOT NULL,
  `Mes` INT NOT NULL,
  `Anio` INT NOT NULL,
  `NumeroTrienios` INT NOT NULL,
  `ImporteTrienios` DOUBLE NULL DEFAULT NULL,
  `importeSalarioMes` DOUBLE NULL DEFAULT NULL,
  `importeComplementoMes` DOUBLE NULL DEFAULT NULL,
  `ValorProrrateo` DOUBLE NULL DEFAULT NULL,
  `brutoAnual` DOUBLE NULL DEFAULT NULL,
  `IRPF` DOUBLE NULL DEFAULT NULL,
  `ImporteIRPF` DOUBLE NULL DEFAULT NULL,
  `BaseEmpresario` DOUBLE NULL DEFAULT NULL,
  `SeguridadSocialEmpresario` DOUBLE NULL DEFAULT NULL,
  `ImporteSeguridadSocialEmpresario` DOUBLE NULL DEFAULT NULL,
  `DesempleoEmpresario` DOUBLE NULL DEFAULT NULL,
  `ImporteDesempleoEmpresario` DOUBLE NULL DEFAULT NULL,
  `FormacionEmpresario` DOUBLE NULL DEFAULT NULL,
  `ImporteFormacionEmpresario` DOUBLE NULL DEFAULT NULL,
  `AccidentesTrabajoEmpresario` DOUBLE NULL DEFAULT NULL,
  `ImporteAccidentesTrabajoEmpresario` DOUBLE NULL DEFAULT NULL,
  `FOGASAEmpresario` DOUBLE NULL DEFAULT NULL,
  `ImporteFOGASAEMpresario` DOUBLE NULL DEFAULT NULL,
  `SeguridadSocialTrabajador` DOUBLE NULL DEFAULT NULL,
  `ImporteSeguridadSocialTrabajador` DOUBLE NULL DEFAULT NULL,
  `DesempleoTrabajador` DOUBLE NULL DEFAULT NULL,
  `ImporteDesempleoTrabajador` DOUBLE NULL DEFAULT NULL,
  `FormacionTrabajador` DOUBLE NULL DEFAULT NULL,
  `ImporteFormacionTrabajador` DOUBLE NULL DEFAULT NULL,
  `BrutoNomina` DOUBLE NULL DEFAULT NULL,
  `LiquidoNomina` DOUBLE NULL DEFAULT NULL,
  `CosteTotalEmpresario` DOUBLE NULL DEFAULT NULL,
  `DiasBaja` INT NULL DEFAULT NULL,
  `ImporteDescuentoBaja` DOUBLE NULL DEFAULT NULL,
  `IdTrabajador` INT NULL DEFAULT NULL,
  PRIMARY KEY (`IdNomina`),
  INDEX `FK_ID_TRABAJADOR_idx` (`IdTrabajador` ASC) VISIBLE,
  CONSTRAINT `FK_ID_TRABAJADOR`
    FOREIGN KEY (`IdTrabajador`)
    REFERENCES `nominas`.`trabajador` (`idtrabajador`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;