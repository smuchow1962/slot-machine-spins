-- MySQL Script generated by MySQL Workbench
-- 05/16/16 16:08:51
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema spintestDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `spintestDB` ;

-- -----------------------------------------------------
-- Schema spintestDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spintestDB` DEFAULT CHARACTER SET utf8 ;
USE `spintestDB` ;

-- -----------------------------------------------------
-- Table `spintestDB`.`users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `spintestDB`.`users` ;

CREATE TABLE `users` (
  `player_id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'primary key.',
  `given_name` varchar(128) NOT NULL COMMENT 'Assume 128 size max for now. Would be better to have given and surname entries and concatenate.',
  `surname` varchar(128) NOT NULL COMMENT 'The last name of the user.',
  `lifetime_spins` int(11) unsigned DEFAULT NULL COMMENT 'int chosen for simplicity. INT_MAX at 1Hz is 136+ years.',
  `current_coin_balance` int(11) DEFAULT '0' COMMENT 'This is the difference between the bet and won values initially (the plan is to add coins to this balance by credit card swipe. If the coins bet is 0 or less, then the credit balance is deducted. For the future, the balance is sent to the client.',
  `total_coins_bet` int(11) unsigned DEFAULT '0' COMMENT 'This number is a measure of how much the user has actually paid into the system. This is real money - not winnings.',
  `total_coins_won` int(11) unsigned DEFAULT '0' COMMENT 'This is the total number of credits actually won. for each win, this number is increased.',
  `hash_salt_value` varchar(45) DEFAULT NULL COMMENT 'used to make similar passwords unique across all users (the hash will never be the same).',
  `password_hashed` varchar(128) DEFAULT 'nothing' COMMENT 'make it bug enough for more flexibility ',
  `isDeleted` tinyint(1) NOT NULL DEFAULT '0' COMMENT 'For lazy database deletion. The customer may return in the future.\n',
  `firstSpinDate` datetime DEFAULT NULL COMMENT 'This is the first time the user ever spun the slot.\n',
  `lastSpinDate` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT 'This makes lifetime average return easier - subtract ',
  `creationDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`player_id`),
  UNIQUE KEY `userId_UNIQUE` (`player_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;  
  
INSERT INTO `spintestdb`.`users` (`player_id`, `given_name`, `surname`, `lifetime_spins`, `current_coin_balance`, `total_coins_bet`, `total_coins_won`, `password_hashed`, `hash_salt_value`, `isDeleted`) VALUES ('1', 'Steve', 'Muchow', '0', '0', '0', '0', 'd0bc463c7973415cb0a1ba98a53ea4e6','STEVEMUCHOW1', '0');
INSERT INTO `spintestdb`.`users` (`player_id`, `given_name`, `surname`, `lifetime_spins`, `current_coin_balance`, `total_coins_bet`, `total_coins_won`, `hash_salt_value`, `isDeleted`) VALUES ('2', 'Dawn', 'Efaw', '0', '0', '0', '0', 'STEVEMUCHOW1', '0');

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;



