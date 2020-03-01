////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef HOTFIXDATABASE_H_INCLUDED
# define HOTFIXDATABASE_H_INCLUDED

# include "DatabaseWorkerPool.h"
# include "MySQLConnection.h"

enum HotfixDatabaseStatements
{
    /*  Naming standard for defines:
        {DB}_{SEL/INS/UPD/DEL/REP}_{Summary of data changed}
        When updating more than one field, consider looking at the calling function
        name for a suiting suffix.
    */

    HOTFIX_SEL_ITEM_TEMPLATE_BY_NAME = 1,

    MAX_HOTFIXDATABASE_STATEMENTS
};

class HotfixDatabaseConnection : public MySQLConnection
{
public:
    typedef HotfixDatabaseStatements Statements;

    /// Constructors for sync and async connections
    HotfixDatabaseConnection(MySQLConnectionInfo& p_ConnectionInfo) : MySQLConnection(p_ConnectionInfo) { }
    HotfixDatabaseConnection(ACE_Activation_Queue* p_Queue, MySQLConnectionInfo& p_ConnectionInfo) : MySQLConnection(p_Queue, p_ConnectionInfo) { }

    /// Loads database type specific prepared statements
    void DoPrepareStatements() override;
};

typedef DatabaseWorkerPool<HotfixDatabaseConnection> HotfixDatabaseWorkerPool;

#endif  ///< HOTFIXDATABASE_H_INCLUDED
