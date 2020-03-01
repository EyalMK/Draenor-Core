////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef _GROUPREFERENCE_H
#define _GROUPREFERENCE_H

#include "LinkedReference/Reference.h"

class Group;
class Player;

class GroupReference : public Reference<Group, Player>
{
    protected:
        uint8 iSubGroup;
        void targetObjectBuildLink();
        void targetObjectDestroyLink();
        void sourceObjectDestroyLink();
    public:
        GroupReference() : Reference<Group, Player>(), iSubGroup(0) {}
        ~GroupReference() { unlink(); }
        GroupReference* next() { return (GroupReference*)Reference<Group, Player>::next(); }
        GroupReference const* next() const { return (GroupReference const*)Reference<Group, Player>::next(); }
        uint8 getSubGroup() const { return iSubGroup; }
        void setSubGroup(uint8 pSubGroup) { iSubGroup = pSubGroup; }
};
#endif

