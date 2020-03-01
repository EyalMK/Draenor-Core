////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////
#ifndef __BATTLEGROUNDAA_H
#define __BATTLEGROUNDAA_H

class Battleground;

class BattlegroundAAScore : public BattlegroundScore
{
    public:
        BattlegroundAAScore() {};
        virtual ~BattlegroundAAScore() {};
        //TODO fix me
};

class BattlegroundAA : public Battleground
{
    public:
        BattlegroundAA();
        ~BattlegroundAA();

        /* inherited from BattlegroundClass */
        virtual void AddPlayer(Player* player);
        virtual void StartingEventCloseDoors();
        virtual void StartingEventOpenDoors();

        void RemovePlayer(Player* player, uint64 guid, uint32 team);
        void HandleAreaTrigger(Player* Source, uint32 Trigger);
        bool SetupBattleground();
        void HandleKillPlayer(Player* player, Player* killer);
};
#endif
