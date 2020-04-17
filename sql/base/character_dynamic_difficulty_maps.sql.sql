CREATE TABLE `character_dynamic_difficulty_maps`(  
  `guid` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Player GUID',
  `mapId` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Map Id',
  PRIMARY KEY (`guid`, `mapId`)
) ENGINE=INNODB CHARSET=utf8 COLLATE=utf8_general_ci;