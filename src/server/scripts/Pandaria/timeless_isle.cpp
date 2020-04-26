////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptPCH.h"
#include "ScriptedEscortAI.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptMgr.h"
#include "timeless_isle.h"

// Anduin Wrynn - 73061
class npc_prince_anduin : public CreatureScript
{
    public:
        npc_prince_anduin() : CreatureScript("npc_prince_anduin")
        {
        }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_prince_anduinAI(creature);
        }

        struct npc_prince_anduinAI : public ScriptedAI
        {
            npc_prince_anduinAI(Creature* creature) : ScriptedAI(creature)
            {
            }

            EventMap events;

            void DoAction(const int32 action)
            {
                switch (action)
                {
                    case ACTION_PRINCE_TALK_1:
                        Talk(0);
                        break;
                    case ACTION_PRINCE_TALK_2:
                        Talk(1);
                        break;
                    case ACTION_PRINCE_TALK_3:
                        Talk(2);
                        break;
                    case ACTION_PRINCE_TALK_4:
                        Talk(3);
                        break;
                    case ACTION_PRINCE_TALK_5:
                        Talk(4);
                        break;
                    default:
                        break;
                }
            }

            void UpdateAI(const uint32 /*p_Diff*/)
            {
            }
        };
};

// Kairoz - 72870
class npc_kairoz : public CreatureScript
{
    public:
        npc_kairoz() : CreatureScript("npc_kairoz")
        {
        }

        bool OnQuestReward(Player* player, Creature* creature, Quest const* quest, uint32 /*opt*/)
        {
            if (quest->GetQuestId() == QUEST_TIME_KEEPER_KAIROZ_H || quest->GetQuestId() == QUEST_TIME_KEEPER_KAIROZ_A)
            {
                if (creature->isQuestGiver() && creature->AI())
                {
                    creature->AI()->SetGUID(player ? player->GetGUID() : 0);
                    creature->AI()->DoAction(ACTION_CONVERSATION);
                }
            }
            return true;
        }

        CreatureAI* GetAI(Creature* creature) const
        {
            return new npc_kairozAI(creature);
        }

        struct npc_kairozAI : public ScriptedAI
        {
            npc_kairozAI(Creature* creature) : ScriptedAI(creature)
            {
            }

            EventMap events;
            uint64 playerGuid;
            bool conversationEngaged;

            void Reset()
            {
                playerGuid = 0;
                conversationEngaged = false;
            }

            void SetGUID(uint64 guid, int32 /*p_Id*/ /*= 0*/)
            {
                playerGuid = guid;
            }

            void DoAction(const int32 action)
            {
                switch (action)
                {
                    case ACTION_KAIROZ_TALK_1:
                        Talk(0);
                        break;
                    case ACTION_KAIROZ_TALK_2:
                        Talk(1);
                        break;
                    case ACTION_KAIROZ_TALK_3:
                        Talk(2);
                        break;
                    case ACTION_KAIROZ_TALK_4:
                        Talk(3);
                        break;
                    case ACTION_KAIROZ_TALK_5:
                        Talk(4);
                        break;
                    case ACTION_CONVERSATION:
                        if (!conversationEngaged)
                        {
                            conversationEngaged = true;
                            events.ScheduleEvent(EVENT_PRINCE_TALK_1, 3000);
                            events.ScheduleEvent(EVENT_KAIROZ_TALK_1, 6000);
                            events.ScheduleEvent(EVENT_PRINCE_TALK_2, 11000);
                            events.ScheduleEvent(EVENT_KAIROZ_TALK_2, 18000);
                            events.ScheduleEvent(EVENT_PRINCE_TALK_3, 25000);
                            events.ScheduleEvent(EVENT_KAIROZ_TALK_3, 32000);
                            events.ScheduleEvent(EVENT_PRINCE_TALK_4, 39000);
                            events.ScheduleEvent(EVENT_KAIROZ_TALK_4, 46000);
                            events.ScheduleEvent(EVENT_KAIROZ_TALK_5, 54000);
                            events.ScheduleEvent(EVENT_PRINCE_TALK_5, 60000);
                        }
                        break;
                    default:
                        break;
                }
            }

