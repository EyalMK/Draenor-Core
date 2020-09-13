/*
--Quest The Vengance of Elune. https://www.wowhead.com/quest=14005/the-vengeance-of-elune

--Enable spell start on quest take, special effects all work.
--Enable Remove *auras due to spell. On quest handin.
--Enable DUMMY spell SpellScript.
--Spell to remove auras is (SPELL_EFFECT_SCRIPT_EFFECT) added script to remove auras after quest hand in.
*/ 
delete from `spell_scripts` where `id`=66166 and `datalong` in(65602,65626);
insert into `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('66166','0','0','14','65602','1','0','0','0','0','0');
insert into `spell_scripts` (`id`, `effIndex`, `delay`, `command`, `datalong`, `datalong2`, `dataint`, `x`, `y`, `z`, `o`) values('66166','0','0','14','65626','1','0','0','0','0','0');

-- quest spells added on QUEST_ACCEPT and QUEST_REWARDED.
UPDATE `quest_template` SET `SourceSpellId`=65602,`RewardSpellCast`=66166 WHERE `id`=14005;