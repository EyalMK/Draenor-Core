#include "ScriptMgr.h"
#include "ScriptedCreature.h"
#include "SpellAuraEffects.h"
#include "SpellScript.h"

enum Texts
{
    SAY_INTRO       = 0,
    SAY_AGGRO       = 1,
    SAY_SURPREME    = 2,
    SAY_KILL        = 3,
    SAY_DEATH       = 4
};

enum Spells
{
    SPELL_SHADOW_VOLLEY             = 21341,
    SPELL_CLEAVE                    = 16044,
    SPELL_THUNDERCLAP               = 8078,
    SPELL_VOID_BOLT                 = 22709,
    SPELL_MARK_OF_KAZZAK            = 21056,
    SPELL_MARK_OF_KAZZAK_DAMAGE     = 21058,
    SPELL_CAPTURE_SOUL              = 21054,
    SPELL_TWISTED_REFLECTION        = 21063,
    SPELL_TWISTED_REFLECTION_HEAL   = 21064,
    SPELL_BERSERK                   = 32965,
};

enum Events
{
    EVENT_SHADOW_VOLLEY         = 1,
    EVENT_CLEAVE                = 2,
    EVENT_THUNDERCLAP           = 3,
    EVENT_VOID_BOLT             = 4,
    EVENT_MARK_OF_KAZZAK        = 5,
    EVENT_TWISTED_REFLECTION    = 6,
    EVENT_BERSERK               = 7
};

class boss_classic_kazzak : public CreatureScript
{
    public:
        boss_classic_kazzak() : CreatureScript("boss_classic_kazzak") { }

        struct boss_doomlordkazzakAI : public ScriptedAI
        {
            boss_doomlordkazzakAI(Creature* creature) : ScriptedAI(creature)
            {
            }

            void Reset() override
            {
                _events.Reset();
                _events.ScheduleEvent(EVENT_SHADOW_VOLLEY, urand(6000, 10000));
                _events.ScheduleEvent(EVENT_CLEAVE, 7000);
                _events.ScheduleEvent(EVENT_THUNDERCLAP, urand(14000, 18000));
                _events.ScheduleEvent(EVENT_VOID_BOLT, 30000);
                _events.ScheduleEvent(EVENT_MARK_OF_KAZZAK, 25000);
                _events.ScheduleEvent(EVENT_TWISTED_REFLECTION, 33000);
                _events.ScheduleEvent(EVENT_BERSERK, 180000);
            }

			void JustRespawned() override
            {
                Talk(SAY_INTRO);
            }

			void EnterCombat(Unit* /*who*/) override
            {
                Talk(SAY_AGGRO);
				me->SetInCombatWithZone();
            }

            void KilledUnit(Unit* victim) override
            {
				Player* affectedPlayer;
				Creature* creature;

				switch (victim->GetTypeId())
				{
					/** Prevent Kazzak to use his healing spell if player got a level lower than 50 */
				case TYPEID_PLAYER:
					affectedPlayer = victim->GetAffectingPlayer();
					if (!affectedPlayer)
						return;
					if (affectedPlayer->getLevel() < 50)
						return;
					break;

				case TYPEID_UNIT:
					/** Kazzak can use his healing ability on Totem and Pets */
					creature = victim->ToCreature();
					if (!creature->isPet() && !creature->isTotem())
						return;

					/** Prevent Kazzak to use his healing spell if the pet got a level lower than 50 */
					if (creature->getLevel() < 50)
						return;
					break;

				default:
					return;
					break;
				}


                DoCast(me, SPELL_CAPTURE_SOUL);

                Talk(SAY_KILL, victim->GetGUID());
            }

            void JustDied(Unit* /*killer*/) override
            {
                Talk(SAY_DEATH);
            }

