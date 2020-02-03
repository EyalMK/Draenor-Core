UPDATE `updates` SET `state`='ARCHIVED';
ALTER TABLE `creature_display_info` CHANGE `Unknown620` `PlayerModelScale` float NOT NULL DEFAULT '0';
ALTER TABLE `battle_pet_species_locale`
  CHANGE `SourceText` `SourceText_lang` text,
  CHANGE `Description` `Description_lang` text;

ALTER TABLE `creature_display_info_locale`
  CHANGE `TextureVariation_lang1` `TextureVariation1_lang` text,
  CHANGE `TextureVariation_lang2` `TextureVariation2_lang` text,
  CHANGE `TextureVariation_lang3` `TextureVariation3_lang` text;

ALTER TABLE `gameobjects` CHANGE `Data7` `Data8` int(10) NOT NULL DEFAULT '0' AFTER `Data6`;
ALTER TABLE `gameobjects` CHANGE `Data6` `Data7` int(10) NOT NULL DEFAULT '0' AFTER `Data5`;
ALTER TABLE `gameobjects` CHANGE `Data5` `Data6` int(10) NOT NULL DEFAULT '0' AFTER `Data4`;
ALTER TABLE `gameobjects` CHANGE `Data4` `Data5` int(10) NOT NULL DEFAULT '0' AFTER `Data3`;
ALTER TABLE `gameobjects` CHANGE `Data3` `Data4` int(10) NOT NULL DEFAULT '0' AFTER `Data2`;
ALTER TABLE `gameobjects` CHANGE `Data2` `Data3` int(10) NOT NULL DEFAULT '0' AFTER `Data1`;
ALTER TABLE `gameobjects` CHANGE `Data1` `Data2` int(10) NOT NULL DEFAULT '0' AFTER `Data0`;
ALTER TABLE `gameobjects` CHANGE `Data0` `Data1` int(10) NOT NULL DEFAULT '0' AFTER `Type`;

ALTER TABLE `phase_group` RENAME `phase_x_phase_group`;
--
-- Table structure for table `spell_procs_per_minute`
--

DROP TABLE IF EXISTS `spell_procs_per_minute`;
CREATE TABLE `spell_procs_per_minute` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `BaseProcRate` float NOT NULL DEFAULT '0',
  `Flags` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `spell_procs_per_minute_mod`
--
DROP TABLE IF EXISTS `spell_procs_per_minute_mod`;
CREATE TABLE `spell_procs_per_minute_mod` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `Type` int(10) unsigned NOT NULL DEFAULT '0',
  `Param` int(10) unsigned NOT NULL DEFAULT '0',
  `Coeff` float NOT NULL DEFAULT '0',
  `SpellProcsPerMinuteID` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
--
-- Table structure for table `item_upgrade`
--
DROP TABLE IF EXISTS `item_upgrade`;
CREATE TABLE `item_upgrade` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemUpgradePathID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemLevelBonus` int(10) unsigned NOT NULL DEFAULT '0',
  `PrevItemUpgradeID` int(10) unsigned NOT NULL DEFAULT '0',
  `CurrencyID` int(10) unsigned NOT NULL DEFAULT '0',
  `CurrencyCost` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Table structure for table `ruleset_item_upgrade`
--
DROP TABLE IF EXISTS `ruleset_item_upgrade`;
CREATE TABLE `ruleset_item_upgrade` (
  `ID` int(10) unsigned NOT NULL DEFAULT '0',
  `RulesetID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemUpgradeID` int(10) unsigned NOT NULL DEFAULT '0',
  `ItemID` int(10) unsigned NOT NULL DEFAULT '0',
  `VerifiedBuild` smallint(6) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
