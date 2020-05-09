/* ScriptData
SDName: Boss_Jeklik
SD%Complete: 85
SDComment: Problem in finding the right flying batriders for spawning and making them fly.
SDCategory: Zul'Gurub
EndScriptData */

#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "zulgurub.h"

enum Says
{
	SAY_AGGRO = 0,
	SAY_RAIN_FIRE = 1,
	SAY_DEATH = 2
};

enum Spells
{
	SPELL_CHARGE = 22911,
	SPELL_SONICBURST = 23918,
	SPELL_SCREECH = 6605,
	SPELL_SHADOW_WORD_PAIN = 23952,
	SPELL_MIND_FLAY = 23953,
	SPELL_CHAIN_MIND_FLAY = 26044, // Right ID unknown. So disabled
	SPELL_GREATERHEAL = 23954,
	SPELL_BAT_FORM = 23966,
	// Batriders Spell
	SPELL_BOMB = 40332 // Wrong ID but Magmadars bomb is not working...
};

class boss_jeklik : public CreatureScript //jeklik
{
public: boss_jeklik() : CreatureScript("boss_jeklik") {}

		struct boss_jeklikAI : public BossAI
		{
			boss_jeklikAI(Creature* creature) : BossAI(creature, DATA_JEKLIK) {}

			uint32 Charge_Timer;
			uint32 SonicBurst_Timer;
			uint32 Screech_Timer;
			uint32 SpawnBats_Timer;
			uint32 ShadowWordPain_Timer;
			uint32 MindFlay_Timer;
			uint32 ChainMindFlay_Timer;
			uint32 GreaterHeal_Timer;
			uint32 SpawnFlyingBats_Timer;

			bool PhaseTwo;

			void Reset()
			{
				_Reset();
				Charge_Timer = 20000;
				SonicBurst_Timer = 8000;
				Screech_Timer = 13000;
				SpawnBats_Timer = 60000;
				ShadowWordPain_Timer = 6000;
				MindFlay_Timer = 11000;
				ChainMindFlay_Timer = 26000;
				GreaterHeal_Timer = 50000;
				SpawnFlyingBats_Timer = 10000;

				PhaseTwo = false;
			}

			void JustDied(Unit* /*killer*/)
			{
				_JustDied();
				Talk(SAY_DEATH);
			}

			void EnterCombat(Unit* /*who*/)
			{
				_EnterCombat();
				Talk(SAY_AGGRO);
				DoCast(me, SPELL_BAT_FORM);
			}

