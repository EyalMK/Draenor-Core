////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "ByteBuffer.h"
#include "TargetedMovementGenerator.h"
#include "Errors.h"
#include "Creature.h"
#include "CreatureAI.h"
#include "World.h"
#include "MoveSplineInit.h"
#include "MoveSpline.h"
#include "Player.h"
#include "VehicleDefines.h"

template<class T, typename D>
void TargetedMovementGeneratorMedium<T, D>::_setTargetLocation(T* owner, bool updateDestination)
{
    if (!i_target.isValid() || !i_target->IsInWorld())
        return;

    if (owner->HasUnitState(UNIT_STATE_NOT_MOVE))
        return;

	//if (owner->GetTypeId() == TYPEID_UNIT && owner->ToCreature()->IsFocusing(nullptr, true))
	//	return;

   // if (owner->GetTypeId() == TYPEID_UNIT && !i_target->isInAccessiblePlaceFor(owner->ToCreature()))
   //     return;

    float x, y, z;

    if (updateDestination || !i_path)
    {
        if (!i_offset && !i_exactPos)
        {
            if (i_target->IsWithinMeleeRange(owner))
                return;

            // to nearest contact position
            i_target->GetContactPoint(owner, x, y, z);
        }
		else if (i_exactPos)
			GetTarget()->GetPosition(x, y, z);
        else
        {
            float dist;
            float size;

            // Pets need special handling.
            // We need to subtract GetObjectSize() because it gets added back further down the chain
            //  and that makes pets too far away. Subtracting it allows pets to properly
            //  be (GetCombatReach() + i_offset) away.
            // Only applies when i_target is pet's owner otherwise pets and mobs end up
            //   doing a "dance" while fighting
            if (owner->isPet() && i_target->GetTypeId() == TYPEID_PLAYER)
            {
				dist = 1.0f;
				size = 1.0f;
            }
            else
            {
                dist = i_offset + 1.0f;
                size = owner->GetObjectSize();
            }

            if (i_target->IsWithinDistInMap(owner, dist))
                return;

            ///if (i_target->IsPlayer() && i_target->isMoving())
            ///{
            ///    Position l_InterpolatedPosition = i_target->GetInterpolatedPosition(true, 2000);
            ///
            ///    /// Copied from Object::GetNearPoint2D
            ///    auto l_FNGetNearPoint2D = [=](float &p_OutX, float &p_OutY, float p_Distance2D, float p_AbsAngle)
            ///    {
            ///        p_OutX = l_InterpolatedPosition.GetPositionX() + (i_target->GetObjectSize() + p_Distance2D) * std::cos(p_AbsAngle);
            ///        p_OutY = l_InterpolatedPosition.GetPositionY() + (i_target->GetObjectSize() + p_Distance2D) * std::sin(p_AbsAngle);
            ///
            ///        JadeCore::NormalizeMapCoord(p_OutX);
            ///        JadeCore::NormalizeMapCoord(p_OutY);
            ///    };
            ///
            ///    /// Copied from Object::IsWithinLOS
            ///    auto l_FNIsWithinLOS = [=](float p_OutX, float p_OutY, float p_OutZ) -> bool
            ///    {
            ///        if (i_target->IsInWorld())
            ///            return i_target->GetMap()->isInLineOfSight(l_InterpolatedPosition.GetPositionX(), l_InterpolatedPosition.GetPositionY(), l_InterpolatedPosition.GetPositionZ() + 2.0f, p_OutX, p_OutY, p_OutZ + 2.0f, i_target->GetPhaseMask());
            ///
            ///        return true;
            ///    };
            ///
            ///    /// Copied from Object::GetNearPoint
            ///    auto l_FNGetNearPoint = [=](WorldObject const* p_Searcher, float &p_InOutX, float &p_InOutY, float &p_InOutZ, float p_SearcherSize, float p_Distance2D, float p_AbsAngle)
            ///    {
            ///        l_FNGetNearPoint2D(p_InOutX, p_InOutY, p_Distance2D + p_SearcherSize, p_AbsAngle);
            ///        p_InOutZ = l_InterpolatedPosition.GetPositionZ();
            ///
            ///        /// Should "searcher" be used instead of "this" when updating z coordinate ?
            ///        i_target->UpdateAllowedPositionZ(p_InOutX, p_InOutY, p_InOutZ);
            ///
            ///        /// if detection disabled, return first point
            ///        if (!sWorld->getBoolConfig(CONFIG_DETECT_POS_COLLISION))
            ///            return;
            ///
            ///        /// return if the point is already in LoS
            ///        if (l_FNIsWithinLOS(p_InOutX, p_InOutY, p_InOutZ))
            ///            return;
            ///
            ///        /// Remember first point
            ///        float l_FirstX = p_InOutX;
            ///        float l_FirstY = p_InOutY;
            ///        float l_FirstZ = p_InOutZ;
            ///
            ///        /// Loop in a circle to look for a point in LoS using small steps
            ///        for (float l_CurrentAngle = float(M_PI) / 8; l_CurrentAngle < float(M_PI) * 2; l_CurrentAngle += float(M_PI) / 8)
            ///        {
            ///            l_FNGetNearPoint2D(p_InOutX, p_InOutY, p_Distance2D + p_SearcherSize, p_AbsAngle + l_CurrentAngle);
            ///
            ///            p_InOutZ = l_InterpolatedPosition.GetPositionZ();
            ///
            ///            i_target->UpdateAllowedPositionZ(p_InOutX, p_InOutY, p_InOutZ);
            ///
            ///            if (l_FNIsWithinLOS(p_InOutX, p_InOutY, p_InOutZ))
            ///                return;
            ///        }
            ///
            ///        /// Still not in LoS, give up and return first position found
            ///        p_InOutX = l_FirstX;
            ///        p_InOutY = l_FirstY;
            ///        p_InOutZ = l_FirstZ;
            ///    };
            ///
            ///    l_FNGetNearPoint(nullptr, x, y, z, size, i_offset, l_InterpolatedPosition.GetOrientation() + i_angle);
            ///}
            ///else
            {
                // to at i_offset distance from target and i_angle from target facing
                i_target->GetClosePoint(x, y, z, size, i_offset, i_angle);
            }
        }
    }
    else
    {
        // the destination has not changed, we just need to refresh the path (usually speed change)
        G3D::Vector3 end = i_path->GetEndPosition();
        x = end.x;
        y = end.y;
        z = end.z;
    }

    if (!i_path)
        i_path = new PathGenerator(owner);

    // allow pets to use shortcut if no path found when following their master
    bool forceDest = (owner->GetTypeId() == TYPEID_UNIT && owner->ToCreature()->isPet()
        && owner->HasUnitState(UNIT_STATE_FOLLOW));

    bool result = i_path->CalculatePath(x, y, z, forceDest);

	if (!m_IsCharge && !i_exactPos)
	{
		float distFromTarget;
		if (!i_offset)
			distFromTarget = owner->GetCombatReach() + GetTarget()->GetCombatReach() + CONTACT_DISTANCE;
		else if (owner->isPet() && GetTarget()->GetTypeId() == TYPEID_PLAYER) // special case for offset != 0 and pets. cf above
			distFromTarget = 1.0f + GetTarget()->GetCombatReach() + i_offset;
		else
			distFromTarget = owner->GetCombatReach() + GetTarget()->GetCombatReach() + i_offset;
		if (!result || (i_path->GetPathType() & (PATHFIND_INCOMPLETE | PATHFIND_NOPATH | PATHFIND_NOT_USING_PATH)))
			result = i_path->CalculatePath(x, y, z, false);
		i_path->ReducePathLenghtByDist(distFromTarget, GetTarget()->ToUnit());
	}

    if (!result || (i_path->GetPathType() & PATHFIND_NOPATH))
    {
        // Cant reach target
        i_recalculateTravel = true;
        return;
    }

    D::_addUnitStateMove(owner);
    i_targetReached = false;
    i_recalculateTravel = false;
    owner->AddUnitState(UNIT_STATE_CHASE);

    Movement::MoveSplineInit init(owner);
    init.MovebyPath(i_path->GetPath());
	init.SetFacing(i_target.getTarget());
    init.SetWalk(((D*)this)->EnableWalking());
    // Using the same condition for facing target as the one that is used for SetInFront on movement end
    // - applies to ChaseMovementGenerator mostly
    if (i_angle == 0.0f)
        init.SetFacing(i_target.getTarget());

	/// Charge - set special speed for follow
	if (m_IsCharge)
		init.SetVelocity(SPEED_CHARGE);
	owner->GetPosition(&i_startPos);

    init.Launch();
}

