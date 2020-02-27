////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "ScriptedGossip.h"
#include "ScriptedEscortAI.h"
#include "ObjectMgr.h"
#include "ScriptMgr.h"
#include "World.h"
#include "PetAI.h"
#include "PassiveAI.h"
#include "CombatAI.h"
#include "GameEventMgr.h"
#include "GridNotifiers.h"
#include "GridNotifiersImpl.h"
#include "Cell.h"
#include "CellImpl.h"
#include "SpellAuras.h"
#include "Vehicle.h"
#include "Player.h"
#include "SpellScript.h"

enum Northshire
{
	NPC_BLACKROCK_BATTLE_WORG = 49871,
	NPC_STORMWIND_INFANTRY = 49869,

	NPC_BROTHER_PAXTON = 951,

	NPC_INJURED_SOLDIER_DUMMY = 50378,

	SPELL_SPYING = 92857,
	SPELL_SNEAKING = 93046,
	SPELL_SPYGLASS = 80676,

	SPELL_RENEW = 93094,
	SPELL_PRAYER_OF_HEALING = 93091,
	SPELL_FORTITUDE = 13864,
	SPELL_PENANCE = 186723,
	SPELL_FLASH_HEAL = 17843,

	SPELL_RENEWEDLIFE = 93097,

	ACTION_HEAL = 1,
	EVENT_HEALED_1 = 1,
	EVENT_HEALED_2 = 2,
};

/*######
## npc_stormwind_infantry
######*/

class npc_stormwind_infantry : public CreatureScript 
{
public:
	npc_stormwind_infantry() : CreatureScript("npc_stormwind_infantry") { }

	CreatureAI* GetAI(Creature* pCreature) const 
	{
		return new npc_stormwind_infantryAI(pCreature);
	}

	struct npc_stormwind_infantryAI : public ScriptedAI 
	{
		npc_stormwind_infantryAI(Creature *c) : ScriptedAI(c) {	}

		uint32 uiSayNormalTimer;
		uint32 uiSayCombatTimer;
		uint32 uiCombatTimer;
		uint32 Attack1HTimer;

		bool Continue;

		void Reset() 
		{
			uiSayNormalTimer = urand(40000, 80000);
			uiSayCombatTimer = urand(30000, 90000);
			uiCombatTimer = 500;
		}

		void EnterCombat(Unit * who) 
		{
			if (!me->HasUnitState(UNIT_STATE_ROOT))
				me->AddUnitState(UNIT_STATE_ROOT);
		}

		void SetData(uint32 type, uint32 data) 
		{
			if (Creature* Paxton = me->FindNearestCreature(NPC_BROTHER_PAXTON, 15.0f, true)) 
			{
				Continue = false;

				switch (data) 
				{
					case 1:
						if (me->GetDistance2d(-8807.426758f, -163.300751f) <= 4.0f)
							Continue = true;
						break;
					case 2:
						if (me->GetDistance2d(-8811.654297f, -151.384628f) <= 4.0f)
							Continue = true;
						break;
					case 3:
						if (me->GetDistance2d(-8820.900391f, -142.061005f) <= 4.0f)
							Continue = true;
						break;
					case 4:
						if (me->GetDistance2d(-8836.710938f, -143.393066f) <= 4.0f)
							Continue = true;
						break;
				}

				if (Continue == true) 
				{
					Talk(0);
					Paxton->SetFacingToObject(me);
					Paxton->UpdateMovementFlags();

					switch (type) 
					{
						case 1:
								Paxton->AI()->Talk(0);
								Paxton->AI()->DoCast(me, SPELL_PRAYER_OF_HEALING);
							break;
						case 2:
								Paxton->AI()->Talk(0);
								Paxton->AI()->DoCast(me, SPELL_PENANCE);
							break;
						case 3:
								Paxton->AI()->Talk(1);
								Paxton->AI()->DoCast(me, SPELL_RENEW);
							break;
						case 4:
								Paxton->AI()->Talk(0);
								Paxton->AI()->DoCast(me, SPELL_FLASH_HEAL);
							break;
					}
					Continue = false;
				}
				else
					me->AI()->SetData(type, data);
			}
		}

