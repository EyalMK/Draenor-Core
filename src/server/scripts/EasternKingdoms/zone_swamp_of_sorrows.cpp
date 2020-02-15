/*
 * Copyright (C) 2008-2016 TrinityCore <http://www.trinitycore.org/>
 * Copyright (C) 2006-2009 ScriptDev2 <https://scriptdev2.svn.sourceforge.net/>
 *
 * This program is free software; you can redistribute it and/or modify it
 * under the terms of the GNU General Public License as published by the
 * Free Software Foundation; either version 2 of the License, or (at your
 * option) any later version.
 *
 * This program is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
 * FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for
 * more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program. If not, see <http://www.gnu.org/licenses/>.
 */

class npc_fallen_marshtide : public CreatureScript
{
public:
	npc_fallen_marshtide() : CreatureScript("npc_fallen_marshtide") { }

	struct npc_fallen_marshtideAI : public ScriptedAI
	{
		npc_fallen_marshtideAI(Creature* creature) : ScriptedAI(creature) { }

		void Reset()
		{
			ClearDelayedOperations();
			m_Events.Reset();

			me->SetByteFlag(UNIT_FIELD_ANIM_TIER, 0, UNIT_STAND_STATE_DEAD);
			me->SetHealth(0);
		}

//	private:
//		EventMap m_CosmeticEvents;
//		EventMap m_Events;
//	};



//	CreatureAI* GetAI(Creature* creature) const
//	{
//		return new npc_fallen_marshtideAI(creature);
//	}
//};



//void AddSC_swamp_of_sorrows()
//{
//	new npc_fallen_marshtide();
//}