////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellScript.h"

/*######
## Quest 25134: Lazy Peons
## npc_lazy_peon
######*/

enum LazyPeonYells
{
    SAY_SPELL_HIT = -1000600 // Ow! OK, I''ll get back to work, $N!'
};

enum LazyPeon
{
    QUEST_LAZY_PEONS    = 25134,
    GO_LUMBERPILE       = 175784,
    SPELL_BUFF_SLEEP    = 17743,
    SPELL_AWAKEN_PEON   = 19938
};

class npc_lazy_peon : public CreatureScript
{
public:
    npc_lazy_peon() : CreatureScript("npc_lazy_peon") { }

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_lazy_peonAI(creature);
    }

    struct npc_lazy_peonAI : public ScriptedAI
    {
        npc_lazy_peonAI(Creature* creature) : ScriptedAI(creature) {}

        uint64 PlayerGUID;

        uint32 RebuffTimer;
        bool work;

        void Reset()
        {
            PlayerGUID = 0;
            RebuffTimer = 0;
            work = false;
        }

        void MovementInform(uint32 /*type*/, uint32 id)
        {
            if (id == 1)
                work = true;
        }

        void SpellHit(Unit* caster, const SpellInfo* spell)
        {
            if (spell->Id == SPELL_AWAKEN_PEON && caster->IsPlayer()
                && CAST_PLR(caster)->GetQuestStatus(QUEST_LAZY_PEONS) == QUEST_STATUS_INCOMPLETE)
            {
                caster->ToPlayer()->KilledMonsterCredit(me->GetEntry(), me->GetGUID());
                DoScriptText(SAY_SPELL_HIT, me, caster);
                me->RemoveAllAuras();
                if (GameObject* Lumberpile = me->FindNearestGameObject(GO_LUMBERPILE, 20))
                    me->GetMotionMaster()->MovePoint(1, Lumberpile->GetPositionX()-1, Lumberpile->GetPositionY(), Lumberpile->GetPositionZ());
            }
        }

        void UpdateAI(const uint32 Diff)
        {
            if (work == true)
                me->HandleEmoteCommand(EMOTE_ONESHOT_WORK_CHOPWOOD);
            if (RebuffTimer <= Diff)
            {
                DoCast(me, SPELL_BUFF_SLEEP);
                RebuffTimer = 300000; //Rebuff agian in 5 minutes
            }
            else
                RebuffTimer -= Diff;
            if (!UpdateVictim())
                return;
            DoMeleeAttackIfReady();
        }
    };
};

enum VoodooSpells
{
    SPELL_BREW      = 16712, // Special Brew
    SPELL_GHOSTLY   = 16713, // Ghostly
    SPELL_HEX1      = 16707, // Hex
    SPELL_HEX2      = 16708, // Hex
    SPELL_HEX3      = 16709, // Hex
    SPELL_GROW      = 16711, // Grow
    SPELL_LAUNCH    = 16716, // Launch (Whee!)
};

/// Darkspear Jailor - 39062
enum ejailor
{
	// Texts
	SAY_JAILOR_1 = 0,
	SAY_SPITESCALE_1 = 1,
	GOSSIP_MENU_JAILOR = 10974,
	GOSSIP_OPTION_JAILOR = 0,
	NPC_TEXT_JAILOR = 15251,

	// Npcs
	NPC_DARKSPEAR_JAILOR = 39062,
	NPC_SPITESCALE_SCOUT = 38142,
	GOBJECT_CAGE = 201968,


	// Quests
	QUEST_PROVING_PIT_WARLOCK = 26276,
	QUEST_PROVING_PIT_DRUID = 24768,
	QUEST_PROVING_PIT_WARRIOR = 24642,
	QUEST_PROVING_PIT_PRIEST = 24786,
	QUEST_PROVING_PIT_HUNTER = 24780,
	QUEST_PROVING_PIT_ROGUE = 24774,
	QUEST_PROVING_PIT_SHAMAN = 24762,
	QUEST_PROVING_PIT_MAGE = 24754,
	QUEST_PROVING_PIT_MONK = 31161,
};

