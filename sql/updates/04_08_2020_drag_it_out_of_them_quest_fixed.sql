-- https://cata-twinhead.twinstar.cz/?quest=13961
update creature_template set gossip_menu_id=10519, AIName="", Scriptname="npc_razormane_pillager_34503" where entry=34503;

update gossip_menu_option set option_id=1, npc_option_npcflag=1 where menu_id=10519;

update creature_template set AIName="", Scriptname="npc_hogtied_razormane_34514" where entry=34514;

delete from areatrigger_scripts where entry=5465;
insert into areatrigger_scripts values
(5465, "at_groldoms_farm_5465");

UPDATE `creature` SET `MovementType`=0, `spawndist`=0 WHERE `id`=34346;