		void DamageTaken(Unit* attacker, uint32& damage)
		{
			if (me->GetHealthPct() <= 75 && attacker->GetEntry() == NPC_BLACKROCK_BATTLE_WORG)
				damage = 0;
		}

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType damageType)
		{
			if (target->ToCreature())
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 70.0f)
					damage = 0;
		}

		void UpdateAI(const uint32 diff) 
		{
			if (me->isAlive())
				if (!me->isInCombat()) 
				{
					if (me->GetDistance2d(me->GetHomePosition().GetPositionX(), me->GetHomePosition().GetPositionY()) <= 1.0f)
						if (Creature* Worg = me->FindNearestCreature(NPC_BLACKROCK_BATTLE_WORG, 5.0f, true))
							me->AI()->AttackStart(Worg);

					if (uiSayNormalTimer <= diff) 
					{
						Talk(1);
						uiSayNormalTimer = urand(40000, 80000);
					}
					else
						uiSayNormalTimer -= diff;

					if (me->GetHomePosition().GetPositionX() != me->GetPositionX() && me->GetHomePosition().GetPositionY() != me->GetPositionX()) 
					{
						if (me->IsMoving())
							me->SetSpeed(MOVE_RUN, 2.0f);
					}
					else
						me->SetSpeed(MOVE_WALK, 1.0f);
				}

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();

			if (HealthBelowPct(100)) 
			{
				if (uiSayCombatTimer <= diff) 
				{
					if (Creature* Paxton = me->FindNearestCreature(NPC_STORMWIND_INFANTRY, 20.0f, true)) 
					{
						uint32 Random = urand(1, 4);
						uint32 Mob = 0;

						if (me->GetDistance2d(-8807.426758f, -163.300751f)
							<= 2.0f)
							Mob = 1;
						if (me->GetDistance2d(-8811.654297f, -151.384628f)
							<= 2.0f)
							Mob = 2;
						if (me->GetDistance2d(-8820.900391f, -142.061005f)
							<= 2.0f)
							Mob = 3;
						if (me->GetDistance2d(-8836.710938f, -143.393066f)
							<= 2.0f)
							Mob = 4;

						if (Mob != 0)
							me->AI()->SetData(Random, Mob);
						else
							Talk(1);
					}
					uiSayCombatTimer = urand(30000, 90000);
				}
				else
					uiSayCombatTimer -= diff;
			}

			if (uiCombatTimer <= diff) 
			{
				uiCombatTimer = 500;
			}
			else
				uiCombatTimer -= diff;
		}
	};
};

/*######
 ## npc_blackrock_battle_worg
 ######*/

class npc_blackrock_battle_worg : public CreatureScript 
{
public:
	npc_blackrock_battle_worg() : CreatureScript("npc_blackrock_battle_worg") { }

	struct npc_blackrock_battle_worgAI : public ScriptedAI 
	{
		npc_blackrock_battle_worgAI(Creature *c) : ScriptedAI(c) { }

		uint32 m_minHealth;

		void Reset() 
		{
			m_minHealth = urand(60, 85);
		}

		void DamageDealt(Unit* target, uint32& damage, DamageEffectType damageType)
		{
			if (target->ToCreature())
				if (target->GetHealth() <= damage || target->GetHealthPct() <= 70.0f)
					damage = 0;
		}

		void DamageTaken(Unit* pWho, uint32& uiDamage)
		{
			if (Creature* npc = pWho->ToCreature())
				if (npc->GetEntry() == NPC_STORMWIND_INFANTRY && me->GetHealthPct() < m_minHealth)
					uiDamage = 0;

			if (pWho->GetTypeId() == TYPEID_PLAYER || pWho->isPet())
			{
				if (Creature* guard = me->FindNearestCreature(NPC_STORMWIND_INFANTRY, 6.0f, true))
				{
					guard->getThreatManager().resetAllAggro();
					guard->CombatStop(true);
				}

				me->getThreatManager().resetAllAggro();
				me->GetMotionMaster()->MoveChase(pWho);
				me->AI()->AttackStart(pWho);
			}
		}

		void UpdateAI(const uint32 diff) 
		{
			if (!UpdateVictim())
				if (Creature* guard = me->FindNearestCreature(NPC_STORMWIND_INFANTRY, 6.0f, true))
				{
					me->SetReactState(REACT_AGGRESSIVE);
					me->AI()->AttackStart(guard);
				}

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_blackrock_battle_worgAI(pCreature);
	}
};

/*######
 ## npc_brother_paxton
 ######*/

class npc_brother_paxton : public CreatureScript
{
public:
	npc_brother_paxton() : CreatureScript("npc_brother_paxton") { }

	struct npc_brother_paxtonAI : public ScriptedAI
	{
		npc_brother_paxtonAI(Creature* creature) : ScriptedAI(creature) 
		{
			me->GetMotionMaster()->MovePath(951, true);
		}

		void Reset()
		{
			if (!me->HasAura(SPELL_FORTITUDE))
				if (!me->HasUnitState(UNIT_STATE_CASTING))
					 me->CastSpell(me, SPELL_FORTITUDE, false);
		}

		void UpdateAI(uint32 diff)
		{
			if (me->HasUnitState(UNIT_STATE_CASTING) && me->IsMoving())
				me->StopMoving();

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_brother_paxtonAI(creature);
	}
};

/*######
## npc_stormwind_injured_soldier
######*/

#define SPELL_HEAL          93072

class npc_injured_stormwind_soldier : public CreatureScript
{
public:
	npc_injured_stormwind_soldier() : CreatureScript("npc_injured_stormwind_soldier") { }

	enum eActions
	{
		ActionHeal = 0
	};

	struct npc_injured_stormwind_soldierAI : public ScriptedAI
	{
		npc_injured_stormwind_soldierAI(Creature* creature) : ScriptedAI(creature) 
		{ 
			m_PlayerGuid = 0;
		}

		EventMap m_CosmeticEvents;
		EventMap m_Events;
		uint64 m_PlayerGuid;

		void Reset()
		{
			ClearDelayedOperations();
			m_Events.Reset();

			me->SetFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);
			me->SetByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_DEAD);
			me->SetHealth(5);
		}