float fNodeJailorPosition[2][3][3] =
{
	{
		{-1132.875366f, -5425.658203f, 13.308554f},
		{-1134.783813f, -5416.551270f, 13.269002f},
		{-1132.472046f, -5424.702637f, 13.225397f},
	},
	{
		{-1159.829956f, -5519.570313f, 12.126601f},
		{-1153.379028f, -5518.994629f, 11.996062f},
		{-1159.829956f, -5519.570313f, 12.126601f},
	},
};

float fNodeNagaPosition[2][3] =
{
	{-1146.220581f, -5417.623047f, 10.597669f},
	{-1150.114380f, -5527.809082f,  8.105021f},
};

class npc_jailor : public CreatureScript
{
public:
	npc_jailor() : CreatureScript("npc_jailor") { }

	bool OnGossipHello(Player* Player, Creature* Creature)
	{
		if (CAST_AI(npc_jailor::npc_jailorAI, Creature->AI())->uiStart == false)
		{
			Player->PrepareGossipMenu(Creature);
			/// Proving Pit quests
			if (Player->GetQuestStatus(QUEST_PROVING_PIT_PRIEST) == QUEST_STATUS_INCOMPLETE || Player->GetQuestStatus(QUEST_PROVING_PIT_MAGE) == QUEST_STATUS_INCOMPLETE ||
				Player->GetQuestStatus(QUEST_PROVING_PIT_SHAMAN) == QUEST_STATUS_INCOMPLETE || Player->GetQuestStatus(QUEST_PROVING_PIT_ROGUE) == QUEST_STATUS_INCOMPLETE ||
				Player->GetQuestStatus(QUEST_PROVING_PIT_WARLOCK) == QUEST_STATUS_INCOMPLETE || Player->GetQuestStatus(QUEST_PROVING_PIT_WARRIOR) == QUEST_STATUS_INCOMPLETE ||
				Player->GetQuestStatus(QUEST_PROVING_PIT_DRUID) == QUEST_STATUS_INCOMPLETE || Player->GetQuestStatus(QUEST_PROVING_PIT_HUNTER) == QUEST_STATUS_INCOMPLETE ||
				Player->GetQuestStatus(QUEST_PROVING_PIT_MONK) == QUEST_STATUS_INCOMPLETE)
			{
				Player->ADD_GOSSIP_ITEM_DB(GOSSIP_MENU_JAILOR, GOSSIP_OPTION_JAILOR, GOSSIP_SENDER_MAIN, GOSSIP_ACTION_INFO_DEF + 1);
			}
		}

		Player->SEND_GOSSIP_MENU(NPC_TEXT_JAILOR, Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* pPlayer, Creature* pCreature, uint32 uiSender, uint32 uiAction)
	{
		pPlayer->PlayerTalkClass->ClearMenus();
		if (uiAction == GOSSIP_ACTION_INFO_DEF + 1)
		{
			uint8 Phase = 1;
			if (pCreature->GetDistance(-1143.18f, -5429.95f, 13.97f) < 20)
				Phase = 0;

			CAST_AI(npc_jailor::npc_jailorAI, pCreature->AI())->Phase = Phase;
			pCreature->AI()->Talk(SAY_JAILOR_1); // Get in the pit

			pPlayer->KilledMonsterCredit(pCreature->GetEntry(), 0);
			pPlayer->CLOSE_GOSSIP_MENU();
		}
		return true;
	}

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_jailorAI(pCreature);
	}

	struct npc_jailorAI : public ScriptedAI
	{
		npc_jailorAI(Creature* pCreature) : ScriptedAI(pCreature) {}

		uint8 Phase;
		uint8 uiNode;
		uint32 uiTimer;
		bool uiStart;

		void Reset()
		{
			GameObject* pCage = me->FindNearestGameObject(GOBJECT_CAGE, 20.0f);
			pCage->Respawn();
			pCage->SetGoState(GO_STATE_READY);
			Phase = 5;
			uiNode = 0;
			uiTimer = 2000;
			uiStart = false;
		}