            void UpdateAI(uint32 diff) override
            {
                // Return since we have no target
                if (!UpdateVictim())
                    return;

                _events.Update(diff);

                if (me->HasUnitState(UNIT_STATE_CASTING))
                    return;

                while (uint32 eventId = _events.ExecuteEvent())
                {
                    switch (eventId)
                    {
                        case EVENT_SHADOW_VOLLEY:
                            DoCastVictim(SPELL_SHADOW_VOLLEY);
                            _events.ScheduleEvent(EVENT_SHADOW_VOLLEY, 4000, 6000);
                            break;
                        case EVENT_CLEAVE:
                            DoCastVictim(SPELL_CLEAVE);
                            _events.ScheduleEvent(EVENT_CLEAVE, 8000, 12000);
                            break;
                        case EVENT_THUNDERCLAP:
                            DoCastVictim(SPELL_THUNDERCLAP);
                            _events.ScheduleEvent(EVENT_THUNDERCLAP, 10000, 14000);
                            break;
                        case EVENT_VOID_BOLT:
                            DoCastVictim(SPELL_VOID_BOLT);
                            _events.ScheduleEvent(EVENT_VOID_BOLT, 15000, 18000);
                            break;
                        case EVENT_MARK_OF_KAZZAK:
						{
							Unit* pTarget = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true);
							if (pTarget && pTarget->getPowerType() == POWER_MANA && pTarget->GetPower(POWER_MANA) > 1000)
							{
								DoCast(pTarget, SPELL_MARK_OF_KAZZAK);
							}

							// Mark of Kazzak - Explode the target when does not have more mana
							std::list<HostileReference*>& m_threatlist = me->getThreatManager().getThreatList();
							std::list<HostileReference*>::iterator i = m_threatlist.begin();
							for (i = m_threatlist.begin(); i != m_threatlist.end(); ++i)
							{
								Unit* pMarked = Unit::GetUnit((*me), (*i)->getUnitGuid());
								if (pMarked && pMarked->HasAura(SPELL_MARK_OF_KAZZAK) && pMarked->GetPower(POWER_MANA) < 250)
								{
									pMarked->RemoveAurasDueToSpell(SPELL_MARK_OF_KAZZAK);
									pMarked->CastSpell(pMarked, SPELL_MARK_OF_KAZZAK_DAMAGE, false);
									break;
								}
							}
							_events.ScheduleEvent(EVENT_MARK_OF_KAZZAK, 20000);
							break;
						}	
                        case EVENT_TWISTED_REFLECTION:
                            if (Unit* target = SelectTarget(SELECT_TARGET_RANDOM, 0, 0.0f, true))
                                DoCast(target, SPELL_TWISTED_REFLECTION);
                            _events.ScheduleEvent(EVENT_TWISTED_REFLECTION, 15000);
                            break;
                        case EVENT_BERSERK:
							Talk(SAY_SURPREME);
                            DoCast(me, SPELL_BERSERK);
							_events.ScheduleEvent(EVENT_BERSERK, 600000);
                            break;
                        default:
                            break;
                    }
                }

                DoMeleeAttackIfReady();
            }

        private:
            EventMap _events;
        };

        CreatureAI* GetAI(Creature* creature) const override
        {
            return new boss_doomlordkazzakAI(creature);
        }
};

class spell_mark_of_kazzak : public SpellScriptLoader
{
    public:
        spell_mark_of_kazzak() : SpellScriptLoader("spell_mark_of_kazzak") { }

        class spell_mark_of_kazzak_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_mark_of_kazzak_AuraScript);

            bool Validate(SpellInfo const* /*spell*/) override
            {
				if (!sSpellMgr->GetSpellInfo(SPELL_MARK_OF_KAZZAK_DAMAGE))
					return false;
				return true;
            }

            void CalculateAmount(AuraEffect const* /*aurEff*/, int32& amount, bool& /*canBeRecalculated*/)
            {
                if (Unit* owner = GetUnitOwner())
                    amount = CalculatePct(owner->GetPower(POWER_MANA), 5);
            }

            void OnPeriodic(AuraEffect const* aurEff)
            {
                Unit* target = GetTarget();

                if (target->GetPower(POWER_MANA) == 0)
                {
                    target->CastSpell(target, SPELL_MARK_OF_KAZZAK_DAMAGE, aurEff);
                    // Remove aura
                    SetDuration(0);
                }
            }

            void Register() override
            {
                DoEffectCalcAmount += AuraEffectCalcAmountFn(spell_mark_of_kazzak_AuraScript::CalculateAmount, EFFECT_0, SPELL_AURA_PERIODIC_MANA_LEECH);
                OnEffectPeriodic += AuraEffectPeriodicFn(spell_mark_of_kazzak_AuraScript::OnPeriodic, EFFECT_0, SPELL_AURA_PERIODIC_MANA_LEECH);
            }
        };

        AuraScript* GetAuraScript() const override
        {
            return new spell_mark_of_kazzak_AuraScript();
        }
};

class spell_twisted_reflection : public SpellScriptLoader
{
    public:
        spell_twisted_reflection() : SpellScriptLoader("spell_twisted_reflection") { }

        class spell_twisted_reflection_AuraScript : public AuraScript
        {
            PrepareAuraScript(spell_twisted_reflection_AuraScript);

            bool Validate(SpellInfo const* /*spellInfo*/) override
            {
				if (!sSpellMgr->GetSpellInfo(SPELL_TWISTED_REFLECTION_HEAL))
					return false;
				return true;
            }

			void HandleProc(AuraEffect const* aurEff, ProcEventInfo& eventInfo)
			{
				PreventDefaultAction();
				DamageInfo* damageInfo = eventInfo.GetDamageInfo();
				if (!damageInfo || !damageInfo->GetDamage())
					return;

				eventInfo.GetActionTarget()->CastSpell(eventInfo.GetActor(), SPELL_TWISTED_REFLECTION_HEAL, true, nullptr, aurEff);
			}

			void Register() override
			{
				OnEffectProc += AuraEffectProcFn(spell_twisted_reflection_AuraScript::HandleProc, EFFECT_0, SPELL_AURA_DUMMY);
			}
        };

		AuraScript* GetAuraScript() const override
		{
			return new spell_twisted_reflection_AuraScript();
		}
};

void AddSC_boss_classic_kazzak()
{
    new boss_classic_kazzak();
    new spell_mark_of_kazzak();
    new spell_twisted_reflection();
}