		void OnSpellClick(Unit* clicker) override
		{
			m_PlayerGuid = clicker->GetGUID();

			me->RemoveFlag(UNIT_FIELD_NPC_FLAGS, UNIT_NPC_FLAG_SPELLCLICK);

			me->CastSpell(me, SPELL_RENEWEDLIFE, true);

			DoAction(eActions::ActionHeal);
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::ActionHeal:
				{
					AddTimedDelayedOperation(0.3 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->SetHealth(35);
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->RemoveByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_DEAD);			
					});

					AddTimedDelayedOperation(2 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (m_PlayerGuid)
						{
							if (Player* l_Player = me->GetPlayer(*me, m_PlayerGuid))
							{
								me->SetFacingToObject(l_Player);
								l_Player->KilledMonsterCredit(50047);
							}
						}
					});

					AddTimedDelayedOperation(2.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						Talk(0);
						me->HandleEmoteCommand(EMOTE_ONESHOT_SALUTE);
					});

					AddTimedDelayedOperation(4 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetMotionMaster()->MovePoint(0, -8914.525f, -133.963f, 80.534f);
					});

					AddTimedDelayedOperation(10 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->DespawnOrUnsummon();
					});

				break;
				}
			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff)
		{
			UpdateOperations(p_Diff);

			m_Events.Update(p_Diff);

			switch (m_Events.ExecuteEvent())
			{
			}
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_injured_stormwind_soldierAI(creature);
	}
};

/*######
 ## npc_blackrock_spy
 ######*/

class npc_blackrock_spy : public CreatureScript
{
public:
	npc_blackrock_spy() : CreatureScript("npc_blackrock_spy") { }

	struct npc_blackrock_spyAI : public ScriptedAI
	{
		npc_blackrock_spyAI(Creature *c) : ScriptedAI(c) 
		{ 
			CastSpying();
		}

		void Reset() override
		{
		}

		void EnterCombat(Unit* who) override
		{
			Talk(0);
			me->RemoveAllAuras();
		}

		void CastSpying() 
		{
			GetCreature(-8868.88f, -99.1016f);
			GetCreature(-8936.5f, -246.743f);
			GetCreature(-8922.44f, -73.9883f);
			GetCreature(-8909.68f, -40.0247f);
			GetCreature(-8834.85f, -119.701f);
			GetCreature(-9022.08f, -163.965f);
			GetCreature(-8776.55f, -79.158f);
			GetCreature(-8960.08f, -63.767f);
			GetCreature(-8983.12f, -202.827f);
		}

		void GetCreature(float X, float Y) 
		{
			if (me->GetHomePosition().GetPositionX() == X, me->GetHomePosition().GetPositionY() == Y)
				if (!me->isInCombat() && !me->HasAura(SPELL_SPYING))
					DoCast(me, SPELL_SPYING);

			if (me->GetHomePosition().GetPositionX() == X, me->GetHomePosition().GetPositionY() == Y)
				if (!me->isInCombat() && !me->HasAura(SPELL_SPYING))
					me->GetMotionMaster()->MoveRandom(5.0f);

			CastSpyglass();
		}

		void CastSpyglass() 
		{
			Spyglass(-8868.88f, -99.1016f, -8936.5f, -246.743f, -8922.44f,
				-73.9883f, -8909.68f, -40.0247f, -8834.85f, -119.701f,
				-9022.08f, -163.965f, -8776.55f, -79.158f, -8960.08f,
				-63.767f, -8983.12f, -202.827f);
		}

		void Spyglass(float X1, float Y1, float X2, float Y2, float X3, float Y3, float X4, float Y4, float X5, float Y5, float X6, float Y6, float X7, float Y7, float X8, float Y8, float X9, float Y9) 
		{
			if (me->GetHomePosition().GetPositionX() != X1, me->GetHomePosition().GetPositionY() != Y1)
			if (me->GetHomePosition().GetPositionX() != X2, me->GetHomePosition().GetPositionY() != Y2)
			if (me->GetHomePosition().GetPositionX() != X3, me->GetHomePosition().GetPositionY() != Y3)
			if (me->GetHomePosition().GetPositionX() != X4, me->GetHomePosition().GetPositionY() != Y4)
			if (me->GetHomePosition().GetPositionX() != X5, me->GetHomePosition().GetPositionY() != Y5)
			if (me->GetHomePosition().GetPositionX() != X6, me->GetHomePosition().GetPositionY() != Y6)
			if (me->GetHomePosition().GetPositionX() != X7, me->GetHomePosition().GetPositionY() != Y7)
			if (me->GetHomePosition().GetPositionX() != X8, me->GetHomePosition().GetPositionY() != Y8)
			if (me->GetHomePosition().GetPositionX() != X9, me->GetHomePosition().GetPositionY() != Y9)
			if (me->GetHomePosition().GetPositionX() == me->GetPositionX(), me->GetHomePosition().GetPositionY() == me->GetPositionY())
			if (!me->isInCombat() && !me->HasAura(SPELL_SPYGLASS))
			DoCast(me, SPELL_SPYGLASS);
		}