		void UpdateAI(const uint32 uiDiff)
		{
			if (me->isInCombat())
				return;

			if (Phase != 5)
			{
				uiStart = true;
				if (uiTimer <= uiDiff)
				{
					GoToTheNextNode();
					uiTimer = 2500;
					switch (uiNode)
					{
					case 1:
						uiTimer = 5000;
						uiNode++;
						break;
					case 3:
						uiTimer = 120000;
						uiNode++;
						break;
					case 4:
						if (Creature* pNaga = me->FindNearestCreature(NPC_SPITESCALE_SCOUT, 30.0f))
						{
							pNaga->SetReactState(REACT_PASSIVE);
							pNaga->setFaction(634);
							pNaga->GetMotionMaster()->MoveTargetedHome();
						}
						uiTimer = 4000;
						uiNode++;
						break;
					case 5:
						if (GameObject*pCage = me->FindNearestGameObject(GOBJECT_CAGE, 30.0f))
						{
							pCage->Respawn();
							pCage->SetGoState(GO_STATE_READY);
						}
						uiNode = 0;
						Phase = 5;
						uiStart = false;
						uiTimer = 2000;
					default:
						uiNode++;
						break;
					}
				}
				else
					uiTimer -= uiDiff;
			}
		}

		void GoToTheNextNode()
		{
			if (uiNode >= 3)
				me->GetMotionMaster()->MoveTargetedHome();
			else
				me->GetMotionMaster()->MoveCharge(fNodeJailorPosition[Phase][uiNode][0], fNodeJailorPosition[Phase][uiNode][1], fNodeJailorPosition[Phase][uiNode][2], 5);
		}

		void MovementInform(uint32 uiType, uint32 uiPointId)
		{
			if (uiType != POINT_MOTION_TYPE)
				return;

			if (uiNode == 2)
			{
				if (GameObject*pCage = me->FindNearestGameObject(GOBJECT_CAGE, 15.0f))
				{
					pCage->SetGoType(GAMEOBJECT_TYPE_BUTTON);
					pCage->UseDoorOrButton();
				}
				if (Creature* pNaga = me->FindNearestCreature(NPC_SPITESCALE_SCOUT, 15.0f))
				{
					pNaga->SetReactState(REACT_AGGRESSIVE);
					pNaga->setFaction(14);
					pNaga->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_IMMUNE_TO_PC | UNIT_FLAG_NOT_ATTACKABLE_1 | UNIT_FLAG_NON_ATTACKABLE);
					pNaga->AI()->Talk(SAY_SPITESCALE_1); // They sssend you to your death
					pNaga->GetMotionMaster()->MoveCharge(fNodeNagaPosition[Phase][0], fNodeNagaPosition[Phase][1], fNodeNagaPosition[Phase][2], 5);
				}
			}
		}
	};
};


/// Swiftclaw - 37989
enum eSwiftclaw
{
	SPELL_RIDE_VEHICLE_1 = 52391,
	SPELL_RIDE_VEHICLE_2 = 70925,

	NPC_RUNNING_SWIFTCLAW	 = 37989,
	NPC_NEARBY_RAPTOR		 = 38987,
	NPC_CONTROLLED_SWIFTCLAW = 38002,
};

