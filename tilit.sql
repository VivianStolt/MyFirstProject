-- Sosiaaliset tilit

SET NAMES 'utf8';
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS supports;
CREATE SCHEMA supports;
USE supports;

-- Table `genders`
CREATE TABLE IF NOT EXISTS `genders` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `gender` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `gender_UNIQUE` (`gender` ASC))
ENGINE = InnoDB;

-- Table `fitness_goals`
CREATE TABLE IF NOT EXISTS `fitness_goals` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `fitness_goal` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `fitness_goal_UNIQUE` (`fitness_goal` ASC))
ENGINE = InnoDB;

-- Table `skill_levels`
CREATE TABLE IF NOT EXISTS `skill_levels` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `skill_level` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `skill_level_UNIQUE` (`skill_level` ASC))
ENGINE = InnoDB;

-- Table `users`
CREATE TABLE IF NOT EXISTS `users` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(255) NOT NULL,  -- Increased length for hashed passwords
  `email` VARCHAR(45) NOT NULL,
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gender_id` INT,
  `height` DECIMAL(5,2),
  `weight` DECIMAL(5,2),
  `age` INT,
  `sport` VARCHAR(255),
  `activity_level` VARCHAR(50),
  `fitness_goal_id` INT,
  `skill_level_id` INT,
  `other_health_trackers` TEXT,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  INDEX `fk_gender_id_idx` (`gender_id` ASC),
  INDEX `fk_fitness_goal_id_idx` (`fitness_goal_id` ASC),
  INDEX `fk_skill_level_id_idx` (`skill_level_id` ASC),
  CONSTRAINT `fk_gender_id`
    FOREIGN KEY (`gender_id`)
    REFERENCES `genders` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_fitness_goal_id`
    FOREIGN KEY (`fitness_goal_id`)
    REFERENCES `fitness_goals` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_skill_level_id`
    FOREIGN KEY (`skill_level_id`)
    REFERENCES `skill_levels` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Table `social_accounts`
CREATE TABLE IF NOT EXISTS `social_accounts` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `provider` VARCHAR(45) NOT NULL,
  `provider_user_id` VARCHAR(255) NOT NULL,
  `access_token` VARCHAR(255) NOT NULL,
  `refresh_token` VARCHAR(255),
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `gender_id` INT,
  `height` DECIMAL(5,2),
  `weight` DECIMAL(5,2),
  `age` INT,
  `sport` VARCHAR(255),
  `activity_level` VARCHAR(50),
  `fitness_goal_id` INT,
  `skill_level_id` INT,
  `other_health_trackers` TEXT,
  PRIMARY KEY (`id`),
  INDEX `fk_user_id_idx` (`user_id` ASC),
  INDEX `fk_gender_id_idx` (`gender_id` ASC),
  INDEX `fk_fitness_goal_id_idx` (`fitness_goal_id` ASC),
  INDEX `fk_skill_level_id_idx` (`skill_level_id` ASC),
  CONSTRAINT `fk_user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `users` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_gender_id_social`
    FOREIGN KEY (`gender_id`)
    REFERENCES `genders` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_fitness_goal_id_social`
    FOREIGN KEY (`fitness_goal_id`)
    REFERENCES `fitness_goals` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
  CONSTRAINT `fk_skill_level_id_social`
    FOREIGN KEY (`skill_level_id`)
    REFERENCES `skill_levels` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;

-- Table `sports`
CREATE TABLE IF NOT EXISTS `sports` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `sport_name` VARCHAR(255) NOT NULL,
  `MET` DECIMAL(4,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `sport_name_UNIQUE` (`sport_name` ASC))
ENGINE = InnoDB;

-- Table `activity_levels`
CREATE TABLE IF NOT EXISTS `activity_levels` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `activity_level` VARCHAR(50) NOT NULL,
  `description` TEXT NOT NULL,
  `activity_factor` DECIMAL(3,2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `activity_level_UNIQUE` (`activity_level` ASC))
ENGINE = InnoDB;

-- Table `other_health_trackers`
CREATE TABLE IF NOT EXISTS `other_health_trackers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tracker_name` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `tracker_name_UNIQUE` (`tracker_name` ASC))
ENGINE = InnoDB;

-- Restore unique and foreign key checks
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET SQL_MODE=@OLD_SQL_MODE;