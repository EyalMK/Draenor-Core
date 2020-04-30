-- Update relation Clicker to Clickee
UPDATE `npc_spellclick_spells` SET `cast_flags`=1 WHERE `spell_id`=93455;


UPDATE `creature_template` SET `npcflag`=16777216 WHERE `entry` IN (41099,41100,41101,41103,41104,41109,41111);