class npc_swiftclaw : public CreatureScript
{
public:
	npc_swiftclaw() : CreatureScript("npc_swiftclaw") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_swiftclawAI(pCreature);
	}

	struct npc_swiftclawAI : public ScriptedAI
	{
		npc_swiftclawAI(Creature* pCreature) : ScriptedAI(pCreature) {}

		void Reset()
		{
			if (Unit* owner = me->ToCreature()->GetCharmerOrOwner())
				if (owner->GetTypeId() == TYPEID_PLAYER)
				{
					owner->CastSpell(me, SPELL_RIDE_VEHICLE_1, true);
					me->ToTempSummon()->GetSummoner()->GetGUID();
					me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
					me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
				}
				else
					me->DespawnOrUnsummon();
		}

		void OnCharmed(bool /*apply*/) { }

		void PassengerBoarded(Unit * who, int8 /*seatId*/, bool apply)
		{
			if (Player * pWho = who->ToPlayer())
			{
				me->SetFlag(UNIT_FIELD_FLAGS_2, UNIT_FLAG2_FORCE_MOVEMENT);
				pWho->KilledMonsterCredit(NPC_RUNNING_SWIFTCLAW, 0);
			}
		}

		void MoveInLineOfSight(Unit* who)
		{
			if (me->FindNearestCreature(NPC_NEARBY_RAPTOR, 5.0f, true))
			{
				if (Player * pWho = who->ToPlayer())
				{
					pWho->KilledMonsterCredit(NPC_CONTROLLED_SWIFTCLAW, 0);
				}
				me->DespawnOrUnsummon();
			}
		}
	};
};

/// Swiftclaw2 - 38002
class npc_swiftclaw2 : public CreatureScript
{
public:
	npc_swiftclaw2() : CreatureScript("npc_swiftclaw2") { }

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new  npc_swiftclaw2AI(pCreature);
	}

	enum eData
	{
		// Data
		NPC_SWIFTCLAW_2 = 38002,
		SPELL_RAPTOR_ROPE = 70927,
		SAY_SWIFTCLAW_1	  = 0,
	};
	struct npc_swiftclaw2AI : public ScriptedAI
	{
		npc_swiftclaw2AI(Creature* pCreature) : ScriptedAI(pCreature) { }

		void SpellHit(Unit* hitter, const SpellInfo* spell)
		{
			if (!hitter || !spell)
				return;

			if (spell->Id != SPELL_RAPTOR_ROPE)
				return;
			hitter->SummonCreature(NPC_SWIFTCLAW_2, hitter->GetPositionX(), hitter->GetPositionY(), hitter->GetPositionZ(), 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 100000);
			Talk(SAY_SWIFTCLAW_1); /// Swiftclaw isn't stopping. Steer him...
			me->DespawnOrUnsummon();

		}

	};
};

/// Voodoo - 17009
class spell_voodoo : public SpellScriptLoader
{
public:
	spell_voodoo() : SpellScriptLoader("spell_voodoo") {}

	class spell_voodoo_SpellScript : public SpellScript
	{
		PrepareSpellScript(spell_voodoo_SpellScript)

			bool Validate(SpellInfo const* /*spell*/)
		{
			if (!sSpellMgr->GetSpellInfo(SPELL_BREW) || !sSpellMgr->GetSpellInfo(SPELL_GHOSTLY) ||
				!sSpellMgr->GetSpellInfo(SPELL_HEX1) || !sSpellMgr->GetSpellInfo(SPELL_HEX2) ||
				!sSpellMgr->GetSpellInfo(SPELL_HEX3) || !sSpellMgr->GetSpellInfo(SPELL_GROW) ||
				!sSpellMgr->GetSpellInfo(SPELL_LAUNCH))
				return false;
			return true;
		}

		void HandleDummy(SpellEffIndex /*effIndex*/)
		{
			uint32 spellid = RAND(SPELL_BREW, SPELL_GHOSTLY, RAND(SPELL_HEX1, SPELL_HEX2, SPELL_HEX3), SPELL_GROW, SPELL_LAUNCH);
			if (Unit* target = GetHitUnit())
				GetCaster()->CastSpell(target, spellid, false);
		}

		void Register()
		{
			OnEffectHitTarget += SpellEffectFn(spell_voodoo_SpellScript::HandleDummy, EFFECT_0, SPELL_EFFECT_DUMMY);
		}
	};

	SpellScript* GetSpellScript() const
	{
		return new spell_voodoo_SpellScript();
	}
};



#ifndef __clang_analyzer__
void AddSC_durotar()
{
    new npc_lazy_peon();
	new npc_jailor();
	new npc_swiftclaw();
	new npc_swiftclaw2();
	new spell_voodoo();
}
#endif