		void UpdateAI(const uint32 diff) 
		{
			CastSpyglass();

			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_blackrock_spyAI(pCreature);
	}
};

/*######
 ## npc_blackrock_invader
 ######*/

class npc_blackrock_invader : public CreatureScript 
{
public:
	npc_blackrock_invader() : CreatureScript("npc_blackrock_invader") { }

	struct npc_blackrock_invaderAI : public ScriptedAI 
	{
		npc_blackrock_invaderAI(Creature *c) : ScriptedAI(c) { }

		void EnterCombat(Unit * who) 
		{
			Talk(0);
		}

		void UpdateAI(const uint32 diff)
		{
			if (!UpdateVictim())
				return;

			me->GetMotionMaster()->MoveRandom(5.0f);

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_blackrock_invaderAI(pCreature);
	}
};

/*######
 ## npc_goblin_assassin
 ######*/

class npc_goblin_assassin : public CreatureScript 
{
public:
	npc_goblin_assassin() : CreatureScript("npc_goblin_assassin") {	}

	struct npc_goblin_assassinAI : public ScriptedAI 
	{
		npc_goblin_assassinAI(Creature *c) : ScriptedAI(c) 
		{
			if (!me->isInCombat() && !me->HasAura(SPELL_SPYING))
				DoCast(SPELL_SNEAKING);
		}

		void EnterCombat(Unit * who) 
		{
			Talk(0);
		}

		void UpdateAI(const uint32 diff) 
		{
			if (!UpdateVictim())
				return;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_goblin_assassinAI(pCreature);
	}
};

enum Marshal
{
	QUEST_REPORT_TO_GOLDSHIRE = 54,
	SAY_DISMISSED = 0
};

/*######
## npc_marshal_mcbride
######*/

class npc_marshal_mcbride : public CreatureScript
{
public:
	npc_marshal_mcbride() : CreatureScript("npc_marshal_mcbride") { }

	bool OnQuestAccept(Player* player, Creature* creature, Quest const* quest)
	{
		if (quest->GetQuestId() == QUEST_REPORT_TO_GOLDSHIRE)
		{
			creature->AI()->Talk(SAY_DISMISSED, player->GetGUID());
		}
		return true;
	}

};

/*######
## npc_training_dummy_elwynn
######*/

enum eTrainingDummySpells
{
    SPELL_CHARGE        = 100,
    SPELL_AUTORITE      = 105361, // OnDamage
    SPELL_ASSURE        = 56641,
    SPELL_EVISCERATION  = 2098,
    SPELL_MOT_DOULEUR_1 = 589,
    SPELL_MOT_DOULEUR_2 = 124464, //
    SPELL_NOVA          = 122,
    SPELL_CORRUPTION_1  = 172,
    SPELL_CORRUPTION_2  = 87389,
    SPELL_CORRUPTION_3  = 131740,
    SPELL_PAUME_TIGRE   = 100787
};

class npc_training_dummy_start_zones : public CreatureScript
{
public:
    npc_training_dummy_start_zones() : CreatureScript("npc_training_dummy_start_zones") { }

    struct npc_training_dummy_start_zonesAI : Scripted_NoMovementAI
    {
        npc_training_dummy_start_zonesAI(Creature* creature) : Scripted_NoMovementAI(creature)
        {}

        uint32 resetTimer;

        void Reset()
        {
            me->SetControlled(true, UNIT_STATE_STUNNED); //disable rotate
			me->ApplySpellImmune(0, IMMUNITY_EFFECT, SPELL_EFFECT_KNOCK_BACK, true);

            resetTimer = 5000;
        }

        void EnterEvadeMode()
        {
            if (!_EnterEvadeMode())
                return;

            Reset();
        }

        void MoveInLineOfSight(Unit* p_Who)
        {
            if (!me->IsWithinDistInMap(p_Who, 20.0f) && p_Who->isInCombat())
            {
                me->RemoveAllAurasByCaster(p_Who->GetGUID());
                me->getHostileRefManager().deleteReference(p_Who);
            }
        }

        void DamageTaken(Unit* doneBy, uint32& damage, SpellInfo const*  /*p_SpellInfo*/)
        {
            resetTimer = 5000;
            damage = 0;

            if (doneBy->HasAura(SPELL_AUTORITE))
                if (doneBy->ToPlayer())
                    doneBy->ToPlayer()->KilledMonsterCredit(44175, 0);

            me->SetInCombatWith(doneBy);
            doneBy->SetInCombatWith(me);
        }

        void EnterCombat(Unit* /*who*/)
        {
            return;
        }

        void SpellHit(Unit* Caster, const SpellInfo* Spell)
        {
            switch (Spell->Id)
            {
                case SPELL_CHARGE:
                case SPELL_ASSURE:
                case SPELL_EVISCERATION:
                case SPELL_MOT_DOULEUR_1:
                case SPELL_MOT_DOULEUR_2:
                case SPELL_NOVA:
                case SPELL_CORRUPTION_1:
                case SPELL_CORRUPTION_2:
                case SPELL_CORRUPTION_3:
                case SPELL_PAUME_TIGRE:
                    if (Caster->ToPlayer())
                        Caster->ToPlayer()->KilledMonsterCredit(44175, 0);
                    break;
                default:
                    break;
            }
        }

