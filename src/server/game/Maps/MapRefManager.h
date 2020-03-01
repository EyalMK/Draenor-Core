////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef _MAPREFMANAGER
#define _MAPREFMANAGER

#include "RefManager.h"

class MapReference;

class MapRefManager : public RefManager<Map, Player>
{
    public:
        typedef LinkedListHead::Iterator< MapReference > iterator;
        typedef LinkedListHead::Iterator< MapReference const > const_iterator;

        MapReference* getFirst() { return (MapReference*)RefManager<Map, Player>::getFirst(); }
        MapReference const* getFirst() const { return (MapReference const*)RefManager<Map, Player>::getFirst(); }
        MapReference* getLast() { return (MapReference*)RefManager<Map, Player>::getLast(); }
        MapReference const* getLast() const { return (MapReference const*)RefManager<Map, Player>::getLast(); }

        iterator begin() { return iterator(getFirst()); }
        iterator end() { return iterator(NULL); }
        iterator rbegin() { return iterator(getLast()); }
        iterator rend() { return iterator(NULL); }
        const_iterator begin() const { return const_iterator(getFirst()); }
        const_iterator end() const  { return const_iterator(NULL); }
};
#endif

