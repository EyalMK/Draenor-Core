////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef TRINITY_MOVEMENTGENERATOR_H
#define TRINITY_MOVEMENTGENERATOR_H

#include "Define.h"
#include "ObjectRegistry.h"
#include "FactoryHolder.h"
#include "Common.h"
#include "MotionMaster.h"

class Unit;

class MovementGenerator
{
    public:
        virtual ~MovementGenerator();

        virtual void Initialize(Unit*) = 0;
        virtual void Finalize(Unit*) = 0;

        virtual void Reset(Unit*) = 0;

        virtual bool Update(Unit*, uint32 time_diff) = 0;

        virtual MovementGeneratorType GetMovementGeneratorType() const = 0;

        virtual void unitSpeedChanged() { }

        // used by Evade code for select point to evade with expected restart default movement
        virtual bool GetResetPosition(Unit*, float& /*x*/, float& /*y*/, float& /*z*/) { return false; }
};

template<class T, class D>
class MovementGeneratorMedium : public MovementGenerator
{
    public:
        void Initialize(Unit* u) override
        {
            //u->AssertIsType<T>();
            (static_cast<D*>(this))->DoInitialize(static_cast<T*>(u));
        }

        void Finalize(Unit* u) override
        {
            //u->AssertIsType<T>();
            (static_cast<D*>(this))->DoFinalize(static_cast<T*>(u));
        }

        void Reset(Unit* u) override
        {
            //u->AssertIsType<T>();
            (static_cast<D*>(this))->DoReset(static_cast<T*>(u));
        }

        bool Update(Unit* u, uint32 time_diff) override
        {
            //u->AssertIsType<T>();
            return (static_cast<D*>(this))->DoUpdate(static_cast<T*>(u), time_diff);
        }
};

struct SelectableMovement : public FactoryHolder<MovementGenerator, MovementGeneratorType>
{
    SelectableMovement(MovementGeneratorType mgt) : FactoryHolder<MovementGenerator, MovementGeneratorType>(mgt) { }
};

template<class REAL_MOVEMENT>
struct MovementGeneratorFactory : public SelectableMovement
{
    MovementGeneratorFactory(MovementGeneratorType mgt) : SelectableMovement(mgt) { }

    MovementGenerator* Create(void *) const override;
};

typedef FactoryHolder<MovementGenerator, MovementGeneratorType> MovementGeneratorCreator;
typedef FactoryHolder<MovementGenerator, MovementGeneratorType>::FactoryHolderRegistry MovementGeneratorRegistry;
#endif