        void UpdateAI(uint32 const diff)
        {
            if (!UpdateVictim())
                return;

            if (!me->HasUnitState(UNIT_STATE_STUNNED))
                me->SetControlled(true, UNIT_STATE_STUNNED);

            if (resetTimer <= diff)
            {
                EnterEvadeMode();
                resetTimer = 5000;
            }
            else
                resetTimer -= diff;
        }
    };

    CreatureAI* GetAI(Creature* creature) const
    {
        return new npc_training_dummy_start_zonesAI(creature);
    }
};

/// Marshal Dughan - 240
class npc_marshal_dughan : public CreatureScript
{
public:
	npc_marshal_dughan() : CreatureScript("npc_marshal_dughan") { }

	enum eActions
	{
		SelectGossip = 0
	};

	bool OnGossipHello(Player* p_Player, Creature* p_Creature)
	{
		p_Player->PrepareQuestMenu(p_Creature->GetGUID());

		if (p_Player->GetQuestStatus(35))
		{
			p_Player->ADD_GOSSIP_ITEM(GOSSIP_ICON_CHAT, "I wish to ride the Stormwind gryphon, sir.", GOSSIP_SENDER_MAIN, eActions::SelectGossip);
		}

		p_Player->SEND_GOSSIP_MENU(16211, p_Creature->GetGUID());

		return true;
	}

	bool OnGossipSelect(Player* p_Player, Creature* p_Creature, uint32 /*p_Sender*/, uint32 p_Action) override
	{
		switch (p_Action)
		{
			case eActions::SelectGossip: // I wish to ride the Stormwind Gryphon, sir.
			{
				if (p_Player->GetQuestStatus(35))
				{
					Position l_Pos;
					p_Player->GetPosition(&l_Pos);

					if (Creature* l_Creature = p_Player->SummonCreature(42260, l_Pos))
					{
						l_Creature->GetAI()->DoAction(0);
					}
				}
				break;
			}
		default:
			break;
		}

		p_Player->PlayerTalkClass->ClearMenus();
		p_Player->PlayerTalkClass->SendCloseGossip();

		return true;
	}

	struct npc_marshal_dughanAI : public ScriptedAI
	{
		npc_marshal_dughanAI(Creature* p_Creature) : ScriptedAI(p_Creature) { }
	};

	CreatureAI* GetAI(Creature* p_Creature) const override
	{
		return new npc_marshal_dughanAI(p_Creature);
	}
};

enum eMovepointsData
{
	MaxStormwindChargerMoves = 19
};

static std::array<G3D::Vector3, eMovepointsData::MaxStormwindChargerMoves> g_StormwindChargerMoves =
{
	{
		{ -9472.65f, 64.87f, 71.095f   },
		{ -9488.76f, 65.68f, 71.019f   },
		{ -9499.33f, 45.78f, 70.828f   },
		{ -9544.13f, -47.17f, 71.672f  },
		{ -9552.60f, -132.82f, 72.394f },
		{ -9573.70f, -159.34f, 72.569f },
		{ -9619.31f, -305.55f, 72.359f },
		{ -9617.16f, -408.72f, 72.105f },
		{ -9606.15f, -440.79f, 72.488f },
		{ -9590.33f, -487.42f, 72.738f },
		{ -9615.00f, -540.68f, 69.344f },
		{ -9625.86f, -634.08f, 66.309f },
		{ -9645.11f, -675.84f, 63.514f },
		{ -9656.27f, -726.09f, 59.377f },
		{ -9646.74f, -798.64f, 58.495f },
		{ -9584.79f, -877.63f, 58.836f },
		{ -9589.34f, -933.82f, 58.544f },
		{ -9619.54f, -979.84f, 58.692f },
		{ -9619.13f, -1031.14f, 39.681f }
	}
};

// Stormwind Gryphon - 42260
class npc_stormwind_gryphon : public CreatureScript
{
public:
	npc_stormwind_gryphon() : CreatureScript("npc_stormwind_gryphon") {}

	enum eActions
	{
		StartPath = 0,
		EndPath =  1
	};

	enum eMoves
	{
		StartQuestMove = 0
	};

	struct npc_stormwind_gryphonAI : public ScriptedAI
	{
		npc_stormwind_gryphonAI(Creature* creature) : ScriptedAI(creature)
		{
			m_PlayerGuid = 0;
		}

		uint64 m_PlayerGuid;

		void Reset() override
		{
			me->SetSpeed(UnitMoveType::MOVE_FLIGHT, 3.0f, true);

			ClearDelayedOperations();
		}

		void IsSummonedBy(Unit* p_Summoner) override
		{
			m_PlayerGuid = p_Summoner->GetGUID();
		}

		void DoAction(int32 const p_Action) override
		{
			switch (p_Action)
			{
				case eActions::StartPath:
				{
					AddTimedDelayedOperation(0 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Player* p_Player = sObjectAccessor->GetPlayer(*me, m_PlayerGuid))
						{
							me->HandleEmoteCommand(553); // Special emote
						}
					});

					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Player* p_Player = sObjectAccessor->GetPlayer(*me, m_PlayerGuid))
						{
							me->CastSpell(p_Player, 59119); // ride vehicle
							p_Player->EnterVehicle(me);
						}
					});

