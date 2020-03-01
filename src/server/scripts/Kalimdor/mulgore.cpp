////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

/* ScriptData
SDName: Mulgore
SD%Complete: 100
SDComment: Support for quest: 11129, 861
SDCategory: Mulgore
EndScriptData */

/* ContentData
npc_skorn_whitecloud
npc_kyle_frenzied
EndContentData */

#include "Creature.h"
#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "WaypointMovementGenerator.h"

/*######
# npc_skorn_whitecloud
######*/

#define GOSSIP_SW "Tell me a story, Skorn."

class npc_skorn_whitecloud : public CreatureScript
{
public:
    npc_skorn_whitecloud() : CreatureScript("npc_skorn_whitecloud") { }

    bool OnGossipSelect(Player* player, Creature* creature, uint32 /*sender*/, uint32 action)
    {
        player->PlayerTalkClass->ClearMenus();
        if (action == GOSSIP_ACTION_INFO_DEF)
            player->SEND_GOSSIP_MENU(523, creature->GetGUID());

        return true;
    }

    bool OnGossipHello(Player* player, Creature* creature)
    {
        if (creature->isQuestGiver())
            player->PrepareQuestMenu(creature->GetGUID());

        if (!player->GetQuestRewardStatus(770))
            player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, GOSSIP_SW, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF);

        player->SEND_GOSSIP_MENU(522, creature->GetGUID());

        return true;
    }

};

/*#####
# npc_kyle_frenzied
######*/

enum eKyleTheFrenzied
{
	SPELL_LUNCH_FOR_KYLE = 42222,
	EMOTE_SEE_LUNCH = -1000340,
	EMOTE_EAT_LUNCH = -1000341,
	NPC_KYLE_THE_FRENZIED = 23616,
	NPC_KYLE_THE_FRIENDLY = 23622,
	EMOTE_DANCE = -1000342,
};

class npc_kyle_frenzied : public CreatureScript
{
public:
    npc_kyle_frenzied() : CreatureScript("npc_kyle_frenzied") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_kyle_frenziedAI (creature);
    }

    struct npc_kyle_frenziedAI : public ScriptedAI
    {
        npc_kyle_frenziedAI(Creature* creature) : ScriptedAI(creature) {}

        bool EventActive;
        bool IsMovingToLunch;
        uint64 PlayerGUID;
        uint32 EventTimer;
        uint8 EventPhase;

        void Reset()
        {
            EventActive = false;
            IsMovingToLunch = false;
            PlayerGUID = 0;
            EventTimer = 15000;
            EventPhase = 0;

            if (me->GetEntry() == NPC_KYLE_THE_FRIENDLY)
                me->UpdateEntry(NPC_KYLE_THE_FRENZIED);
        }

        void SpellHit(Unit* Caster, SpellInfo const* Spell)
        {
			if (Spell->Id == SPELL_LUNCH_FOR_KYLE)
			{
				Position pos;
				Caster->GetPosition(&pos);
				Caster->GetNearPoint(Caster, pos.m_positionX, pos.m_positionY, pos.m_positionZ, 0.0f, 0.5f, Caster->GetAngle(me));
				me->GetMotionMaster()->MovePoint(1, pos);
				PlayerGUID = Caster->GetGUID();
			}
        }

        void MovementInform(uint32 Type, uint32 PointId)
        {
			if (Type != POINT_MOTION_TYPE || !EventActive)
				return;

			if (PointId == 1)
				IsMovingToLunch = false;
        }

        void UpdateAI(const uint32 diff)
        {
            if (EventActive)
            {
                if (IsMovingToLunch)
                    return;

                if (EventTimer <= diff)
                {
                    EventTimer = 5000;
                    ++EventPhase;

                    switch (EventPhase)
                    {
                        case 1:
                            if (Unit* unit = Unit::GetUnit(*me, PlayerGUID))
                            {
                                if (GameObject* go = unit->GetGameObject(SPELL_LUNCH_FOR_KYLE))
                                {
                                    IsMovingToLunch = true;
                                    me->GetMotionMaster()->MovePoint(1, go->GetPositionX(), go->GetPositionY(), go->GetPositionZ());
                                }
                            }
                            break;
                        case 2:
                            DoScriptText(EMOTE_EAT_LUNCH, me);
                            me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, EMOTE_STATE_USE_STANDING);
                            break;
                        case 3:
                            if (Player* unit = Unit::GetPlayer(*me, PlayerGUID))
                                unit->TalkedToCreature(me->GetEntry(), me->GetGUID());

                            me->UpdateEntry(NPC_KYLE_THE_FRIENDLY);
                            break;
                        case 4:
                            EventTimer = 30000;
                            DoScriptText(EMOTE_DANCE, me);
                            me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, EMOTE_STATE_DANCESPECIAL);
                            break;
                        case 5:
                            me->SetUInt32Value(UNIT_FIELD_EMOTE_STATE, EMOTE_STATE_NONE);
                            Reset();
                            me->GetMotionMaster()->Clear();
                            break;
                    }
                }
                else
                    EventTimer -= diff;
            }
        }
    };

};

#ifndef __clang_analyzer__
void AddSC_mulgore()
{
    new npc_skorn_whitecloud();
    new npc_kyle_frenzied();
}
#endif