            void UpdateAI(const uint32 diff)
            {
                events.Update(diff);

                if (Player* player = Player::GetPlayer(*me, playerGuid))
                {
                    std::list<Creature*> princeAnduinList;
                    GetCreatureListWithEntryInGrid(princeAnduinList, me, NPC_PRINCE_ANDUIN, 7.0f);

                    while (uint32 eventId = events.ExecuteEvent())
                    {
                        switch (eventId)
                        {
                            case EVENT_PRINCE_TALK_1:
                                if (!princeAnduinList.empty())
                                    for (auto princeAnduin: princeAnduinList)
                                        princeAnduin->AI()->DoAction(ACTION_PRINCE_TALK_1);
                                break;
                            case EVENT_KAIROZ_TALK_1:
                                DoAction(ACTION_KAIROZ_TALK_1);
                                break;
                            case EVENT_PRINCE_TALK_2:
                                if (!princeAnduinList.empty())
                                    for (auto princeAnduin: princeAnduinList)
                                        princeAnduin->AI()->DoAction(ACTION_PRINCE_TALK_2);
                                break;
                            case EVENT_KAIROZ_TALK_2:
                                DoAction(ACTION_KAIROZ_TALK_2);
                                break;
                            case EVENT_PRINCE_TALK_3:
                                if (!princeAnduinList.empty())
                                    for (auto princeAnduin: princeAnduinList)
                                        princeAnduin->AI()->DoAction(ACTION_PRINCE_TALK_3);
                                break;
                            case EVENT_KAIROZ_TALK_3:
                                DoAction(ACTION_KAIROZ_TALK_3);
                                break;
                            case EVENT_PRINCE_TALK_4:
                                if (!princeAnduinList.empty())
                                    for (auto princeAnduin: princeAnduinList)
                                        princeAnduin->AI()->DoAction(ACTION_PRINCE_TALK_4);
                                break;
                            case EVENT_KAIROZ_TALK_4:
                                DoAction(ACTION_KAIROZ_TALK_4);
                                break;
                            case EVENT_KAIROZ_TALK_5:
                                DoAction(ACTION_KAIROZ_TALK_5);
                                break;
                            case EVENT_PRINCE_TALK_5:
                                if (!princeAnduinList.empty())
                                    for (auto princeAnduin: princeAnduinList)
                                    {
                                        princeAnduin->AI()->DoAction(ACTION_PRINCE_TALK_5);
                                        conversationEngaged = false;
                                    }
                                break;
                            default:
                                break;
                        }
                    }
                }
            }
        };
};

/// Unlock Armor Cache (Plate) - 147597
/// Unlock Armor Cache (Mail) - 148099
/// Unlock Armor Cache (Leather) - 148103
/// Unlock Armor Cache (Cloth) - 148104
/// Create Curio - 148746
/// Create Cloak - 146246
/// Create Leggings - 146241
/// Create Leggings - 146265
/// Create Leggings - 146273
/// Create Leggings - 146281
/// Create Robes - 146278
/// Create Helm - 146240
/// Create Helm - 146264
/// Create Helm - 146272
/// Create Helm - 146280
/// Create Ring - 146244
/// Create Shoulders - 146242
/// Create Shoulders - 146266
/// Create Shoulders - 146274
/// Create Shoulders - 146282
/// Create Chestpiece - 146238
/// Create Chestpiece - 146261
/// Create Chestpiece - 146270
/// Create Belt - 146236
/// Create Belt - 146259
/// Create Belt - 146268
/// Create Belt - 146276
/// Create Lavalliere - 148740
/// Create Boots - 146237
/// Create Boots - 146260
/// Create Boots - 146269
/// Create Boots - 146277
/// Create Gloves - 146239
/// Create Gloves - 146263
/// Create Gloves - 146271
/// Create Gloves - 146279
/// Create Bracers - 146243
/// Create Bracers - 146267
/// Create Bracers - 146275
/// Create Bracers - 146283
class spell_item_timeless_caches : public SpellScriptLoader
{
    public:
        spell_item_timeless_caches() : SpellScriptLoader("spell_item_timeless_caches") { }