					AddTimedDelayedOperation(1 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						if (Player* p_Player = sObjectAccessor->GetPlayer(*me, m_PlayerGuid))
						{
							me->GetMotionMaster()->MoveSmoothFlyPath(eMoves::StartQuestMove, g_StormwindChargerMoves.data(), g_StormwindChargerMoves.size(), false);
						}
					});

					AddTimedDelayedOperation(36 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->GetAI()->DoAction(eActions::EndPath);
					});
				break;
				}

				case eActions::EndPath:
				{
					AddTimedDelayedOperation(0.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->HandleEmoteCommand(553); // Special emote
						me->GetVehicleKit()->RemoveAllPassengers();
					});

					AddTimedDelayedOperation(1.5 * TimeConstants::IN_MILLISECONDS, [this]() -> void
					{
						me->DespawnOrUnsummon();
					});
					break;
				}
			default:
				break;
			}
		}

		void UpdateAI(uint32 const p_Diff) override
		{
			UpdateOperations(p_Diff);
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_stormwind_gryphonAI(creature);
	}
};

/*################
npc_hogger#
################*/

enum Spells
{
	SPELL_EATING = 87351,
	SPELL_VICIOUS_SLICE = 87337,
	SPELL_SUMMON_MINIONS = 87366,
	SPELL_SIMPLY_TELEPORT = 64446,
};

class npc_hogger : public CreatureScript
{
public:
	npc_hogger() : CreatureScript("npc_hogger") { }

	struct npc_hoggerAI : public ScriptedAI
	{
		uint8 phase;

		uint32 m_uiViciousSliceTimer;
		uint32 m_uiSummonMinions;
		uint32 m_uiPhaseTimer;
		uint32 m_uiDespawnTimer;

		uint64 GeneralGUID;
		uint64 Mage1GUID;
		uint64 Mage2GUID;
		uint64 Raga1GUID;
		uint64 Raga2GUID;
		uint64 PlayerGUID;

		bool bSay;
		bool bSay2;
		bool bSay3;
		bool Summon;
		bool bSummoned;
		bool bSummoned3;
		bool bGo1;
		bool bCasted;
		bool Credit;

		npc_hoggerAI(Creature *c) : ScriptedAI(c) {}

		void Reset()
		{
			me->RestoreFaction();
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

			m_uiViciousSliceTimer = 8000;
			m_uiSummonMinions = 15000;
			m_uiPhaseTimer = 0;
			m_uiDespawnTimer = 500;

			phase = 0;
			GeneralGUID = 0;
			Mage1GUID = 0;
			Mage2GUID = 0;
			Raga1GUID = 0;
			Raga2GUID = 0;
			PlayerGUID = 0;

			Summon = false;
			bSay = false;
			bCasted = false;
			bSay2 = false;
			bSay3 = false;
			bSummoned = false;
			bSummoned3 = false;
			bGo1 = false;
			Credit = false;
		}

		void JustDied(Unit* /*killer*/)
		{
			me->RestoreFaction();
		}

		void AttackedBy(Unit* pAttacker)
		{
			if (me->getVictim() || me->IsFriendlyTo(pAttacker))
				return;

			AttackStart(pAttacker);
		}

		void MovementInform(uint32 type, uint32 id)
		{
			if (id == 0)
			{
				DoCast(me, SPELL_EATING);
			}
		}

