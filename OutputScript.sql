-- MySQL Script generated by MySQL Workbench
-- Tue May  3 10:46:26 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Facundo_Azcurra
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Facundo_Azcurra
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Facundo_Azcurra` DEFAULT CHARACTER SET latin1 ;
USE `Facundo_Azcurra` ;

-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Administratives`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Administratives` (
  `idAdministratives` INT(11) NOT NULL,
  PRIMARY KEY (`idAdministratives`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Ambulances`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Ambulances` (
  `idAmbulances` INT(11) NOT NULL,
  `ambulanceDriverId` INT(11) NOT NULL,
  PRIMARY KEY (`idAmbulances`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`AmbulanceDriver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`AmbulanceDriver` (
  `idAmbulanceDriver` INT(11) NOT NULL,
  `hasPCRKnowledge` TINYINT(4) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `Ambulances_idAmbulances` INT(11) NOT NULL,
  PRIMARY KEY (`idAmbulanceDriver`),
  INDEX `fk_AmbulanceDriver_Ambulances_idx` (`Ambulances_idAmbulances` ASC) VISIBLE,
  CONSTRAINT `fk_AmbulanceDriver_Ambulances`
    FOREIGN KEY (`Ambulances_idAmbulances`)
    REFERENCES `Facundo_Azcurra`.`Ambulances` (`idAmbulances`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Rooms` (
  `idRooms` INT NOT NULL,
  `isAvailable` TINYINT NOT NULL,
  `floor` INT NOT NULL,
  PRIMARY KEY (`idRooms`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`DoctorOffice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`DoctorOffice` (
  `idDoctorOffice` INT(11) NOT NULL,
  `Rooms_idRooms` INT NOT NULL,
  PRIMARY KEY (`idDoctorOffice`),
  INDEX `fk_DoctorOffice_Rooms1_idx` (`Rooms_idRooms` ASC) VISIBLE,
  CONSTRAINT `fk_DoctorOffice_Rooms1`
    FOREIGN KEY (`Rooms_idRooms`)
    REFERENCES `Facundo_Azcurra`.`Rooms` (`idRooms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Appointments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Appointments` (
  `idAppointments` INT(11) NOT NULL,
  `doctorAppointment` VARCHAR(45) NOT NULL,
  `DoctorOffice_idDoctorOffice` INT(11) NOT NULL,
  PRIMARY KEY (`idAppointments`),
  INDEX `fk_Appointments_DoctorOffice1_idx` (`DoctorOffice_idDoctorOffice` ASC) VISIBLE,
  CONSTRAINT `fk_Appointments_DoctorOffice1`
    FOREIGN KEY (`DoctorOffice_idDoctorOffice`)
    REFERENCES `Facundo_Azcurra`.`DoctorOffice` (`idDoctorOffice`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Chirophane`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Chirophane` (
  `idChirophane` INT(11) NOT NULL,
  `isAvailable` TINYINT(4) NOT NULL,
  `floor` INT(11) NOT NULL,
  `Rooms_idRooms` INT NOT NULL,
  PRIMARY KEY (`idChirophane`),
  INDEX `fk_Chirophane_Rooms1_idx` (`Rooms_idRooms` ASC) VISIBLE,
  CONSTRAINT `fk_Chirophane_Rooms1`
    FOREIGN KEY (`Rooms_idRooms`)
    REFERENCES `Facundo_Azcurra`.`Rooms` (`idRooms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`ChirophaneTrainees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`ChirophaneTrainees` (
  `idChirophanTrainees` INT(11) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idChirophanTrainees`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`DeliveryRooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`DeliveryRooms` (
  `idDeliveryRooms` INT(11) NOT NULL,
  `childbirthDoctorId` INT(11) NOT NULL,
  `isAvailable` TINYINT(4) NOT NULL,
  `Rooms_idRooms` INT NOT NULL,
  PRIMARY KEY (`idDeliveryRooms`),
  INDEX `fk_DeliveryRooms_Rooms1_idx` (`Rooms_idRooms` ASC) VISIBLE,
  CONSTRAINT `fk_DeliveryRooms_Rooms1`
    FOREIGN KEY (`Rooms_idRooms`)
    REFERENCES `Facundo_Azcurra`.`Rooms` (`idRooms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`HealthCareInsurance`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`HealthCareInsurance` (
  `idHealthCareInsurance` INT(11) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idHealthCareInsurance`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`IntensiveCare`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`IntensiveCare` (
  `idIntensiveCare` INT(11) NOT NULL,
  `intensiveCareRoom` VARCHAR(45) NOT NULL,
  `intensiveCareMedicId` DOUBLE NOT NULL,
  `Rooms_idRooms` INT NOT NULL,
  PRIMARY KEY (`idIntensiveCare`),
  INDEX `fk_IntensiveCare_Rooms1_idx` (`Rooms_idRooms` ASC) VISIBLE,
  CONSTRAINT `fk_IntensiveCare_Rooms1`
    FOREIGN KEY (`Rooms_idRooms`)
    REFERENCES `Facundo_Azcurra`.`Rooms` (`idRooms`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Managers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Managers` (
  `idManagers` INT(11) NOT NULL,
  `economicsManager` TINYINT(4) NOT NULL,
  `directorManager` TINYINT(4) NOT NULL,
  `Administratives_idAdministratives` INT(11) NOT NULL,
  PRIMARY KEY (`idManagers`),
  INDEX `fk_Managers_Administratives1_idx` (`Administratives_idAdministratives` ASC) VISIBLE,
  CONSTRAINT `fk_Managers_Administratives1`
    FOREIGN KEY (`Administratives_idAdministratives`)
    REFERENCES `Facundo_Azcurra`.`Administratives` (`idAdministratives`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`MedicTrainees`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`MedicTrainees` (
  `idMedicTrainees` INT(11) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMedicTrainees`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Medics`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Medics` (
  `idMedics` INT(11) NOT NULL,
  `sex` VARCHAR(45) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `Appointments_idAppointments` INT(11) NOT NULL,
  PRIMARY KEY (`idMedics`),
  UNIQUE INDEX `idx_Medics_idMedics` (`idMedics` ASC) VISIBLE,
  INDEX `fk_Medics_Appointments1_idx` (`Appointments_idAppointments` ASC) VISIBLE,
  CONSTRAINT `fk_Medics_Appointments1`
    FOREIGN KEY (`Appointments_idAppointments`)
    REFERENCES `Facundo_Azcurra`.`Appointments` (`idAppointments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Nurses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Nurses` (
  `idNurses` INT(11) NOT NULL,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `IntensiveCare_idIntensiveCare` INT(11) NOT NULL,
  PRIMARY KEY (`idNurses`),
  INDEX `fk_Nurses_IntensiveCare1_idx` (`IntensiveCare_idIntensiveCare` ASC) VISIBLE,
  CONSTRAINT `fk_Nurses_IntensiveCare1`
    FOREIGN KEY (`IntensiveCare_idIntensiveCare`)
    REFERENCES `Facundo_Azcurra`.`IntensiveCare` (`idIntensiveCare`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Patients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Patients` (
  `idPatients` INT(11) NOT NULL,
  `isAttended` TINYINT(1) NOT NULL,
  `firstName` VARCHAR(50) NOT NULL,
  `lastName` VARCHAR(50) NOT NULL,
  `Medics_idMedics` INT(11) NOT NULL,
  `Appointments_idAppointments` INT(11) NOT NULL,
  PRIMARY KEY (`idPatients`),
  INDEX `fk_Patients_Medics1_idx` (`Medics_idMedics` ASC) VISIBLE,
  INDEX `fk_Patients_Appointments1_idx` (`Appointments_idAppointments` ASC) VISIBLE,
  CONSTRAINT `fk_Patients_Medics1`
    FOREIGN KEY (`Medics_idMedics`)
    REFERENCES `Facundo_Azcurra`.`Medics` (`idMedics`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patients_Appointments1`
    FOREIGN KEY (`Appointments_idAppointments`)
    REFERENCES `Facundo_Azcurra`.`Appointments` (`idAppointments`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `Facundo_Azcurra`.`Prescription`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Facundo_Azcurra`.`Prescription` (
  `idPrescription` INT(11) NOT NULL,
  `idMedic` VARCHAR(45) NOT NULL,
  `idPatient` VARCHAR(45) NOT NULL,
  `price` INT(11) NOT NULL,
  `Medics_idMedics` INT(11) NOT NULL,
  `Patients_idPatients` INT(11) NOT NULL,
  PRIMARY KEY (`idPrescription`),
  INDEX `fk_Prescription_Medics1_idx` (`Medics_idMedics` ASC) VISIBLE,
  INDEX `fk_Prescription_Patients1_idx` (`Patients_idPatients` ASC) VISIBLE,
  CONSTRAINT `fk_Prescription_Medics1`
    FOREIGN KEY (`Medics_idMedics`)
    REFERENCES `Facundo_Azcurra`.`Medics` (`idMedics`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Prescription_Patients1`
    FOREIGN KEY (`Patients_idPatients`)
    REFERENCES `Facundo_Azcurra`.`Patients` (`idPatients`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;