        class spell_item_timeless_caches_SpellScript : public SpellScript
        {
            PrepareSpellScript(spell_item_timeless_caches_SpellScript);

            uint32 m_ItemID;

            bool Load() override
            {
                m_ItemID = 0;
                return true;
            }

            SpellCastResult CheckCast()
            {
                Player* l_Player = GetCaster()->ToPlayer();
                if (l_Player == nullptr)
                    return SpellCastResult::SPELL_FAILED_DONT_REPORT;

                LootTemplate const* l_LootTemplate = LootTemplates_Spell.GetLootFor(GetSpellInfo()->Id);
                if (!l_LootTemplate)
                    return SpellCastResult::SPELL_FAILED_DONT_REPORT;

                std::list<ItemTemplate const*> l_LootTable;
                std::vector<uint32> l_Items;
                l_LootTemplate->FillAutoAssignationLoot(l_LootTable);
                uint32 l_SpecID = l_Player->GetLootSpecId() ? l_Player->GetLootSpecId() : l_Player->GetSpecializationId(l_Player->GetActiveSpec());

                for (ItemTemplate const* l_Template : l_LootTable)
                {
                    if ((l_Template->AllowableClass && !(l_Template->AllowableClass & l_Player->getClassMask())) ||
                        (l_Template->AllowableRace && !(l_Template->AllowableRace & l_Player->getRaceMask())))
                        continue;

                    if (l_Template->HasSpec((SpecIndex)l_SpecID, l_Player->getLevel()))
                        l_Items.push_back(l_Template->ItemId);
                }

                if (l_Items.empty())
                    return SpellCastResult::SPELL_FAILED_DONT_REPORT;

                m_ItemID = l_Items[urand(0, l_Items.size() - 1)];

                if (!m_ItemID)
                    return SpellCastResult::SPELL_FAILED_DONT_REPORT;

                if (!l_Player->GetBagsFreeSlots())
                    return SpellCastResult::SPELL_FAILED_DONT_REPORT;

                return SpellCastResult::SPELL_CAST_OK;
            }

            void HandleCreateItem(SpellEffIndex p_EffIndex)
            {
                PreventHitEffect(p_EffIndex);

                if (Player* l_Player = GetCaster()->ToPlayer())
                {
                    if (m_ItemID)
                    {
                        /// Adding items
                        uint32 l_NoSpaceForCount = 0;
                        uint32 l_Count = 1;

                        /// Check space and find places
                        ItemPosCountVec l_Dest;
                        InventoryResult l_Result = l_Player->CanStoreNewItem(InventorySlot::NULL_BAG, InventorySlot::NULL_SLOT, l_Dest, m_ItemID, l_Count, &l_NoSpaceForCount);

                        /// Convert to possible store amount
                        if (l_Result != InventoryResult::EQUIP_ERR_OK)
                            l_Count -= l_NoSpaceForCount;

                        /// Can't add any
                        if (l_Count == 0 || l_Dest.empty())
                            return;

                        Item* l_Item = l_Player->StoreNewItem(l_Dest, m_ItemID, true, Item::GenerateItemRandomPropertyId(m_ItemID));
                        if (l_Count > 0 && l_Item)
                            l_Player->SendNewItem(l_Item, l_Count, true, false);
                    }
                }
            }

            void Register() override
            {
                OnCheckCast += SpellCheckCastFn(spell_item_timeless_caches_SpellScript::CheckCast);
                OnEffectHitTarget += SpellEffectFn(spell_item_timeless_caches_SpellScript::HandleCreateItem, EFFECT_0, SPELL_EFFECT_CREATE_ITEM_2);
            }
        };

        SpellScript* GetSpellScript() const override
        {
            return new spell_item_timeless_caches_SpellScript();
        }
};


class timeless_isle_zone : public ZoneScript
{
public:

	timeless_isle_zone() : ZoneScript("timeless_isle_zone")
	{
	}

	ZoneScript* GetZoneScript(Map* map) const
	{
		return new timeless_isle_zone_Script(map);
	}