		void UpdateAI(const uint32 diff)
		{
			ScriptedAI::UpdateAI(diff);

			DoMeleeAttackIfReady();

			if (m_uiViciousSliceTimer <= diff)
			{
				DoCast(me->getVictim(), SPELL_VICIOUS_SLICE);
				m_uiViciousSliceTimer = 10000;
			}
			else
				m_uiViciousSliceTimer -= diff;

			if (HealthBelowPct(50))
			{
				if (!bSummoned)
				{
					DoCast(me->getVictim(), SPELL_SUMMON_MINIONS);
					bSummoned = true;
				}
				if (!bSay)
				{
					me->MonsterYell("Yipe! Help Hogger", 0, NULL);
					bSay = true;
				}
			}

			if (HealthBelowPct(35))
			{
				if (!bSay2)
				{
					me->MonsterTextEmote("Hogger is eating! Stop him!", NULL, true);
					bSay2 = true;
				}
				if (!bGo1)
				{
					me->AttackStop();
					me->SetReactState(REACT_PASSIVE);
					me->GetMotionMaster()->MovePoint(0, -10142.081f, 671.773f, 36.014f);
					bGo1 = true;
				}
			}

			if (HealthBelowPct(10))
			{
				if (!bSummoned3)
				{
					if (!bSay3)
					{
						me->MonsterYell("No hurt Hogger!", 0, NULL);
						bSay3 = true;
					}

					me->CombatStop(true);
					me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NON_ATTACKABLE);

					Creature* General = me->SummonCreature(46942, -10133.275f, 663.244f, 35.964616f, 2.45f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					GeneralGUID = General->GetGUID();

					Creature* Mage1 = me->SummonCreature(46941, -10129.976f, 667.982f, 35.67f, 2.85f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					Mage1GUID = Mage1->GetGUID();

					Creature* Mage2 = me->SummonCreature(46940, -10137.671f, 659.926f, 35.971f, 2.051f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					Mage2GUID = Mage2->GetGUID();

					Creature* Raga1 = me->SummonCreature(46943, -10133.339f, 660.087f, 35.971f, 2.26f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					Raga1GUID = Raga1->GetGUID();

					Creature* Raga2 = me->SummonCreature(42413, -10129.461f, 663.180f, 35.9491f, 2.37f, TEMPSUMMON_TIMED_OR_DEAD_DESPAWN, 180000);
					Raga2GUID = Raga2->GetGUID();

					Summon = true;

					m_uiPhaseTimer = 1500;
					phase = 1;
				}

				if (Summon)
				{
					Creature* General = Unit::GetCreature(*me, GeneralGUID);
					Creature* Raga2 = Unit::GetCreature(*me, Raga2GUID);
					Creature* Raga1 = Unit::GetCreature(*me, Raga1GUID);
					Creature* Mage2 = Unit::GetCreature(*me, Mage2GUID);
					Creature* Mage1 = Unit::GetCreature(*me, Mage1GUID);

					if (!bCasted)
					{
						General->CastSpell(General, 64446, true);
						Raga2->CastSpell(Raga2, 64446, true);
						Raga1->CastSpell(Raga1, 64446, true);
						Mage2->CastSpell(Raga2, 64446, true);
						Mage1->CastSpell(Raga1, 64446, true);
						bCasted = true;
					}

					bSummoned3 = true;
					me->SetSpeed(MOVE_RUN, 1.0f);
				}
			}

			if (bCasted)
			{
				if (m_uiPhaseTimer <= diff)
				{
					Creature* General = Unit::GetCreature(*me, GeneralGUID);
					Creature* Raga2 = Unit::GetCreature(*me, Raga2GUID);
					Creature* Raga1 = Unit::GetCreature(*me, Raga1GUID);
					Creature* Mage2 = Unit::GetCreature(*me, Mage2GUID);
					Creature* Mage1 = Unit::GetCreature(*me, Mage1GUID);

					switch (phase)
					{

					case 1: me->GetMotionMaster()->MovePoint(1, -10141.054f, 670.719f, 35.9569f); m_uiPhaseTimer = 3000; phase = 2; break;
					case 2: General->MonsterYell("Hold your blade, adventurer!", 0, NULL); m_uiPhaseTimer = 2500; phase = 3; break;
					case 3: Raga1->MonsterSay("WoW!", 0, NULL); m_uiPhaseTimer = 1500; phase = 4; break;
					case 4: Raga2->MonsterSay("General Jonathan Marcus!", 0, NULL); m_uiPhaseTimer = 1500; phase = 5; break;
					case 5:
					{
						if (Creature* General = Unit::GetCreature(*me, GeneralGUID))
						{
							General->MonsterSay("This beast leads the Riverpaw gnoll gang and may be the key to ending gnoll aggression in Elwynn!", 0, NULL);
							General->AddUnitMovementFlag(MOVEMENTFLAG_WALKING);
							General->GetMotionMaster()->MovePoint(0, -10137.162f, 667.919f, 35.937f);
							m_uiPhaseTimer = 3000;
						}
						phase = 6;
					} break;
					case 6: me->MonsterSay("Grrr...", 0, NULL); m_uiPhaseTimer = 4000; phase = 7; break;
					case 7:
					{
						General->HandleEmoteCommand(EMOTE_ONESHOT_POINT);
						m_uiPhaseTimer = 4500;
						phase = 8;
					} break;

					case 8: General->MonsterSay("We're taking him into custody in the name of King Varian Wrynn.", 0, NULL); m_uiPhaseTimer = 4000; phase = 9; break;
					case 9: me->MonsterSay("Nooooo...", 0, NULL); m_uiPhaseTimer = 4000; phase = 10; break;
					case 10: General->MonsterSay("Take us to the Stockades, Andromath.", 0, NULL); m_uiPhaseTimer = 4000; phase = 11; break;
						General->SetOrientation(6.08f);
					case 11:
					{
						General->CastSpell(General, 64446, true);
						Raga1->CastSpell(Raga1, 64446, true);
						Raga2->CastSpell(Raga2, 64446, true);
						Mage1->CastSpell(Mage1, 64446, true);
						Mage2->CastSpell(Mage2, 64446, true);
						me->CastSpell(me, 64446, true);

						General->DespawnOrUnsummon(500);
						Raga1->DespawnOrUnsummon(500);
						Raga2->DespawnOrUnsummon(500);
						Mage1->DespawnOrUnsummon(500);
						Mage2->DespawnOrUnsummon(500);
						me->DespawnOrUnsummon(500);

						std::list<Player*> PlayersInRange;
						me->GetPlayerListInGrid(PlayersInRange, 35.0f);

						for (std::list<Player*>::const_iterator itr = PlayersInRange.begin(); itr != PlayersInRange.end(); ++itr)
							(*itr)->KilledMonsterCredit(448, NULL);

						phase = 0;
					} break;
					default: break;
					}
				}
				else m_uiPhaseTimer -= diff;
			}
			if (me->GetHealth() <= 1)
			{
				if (m_uiDespawnTimer <= diff)
				{
					me->CombatStop(true);
					me->AttackStop();
					me->ClearAllReactives();
					me->DeleteThreatList();
					me->SetHealth(me->GetMaxHealth());
				}
				else m_uiDespawnTimer -= diff;
			}
		}
		void DamageTaken(Unit* done_by, uint32 & damage)
		{
			if (PlayerGUID == 0)
			{
				if (Player *pPlayer = done_by->ToPlayer())
				{
					PlayerGUID = pPlayer->GetGUID();
				}
			}

			if (me->GetHealth() <= damage)
			{
				damage = me->GetHealth() - 1;

				if (Credit == false)
				{
					me->RemoveAllAuras();
					me->CombatStop(true);
					me->AttackStop();
					me->ClearAllReactives();
					me->DeleteThreatList();

				}Credit = true;
			}
		}
	};

	CreatureAI* GetAI(Creature* pCreature) const
	{
		return new npc_hoggerAI(pCreature);
	}
};

/*######
## spell_quest_extincteur
######*/

#define SPELL_VISUAL_EXTINGUISHER   96028

class spell_quest_extincteur: public SpellScriptLoader
{
    public:
        spell_quest_extincteur() : SpellScriptLoader("spell_quest_extincteur") { }

        class spell_quest_extincteur_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_quest_extincteur_AuraScript)

            void OnApply(AuraEffect const* /*aurEff*/, AuraEffectHandleModes /*mode*/)
            {
                if (GetCaster())
                    GetCaster()->AddAura(SPELL_VISUAL_EXTINGUISHER, GetCaster());
            }

            void OnPeriodic(AuraEffect const* /*aurEff*/)
            {
                if (!GetCaster())
                    return;

                if (Creature* fire = GetCaster()->FindNearestCreature(42940, 5.0f, true))
                {
                    if (Player* player = GetCaster()->ToPlayer())
                        player->KilledMonsterCredit(42940, 0);

                    fire->ForcedDespawn();
                }
            }

            void OnRemove(AuraEffect const*, AuraEffectHandleModes)
            {
                if (GetCaster())
                    GetCaster()->RemoveAurasDueToSpell(SPELL_VISUAL_EXTINGUISHER);
            }

            void Register()
            {
                OnEffectApply += AuraEffectApplyFn(spell_quest_extincteur_AuraScript::OnApply, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_quest_extincteur_AuraScript::OnPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL);
                OnEffectRemove += AuraEffectRemoveFn(spell_quest_extincteur_AuraScript::OnRemove, EFFECT_0, SPELL_AURA_PERIODIC_TRIGGER_SPELL, AURA_EFFECT_HANDLE_REAL);
            }
        };