template<class T, typename D>
bool TargetedMovementGeneratorMedium<T, D>::DoUpdate(T* owner, uint32 time_diff)
{
    if (!i_target.isValid() || !i_target->IsInWorld())
        return false;

    if (!owner || !owner->isAlive())
        return false;

    if (owner->HasUnitState(UNIT_STATE_NOT_MOVE))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    // prevent movement while casting spells with cast time or channel time
	if (owner->HasUnitState(UNIT_STATE_CASTING))
	{
		bool l_GlyphOfWaterElemental = false;
		if (owner->GetOwner() && owner->GetOwner()->HasAura(63090) && owner->GetCharmInfo() && owner->GetCharmInfo()->HasCommandState(COMMAND_FOLLOW) && owner->ToPet() && owner->ToPet()->HasReactState(REACT_HELPER))
			l_GlyphOfWaterElemental = true;
		if (!l_GlyphOfWaterElemental)
		{
			if (!owner->IsStopped())
				owner->StopMoving();
			return true;
		}
	}

    // prevent crash after creature killed pet
    if (static_cast<D*>(this)->_lostTarget(owner))
    {
        D::_clearUnitStateMove(owner);
        return true;
    }

    bool targetMoved = false;
    i_recheckDistance.Update(time_diff);

    if (i_recheckDistance.Passed())
    {
        i_recheckDistance.Reset(100);
        //More distance let have better performance, less distance let have more sensitive reaction at target move.
		float allowed_dist = 0.0f;
		if (i_target->isPet())
			allowed_dist = 2.0f * i_target->GetObjectSize() + owner->GetObjectSize() + MELEE_RANGE - 0.5f;
		else
			allowed_dist = std::min<float>(i_target->GetCombatReach(), 4.0f) * 1.5f;
		G3D::Vector3 dest = owner->movespline->FinalDestination();

		if (owner->movespline->onTransport)
			if (TransportBase* transport = owner->GetDirectTransport())
			{
				float l_O;
				transport->CalculatePassengerPosition(dest.x, dest.y, dest.z, l_O);
			}
		if (m_IsCharge)
		{
			float step = i_startPos.GetExactDist(owner);
			i_passedDistance += step;
			owner->GetPosition(&i_startPos);
			///< Charge can't go further than 25 yards
			if (i_passedDistance >= 25.0f)
			{
				i_targetReached = true;
				static_cast<D*>(this)->_reachTarget(owner);
				if (!owner->IsStopped())
					owner->StopMoving();
				return false;
			}
		}

        ///if (i_target->isMoving() && i_target->GetTypeId() == TYPEID_PLAYER)
        ///{
        ///    float l_MaxDistance = allowed_dist + i_target->GetObjectSize();
        ///
        ///    if (i_target->GetInterpolatedPosition(true, 2000).GetExactDist(dest.x, dest.y, dest.z) > l_MaxDistance)
        ///        targetMoved = true;
        ///    else
        ///        targetMoved = false;
        ///}
        ///else
        {
            // First check distance
            if (owner->GetTypeId() == TYPEID_UNIT && owner->ToCreature()->CanFly())
                targetMoved = !i_target->IsWithinDist3d(dest.x, dest.y, dest.z, allowed_dist);
            else
                targetMoved = !i_target->IsWithinDist2d(dest.x, dest.y, allowed_dist);
        }

        // then, if the target is in range, check also Line of Sight.
        if (!targetMoved)
            targetMoved = !i_target->IsWithinLOSInMap(owner);
    }

    if (i_recalculateTravel || targetMoved)
        _setTargetLocation(owner, targetMoved);

    if (owner->movespline->Finalized())
    {
        static_cast<D*>(this)->MovementInform(owner);
        if (i_angle == 0.0f && !owner->HasInArc(0.01f, i_target.getTarget()))
            owner->SetInFront(i_target.getTarget());

		if (!i_targetReached && !m_IsCharge)
		{
			i_targetReached = true;
			static_cast<D*>(this)->_reachTarget(owner);
		}
		else if (!i_targetReached && m_IsCharge)
		{
			/// If we've reached a target and it's Charge spell, we can stop follow, because we're done
			if (i_target->ToUnit() && owner->GetDistance2d(i_target->ToUnit()) <= MIN_MELEE_REACH)
			{
				i_targetReached = true;
				static_cast<D*>(this)->_reachTarget(owner);
				return false;
			}
			/// If we didn't reach a target, we should continue our way
			else
				_setTargetLocation(owner, targetMoved);
		}
    }

    return true;
}

