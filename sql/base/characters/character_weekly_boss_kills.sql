/*Table structure for table `character_weekly_boss_kills` */

DROP TABLE IF EXISTS `character_weekly_boss_kills`;
CREATE TABLE `character_weekly_boss_kills` (
  `guid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT 'Player GUID',
  `entry` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Boss Entry',
  `mapId` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Map Id',
  `difficulty` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT 'Difficulty',
  `looted` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT 'Boss looted',
  PRIMARY KEY (`guid`,`entry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Loot-based Lockout System';

/*Data for the table `character_weekly_boss_kills` */