	class timeless_isle_zone_Script : public ZoneScript
	{
	public:

		timeless_isle_zone_Script(Map* map) : ZoneScript()
		{
			m_Map = map;

			Initialize();
		}

		void OnCreatureCreate(Creature* pCreature) override
		{
			switch (pCreature->GetEntry())
			{
			case NPC_SHAO_HAO: m_ShaoHaoGuid = pCreature->GetGUID(); break;
			case NPC_YULON: m_JadeSerpentGuid = pCreature->GetGUID(); break;
			case NPC_XUEN: m_WhiteTigerGuid = pCreature->GetGUID(); break;
			case NPC_CHI_JI: m_RedCraneGuid = pCreature->GetGUID(); break;
			case NPC_NIUZAO: m_BlackOxGuid = pCreature->GetGUID(); break;
			}
		}

		void OnCreatureRemove(Creature* pCreature) override
		{
			switch (pCreature->GetEntry())
			{
			case NPC_SHAO_HAO: m_ShaoHaoGuid = 0; break;
			case NPC_YULON: m_JadeSerpentGuid = 0; break;
			case NPC_XUEN: m_WhiteTigerGuid = 0; break;
			case NPC_CHI_JI: m_RedCraneGuid = 0; break;
			case NPC_NIUZAO: m_BlackOxGuid = 0; break;
			}
		}

		void OnGameObjectCreate(GameObject* go) override
		{
			switch (go->GetEntry())
			{
			case GAMEOBJECT_HEATED_DOOR:
				m_HeatedDoorGuid = go->GetGUID();
				break;
			}
		}

		uint64 GetData64(uint32 type) override
		{
			switch (type)
			{
			case DATA_EMPERROR_SHAOHAO: return m_ShaoHaoGuid;
			case DATA_JADE_SERPENT: return m_JadeSerpentGuid;
			case DATA_WHITE_TIGER: return m_WhiteTigerGuid;
			case DATA_HEATED_DOOR: return m_HeatedDoorGuid;
			case DATA_RED_CRANE: return m_RedCraneGuid;
			case DATA_BLACK_OX: return m_BlackOxGuid;
			}

			return 0;
		}

	private:

		void Initialize()
		{
			/*m_Map->LoadGrid(-553.f, -4949.f);
			m_Map->LoadGrid(-551.f, -5080.f);
			m_Map->LoadGrid(-742.f, -5078.f);
			m_Map->LoadGrid(-740.f, -4955.f);
			m_Map->LoadGrid(-649.f, -5108.f);
			m_Map->LoadGrid(-650.f, -5016.f);*/

			m_ShaoHaoGuid = 0;
			m_JadeSerpentGuid = 0;
			m_WhiteTigerGuid = 0;
			m_RedCraneGuid = 0;
			m_BlackOxGuid = 0;
			m_HeatedDoorGuid = 0;
		}

	private:

		Map* m_Map;
		uint64 m_ShaoHaoGuid;
		uint64 m_JadeSerpentGuid;
		uint64 m_WhiteTigerGuid;
		uint64 m_RedCraneGuid;
		uint64 m_BlackOxGuid;
		uint64 m_HeatedDoorGuid;
	};
};


class at_timeless_isle_ordos : public AreaTriggerScript
{
public:
	at_timeless_isle_ordos() : AreaTriggerScript("at_timeless_isle_ordos") { }

	enum eData
	{
		SPELL_CELESTIAL_WINDS	= 149322
	};

	bool OnTrigger(Player* pPlayer, AreaTriggerEntry const* p_Trigger) override
	{
		pPlayer->CastSpell(pPlayer, SPELL_CELESTIAL_WINDS, true);
		return true;
	}

};

#ifndef __clang_analyzer__
void AddSC_timeless_isle()
{
	// Npcs
    new npc_prince_anduin();
    new npc_kairoz();
	
	// Spells
    new spell_item_timeless_caches();

	// Areatriggers and Zone Scripts
	new timeless_isle_zone();
	new at_timeless_isle_ordos();               // 9509
}
#endif