//-----------------------------------------------//
template<class T>
void ChaseMovementGenerator<T>::_reachTarget(T* owner)
{
    if (owner->IsWithinMeleeRange(this->i_target.getTarget()))
        owner->Attack(this->i_target.getTarget(), true);
}

template<>
void ChaseMovementGenerator<Player>::DoInitialize(Player* owner)
{
    owner->AddUnitState(UNIT_STATE_CHASE | UNIT_STATE_CHASE_MOVE);
    _setTargetLocation(owner, true);
}

template<>
void ChaseMovementGenerator<Creature>::DoInitialize(Creature* owner)
{
    owner->SetWalk(false);
    owner->AddUnitState(UNIT_STATE_CHASE | UNIT_STATE_CHASE_MOVE);
    _setTargetLocation(owner, true);
}

template<class T>
void ChaseMovementGenerator<T>::DoFinalize(T* owner)
{
    owner->ClearUnitState(UNIT_STATE_CHASE | UNIT_STATE_CHASE_MOVE);
}

template<class T>
void ChaseMovementGenerator<T>::DoReset(T* owner)
{
    DoInitialize(owner);
}

template<class T>
void ChaseMovementGenerator<T>::MovementInform(T* /*unit*/) { }

template<>
void ChaseMovementGenerator<Creature>::MovementInform(Creature* unit)
{
    // Pass back the GUIDLow of the target. If it is pet's owner then PetAI will handle
    if (unit->AI())
        unit->AddMovementInform(CHASE_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
}

//-----------------------------------------------//
template<>
bool FollowMovementGenerator<Creature>::EnableWalking() const
{
    return i_target.isValid() && i_target->IsWalking();
}

template<>
bool FollowMovementGenerator<Player>::EnableWalking() const
{
    return false;
}

template<>
void FollowMovementGenerator<Player>::_updateSpeed(Player* /*owner*/)
{
    // nothing to do for Player
}

template<>
void FollowMovementGenerator<Creature>::_updateSpeed(Creature* owner)
{
    // pet only sync speed with owner
    /// Make sure we are not in the process of a map change (IsInWorld)
    if (!owner->isPet() || !owner->IsInWorld() || !i_target.isValid() || i_target->GetGUID() != owner->GetOwnerGUID())
        return;

    owner->UpdateSpeed(MOVE_RUN, true);
    owner->UpdateSpeed(MOVE_WALK, true);
    owner->UpdateSpeed(MOVE_SWIM, true);
}

template<>
void FollowMovementGenerator<Player>::DoInitialize(Player* owner)
{
    owner->AddUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
    _updateSpeed(owner);
    _setTargetLocation(owner, true);
}

template<>
void FollowMovementGenerator<Creature>::DoInitialize(Creature* owner)
{
    owner->AddUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
    _updateSpeed(owner);
    _setTargetLocation(owner, true);
}

template<class T>
void FollowMovementGenerator<T>::DoFinalize(T* owner)
{
    owner->ClearUnitState(UNIT_STATE_FOLLOW | UNIT_STATE_FOLLOW_MOVE);
    _updateSpeed(owner);
}

template<class T>
void FollowMovementGenerator<T>::DoReset(T* owner)
{
    DoInitialize(owner);
}

template<class T>
void FollowMovementGenerator<T>::MovementInform(T* /*unit*/) { }

template<>
void FollowMovementGenerator<Creature>::MovementInform(Creature* unit)
{
    // Pass back the GUIDLow of the target. If it is pet's owner then PetAI will handle
    if (unit->AI())
        unit->AI()->MovementInform(FOLLOW_MOTION_TYPE, i_target.getTarget()->GetGUIDLow());
}

//-----------------------------------------------//
template void TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::_setTargetLocation(Player*, bool);
template void TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::_setTargetLocation(Player*, bool);
template void TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::_setTargetLocation(Creature*, bool);
template void TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::_setTargetLocation(Creature*, bool);
template bool TargetedMovementGeneratorMedium<Player, ChaseMovementGenerator<Player> >::DoUpdate(Player*, uint32);
template bool TargetedMovementGeneratorMedium<Player, FollowMovementGenerator<Player> >::DoUpdate(Player*, uint32);
template bool TargetedMovementGeneratorMedium<Creature, ChaseMovementGenerator<Creature> >::DoUpdate(Creature*, uint32);
template bool TargetedMovementGeneratorMedium<Creature, FollowMovementGenerator<Creature> >::DoUpdate(Creature*, uint32);

template void ChaseMovementGenerator<Player>::_reachTarget(Player*);
template void ChaseMovementGenerator<Creature>::_reachTarget(Creature*);
template void ChaseMovementGenerator<Player>::DoFinalize(Player*);
template void ChaseMovementGenerator<Creature>::DoFinalize(Creature*);
template void ChaseMovementGenerator<Player>::DoReset(Player*);
template void ChaseMovementGenerator<Creature>::DoReset(Creature*);
template void ChaseMovementGenerator<Player>::MovementInform(Player*);

template void FollowMovementGenerator<Player>::DoFinalize(Player*);
template void FollowMovementGenerator<Creature>::DoFinalize(Creature*);
template void FollowMovementGenerator<Player>::DoReset(Player*);
template void FollowMovementGenerator<Creature>::DoReset(Creature*);
template void FollowMovementGenerator<Player>::MovementInform(Player*);