        AuraScript* GetAuraScript() const
        {
            return new spell_quest_extincteur_AuraScript();
        }
};

enum eHenzeFaulkData
{
	SAY_HEAL = -1000187,
};

class npc_henze_faulk : public CreatureScript
{
public:
	npc_henze_faulk() : CreatureScript("npc_henze_faulk") { }

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_henze_faulkAI(creature);
	}

	struct npc_henze_faulkAI : public ScriptedAI
	{
		uint32 lifeTimer;
		bool spellHit;

		npc_henze_faulkAI(Creature* creature) : ScriptedAI(creature) {}

		void Reset()
		{
			lifeTimer = 120000;
			me->SetUInt32Value(UNIT_FIELD_NPC_FLAGS, UNIT_DYNFLAG_DEAD);
			me->SetStandState(UNIT_STAND_STATE_DEAD);   // lay down
			spellHit = false;
		}

		void EnterCombat(Unit* /*who*/)
		{
		}

		void MoveInLineOfSight(Unit* /*who*/)
		{
		}

		void UpdateAI(const uint32 diff)
		{
			if (me->IsStandState())
			{
				if (lifeTimer <= diff)
				{
					EnterEvadeMode();
					return;
				}
				else
					lifeTimer -= diff;
			}
		}

		void SpellHit(Unit* /*Hitter*/, const SpellEntry* Spellkind)
		{
			if (Spellkind->Id == 8593 && !spellHit)
			{
				DoCast(me, 32343);
				me->SetStandState(UNIT_STAND_STATE_STAND);
				me->SetUInt32Value(UNIT_FIELD_NPC_FLAGS, 0);
				//me->RemoveAllAuras();
				DoScriptText(SAY_HEAL, me);
				spellHit = true;
			}
		}
	};
};

#ifndef __clang_analyzer__
void AddSC_elwyn_forest()
{
	// Northshire
    new npc_stormwind_infantry();
	new npc_blackrock_battle_worg();
	new npc_brother_paxton();
    new npc_injured_stormwind_soldier();
    new npc_training_dummy_start_zones();
	new npc_blackrock_spy();
	new npc_blackrock_invader();
	new npc_goblin_assassin();
	new spell_quest_extincteur();

	// Goldshire
	new npc_stormwind_gryphon();
	new	npc_marshal_dughan();

	new npc_hogger();

	new npc_henze_faulk();
}
#endif
