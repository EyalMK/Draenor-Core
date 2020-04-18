DROP TABLE IF EXISTS `boss_loot_weekly_quest`;
CREATE TABLE `boss_loot_weekly_quest` (
  `entry` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Boss Entry',
  `questId` MEDIUMINT(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT 'Quest Entry',
  `comment` text DEFAULT NULL,
  PRIMARY KEY (`entry`,`questId`)
) ENGINE=MYISAM DEFAULT CHARSET=utf8 COMMENT='Loot-based Lockout System';