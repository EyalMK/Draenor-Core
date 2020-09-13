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

/// Quest: Rite of the Winds.
enum EagleSpirit
{
	SPELL_EJECT_ALL_PASSENGERS = 50630
};

G3D::Vector3 const Flightpath[14] =
{
	{ -2896.99f, -69.4555f, 220.748f },
	{ -2780.07f, -99.4885f, 194.584f },
	{ -2677.34f, -127.748f, 171.943f },
	{ -2648.53f, -201.255f, 152.172f },
	{ -2647.07f, -287.295f, 133.98f },
	{ -2601.28f, -380.433f, 111.562f },
	{ -2521.47f, -423.088f, 88.2252f },
	{ -2474.46f, -424.12f, 52.5356f },
	{ -2430.98f, -425.075f, 26.3883f },
	{ -2392.82f, -423.415f, 15.9748f },
	{ -2366.33f, -418.975f, 5.84979f },
	{ -2356.31f, -415.553f, 3.60444f },
	{ -2347.76f, -408.92f, -4.61385f },
	{ -2343.36f, -401.535f, -6.42369f },
};

/// Eagle Spirit - 36790
class npc_eagle_spirit : public CreatureScript
{
public:
	npc_eagle_spirit() : CreatureScript("npc_eagle_spirit") { }

	struct npc_eagle_spirit_AI : public ScriptedAI
	{
		npc_eagle_spirit_AI(Creature* creature) : ScriptedAI(creature)
		{
			me->SetCanFly(true);
		}

		void IsSummonedBy(Unit* summoner) override
		{
			if (Player* player = summoner->ToPlayer())
				player->EnterVehicle(me);
		}


		void PassengerBoarded(Unit* /*who*/, int8 /*seatId*/, bool apply) override
		{
			if (!apply)
				return;

			me->GetMotionMaster()->MoveSmoothPath(1, Flightpath, 14, false);
		}

		void MovementInform(uint32 type, uint32 pointId) override
		{
			if (type == EFFECT_MOTION_TYPE && pointId == 1)
			{
				DoCast(SPELL_EJECT_ALL_PASSENGERS);
				me->DespawnOrUnsummon();
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const override
	{
		return new npc_eagle_spirit_AI(creature);
	}
};


#ifndef __clang_analyzer__
void AddSC_mulgore()
{
    new npc_skorn_whitecloud();
	new npc_eagle_spirit();
}
#endif