			void UpdateAI(uint32 diff)
			{
				if (!UpdateVictim())
					return;

				if (me->getVictim() && me->isAlive())
				{
					if (HealthAbovePct(50))
					{
						if (Charge_Timer <= diff)
						{
							if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
							{
								DoCast(target, SPELL_CHARGE);
								AttackStart(target);
							}

							Charge_Timer = urand(15000, 30000);
						}
						else Charge_Timer -= diff;

						if (SonicBurst_Timer <= diff)
						{
							DoCastVictim(SPELL_SONICBURST);
							SonicBurst_Timer = urand(8000, 13000);
						}
						else SonicBurst_Timer -= diff;

						if (Screech_Timer <= diff)
						{
							DoCastVictim(SPELL_SCREECH);
							Screech_Timer = urand(18000, 26000);
						}
						else Screech_Timer -= diff;

						if (SpawnBats_Timer <= diff)
						{
							Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0);

							Creature* Bat = NULL;
							Bat = me->SummonCreature(11368, -12291.6220f, -1380.2640f, 144.8304f, 5.483f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
							if (target && Bat) Bat->AI()->AttackStart(target);

							Bat = me->SummonCreature(11368, -12289.6220f, -1380.2640f, 144.8304f, 5.483f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
							if (target && Bat) Bat->AI()->AttackStart(target);

							Bat = me->SummonCreature(11368, -12293.6220f, -1380.2640f, 144.8304f, 5.483f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
							if (target && Bat) Bat->AI()->AttackStart(target);

							Bat = me->SummonCreature(11368, -12291.6220f, -1380.2640f, 144.8304f, 5.483f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
							if (target && Bat) Bat->AI()->AttackStart(target);

							Bat = me->SummonCreature(11368, -12289.6220f, -1380.2640f, 144.8304f, 5.483f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
							if (target && Bat) Bat->AI()->AttackStart(target);
							Bat = me->SummonCreature(11368, -12293.6220f, -1380.2640f, 144.8304f, 5.483f, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000);
							if (target && Bat) Bat->AI()->AttackStart(target);

							SpawnBats_Timer = 60000;
						}
						else SpawnBats_Timer -= diff;
					}
					else
					{
						if (PhaseTwo)
						{
							if (ShadowWordPain_Timer <= diff)
							{
								if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
								{
									DoCast(target, SPELL_SHADOW_WORD_PAIN);
									ShadowWordPain_Timer = urand(12000, 18000);
								}
							}ShadowWordPain_Timer -= diff;

							if (MindFlay_Timer <= diff)
							{
								DoCastVictim(SPELL_MIND_FLAY);
								MindFlay_Timer = 16000;
							}MindFlay_Timer -= diff;

							if (ChainMindFlay_Timer <= diff)
							{
								me->InterruptNonMeleeSpells(false);
								DoCastVictim(SPELL_CHAIN_MIND_FLAY);
								ChainMindFlay_Timer = urand(15000, 30000);
							}ChainMindFlay_Timer -= diff;

							if (GreaterHeal_Timer <= diff)
							{
								me->InterruptNonMeleeSpells(false);
								DoCast(me, SPELL_GREATERHEAL);
								GreaterHeal_Timer = urand(25000, 35000);
							}GreaterHeal_Timer -= diff;

							if (SpawnFlyingBats_Timer <= diff)
							{
								if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
								{
									if (Creature* FlyingBat = me->SummonCreature(14965, target->GetPositionX(), target->GetPositionY(), target->GetPositionZ() + 15, 0, TEMPSUMMON_TIMED_DESPAWN_OUT_OF_COMBAT, 15000))
										FlyingBat->AI()->AttackStart(target);
								}

								SpawnFlyingBats_Timer = urand(10000, 15000);
							}
							else SpawnFlyingBats_Timer -= diff;
						}
						else
						{
							me->SetDisplayId(15219);
							DoResetThreat();
							PhaseTwo = true;
						}
					}

					DoMeleeAttackIfReady();
				}
			}
		};

		CreatureAI* GetAI(Creature* creature) const
		{
			return new boss_jeklikAI(creature);
		}
};

//Flying Bat
class npc_batrider : public CreatureScript
{
public:

	npc_batrider()
		: CreatureScript("npc_batrider")
	{
	}

	struct npc_batriderAI : public ScriptedAI
	{
		npc_batriderAI(Creature* creature) : ScriptedAI(creature)
		{
			instance = creature->GetInstanceScript();
			m_bIsSummon = creature->ToTempSummon();
			Reset();
		}

		InstanceScript* instance;

		bool m_bIsSummon;
		uint32 Bomb_Timer;
		uint32 Check_Timer;

		void Reset()
		{
			Bomb_Timer = 2000;
			Check_Timer = 1000;

			me->SetFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
		}

		void EnterCombat(Unit* /*who*/) {

			// Don't attack if is summoned by Jeklik - the npc gets aggro because of the Liquid Fire
			if (m_bIsSummon)
				return;

			// Spells are handled in SmartAI
			// For normal mobs flag needs to be removed
			me->RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE);
		}

		void UpdateAI(uint32 diff)
		{
			if (!UpdateVictim())
				return;

			//Bomb_Timer
			if (Bomb_Timer <= diff)
			{
				if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0))
				{
					DoCast(target, SPELL_BOMB);
					Bomb_Timer = 5000;
				}
			}
			else Bomb_Timer -= diff;

			//Check_Timer
			if (Check_Timer <= diff)
			{
				if (instance)
				{
					if (instance->GetBossState(DATA_JEKLIK) == DONE)
					{
						me->setDeathState(JUST_DIED);
						me->RemoveCorpse();
						return;
					}
				}

				Check_Timer = 1000;
			}
			else Check_Timer -= diff;

			DoMeleeAttackIfReady();
		}
	};

	CreatureAI* GetAI(Creature* creature) const
	{
		return new npc_batriderAI(creature);
	}
};

void AddSC_boss_jeklik()
{
	new boss_jeklik();
	new npc_batrider();
}
