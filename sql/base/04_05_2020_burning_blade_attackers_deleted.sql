-- Burning Blade Mounts and Attackers should only spawn during Mor'shan Caravan Delivery quest which is unscripted.
-- Spell 96786 Summons Burning Blade Mounts. 
DELETE FROM `creature` WHERE `id` IN (52338, 52337, 52386);