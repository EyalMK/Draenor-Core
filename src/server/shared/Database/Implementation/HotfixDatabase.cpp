////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#include "HotfixDatabase.h"

void HotfixDatabaseConnection::DoPrepareStatements()
{
    if (!m_reconnecting)
        m_stmts.resize(MAX_HOTFIXDATABASE_STATEMENTS);

    PREPARE_STATEMENT(HOTFIX_SEL_ITEM_TEMPLATE_BY_NAME, "SELECT ID FROM item_sparse WHERE Name = ?", CONNECTION_SYNCH);
}
