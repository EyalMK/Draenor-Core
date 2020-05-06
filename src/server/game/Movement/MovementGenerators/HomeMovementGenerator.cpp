////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "HomeMovementGenerator.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"

void HomeMovementGenerator<Creature>::DoInitialize(Creature* owner)
{
    _setTargetLocation(owner);
}

void HomeMovementGenerator<Creature>::DoFinalize(Creature* owner)
{
    owner->ClearUnitState(UNIT_STATE_EVADE);

	if (arrived)
	{
		owner->ClearUnitState(UNIT_STATE_EVADE);
		owner->SetWalk(true);
		owner->LoadCreaturesAddon();
		owner->AI()->JustReachedHome();
		owner->AI()->Reset();
	}
}

void HomeMovementGenerator<Creature>::DoReset(Creature*) { }

void HomeMovementGenerator<Creature>::_setTargetLocation(Creature* owner)
{
	if (owner->HasUnitState(UNIT_STATE_ROOT | UNIT_STATE_STUNNED | UNIT_STATE_DISTRACTED))
		return;

	if (!owner->movespline->Finalized())
	{
		owner->UpdateSplinePosition();
		owner->movespline->_Finalize();
	}

	Movement::MoveSplineInit init(owner);
	float x, y, z, o;

	// At apply, we can select more nice return points base at current movegen
	if (owner->GetMotionMaster()->empty() || !owner->GetMotionMaster()->top()->GetResetPosition(owner, x, y, z))
	{
		owner->GetHomePosition(x, y, z, o);
		init.SetFacing(o);
	}
	init.MoveTo(x, y, z);
	init.SetWalk(false);
	init.Launch();

	arrived = false;

	owner->ClearUnitState(uint32(UNIT_STATE_ALL_STATE & ~UNIT_STATE_EVADE));
}

bool HomeMovementGenerator<Creature>::DoUpdate(Creature* owner, const uint32 /*time_diff*/)
{
    arrived = owner->movespline->Finalized();
    return !arrived;
}
