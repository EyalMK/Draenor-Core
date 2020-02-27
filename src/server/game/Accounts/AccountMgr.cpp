////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#include "AccountMgr.h"
#include "DatabaseEnv.h"
#include "ObjectAccessor.h"
#include "Player.h"
#include "Util.h"
#include "SHA1.h"
#include "SHA256.h"
#include "SRP6a.h"

namespace AccountMgr
{
    std::string SRP6aGenerateSalt32()
    {
        uint8 salt[32];

        for (int i = 0; i < 32; i++)
            salt[i] = urand(0, 255);

        return ByteArrayToHexStr(salt, 32);
    }

    std::string SRP6aCalculatePasswordVerifier(const std::string& email, const std::string& password, const std::string& salt)
    {
        SHA256Hash shaIdentitySalt;
        shaIdentitySalt.Initialize();
        shaIdentitySalt.UpdateData(email);
        shaIdentitySalt.Finalize();

        std::string identitySalt = ByteArrayToHexStr(shaIdentitySalt.GetDigest(), shaIdentitySalt.GetLength());

        SHA256Hash shaPBytes;
        shaPBytes.Initialize();
        shaPBytes.UpdateData(identitySalt);
        shaPBytes.UpdateData(":");
        shaPBytes.UpdateData(password);
        shaPBytes.Finalize();

        uint8_t saltBytes[32];
        for (int i = 0; i < 32; i++)
            saltBytes[i] = std::stoi(salt.substr(i * 2, 2), nullptr, 16);

        SHA256Hash shaX;
        shaX.Initialize();
        shaX.UpdateData(saltBytes, 32);
        shaX.UpdateData(shaPBytes.GetDigest(), shaPBytes.GetLength());
        shaX.Finalize();

        BigNumber G;
        G.SetBinary(BNet2::SRP6a_G, sizeof(BNet2::SRP6a_G));
        BigNumber N;
        N.SetBinary(BNet2::SRP6a_N, sizeof(BNet2::SRP6a_N));
        BigNumber X;
        X.SetBinary(shaX.GetDigest(), shaX.GetLength());
        BigNumber res = G.ModExp(X, N);
        std::string temp = ByteArrayToHexStr(X.AsByteArray(), 32);

        return ByteArrayToHexStr(res.AsByteArray(), res.GetNumBytes());
    }

#ifndef CROSS
    AccountOpResult CreateAccount(std::string username, std::string password)
    {
        if (utf8length(username) > MAX_ACCOUNT_STR)
            return AOR_NAME_TOO_LONG;                           // Username's too long

        if (utf8length(password) > MAX_PASSWORD_LENGTH)
            return AOR_PASS_TOO_LONG;

        normalizeString(username);
        normalizeString(password);

        if (GetId(username))
            return AOR_NAME_ALREDY_EXIST;                       // Username does already exist

        // SRP6aCalculatePasswordVerifier requires a lowercase email
        normalizeString(username, false);

        std::string salt = SRP6aGenerateSalt32();
        std::string passwordVerifier = SRP6aCalculatePasswordVerifier(username, password, salt);

        // everything else requires an uppercase email
        normalizeString(username, true);

        PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_INS_ACCOUNT);

        stmt->setString(0, username);
        stmt->setString(1, CalculateShaPassHash(username, password));
        stmt->setString(2, passwordVerifier);
        stmt->setString(3, salt);

        LoginDatabase.Execute(stmt);

        stmt = LoginDatabase.GetPreparedStatement(LOGIN_INS_REALM_CHARACTERS_INIT);

        LoginDatabase.Execute(stmt);

        return AOR_OK;                                          // Everything's fine
    }

    AccountOpResult DeleteAccount(uint32 accountId)
    {
        // Check if accounts exists
        PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_ACCOUNT_BY_ID);
        stmt->setUInt32(0, accountId);
        PreparedQueryResult result = LoginDatabase.Query(stmt);

        if (!result)
            return AOR_NAME_NOT_EXIST;

        // Obtain accounts characters
        stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_CHARS_BY_ACCOUNT_ID);

        stmt->setUInt32(0, accountId);

        result = CharacterDatabase.Query(stmt);

        if (result)
        {
            do
            {
                uint32 guidLow = (*result)[0].GetUInt32();
                uint64 guid = MAKE_NEW_GUID(guidLow, 0, HIGHGUID_PLAYER);

                // Kick if player is online
                if (Player* p = ObjectAccessor::FindPlayer(guid))
                {
                    WorldSession* s = p->GetSession();
                    s->KickPlayer();                                // Mark session to remove at next session list update
                    s->LogoutPlayer(false);                         // Logout player without waiting next session list update
                }

                Player::DeleteFromDB(guid, accountId, false);       // No need to update realm characters
            }
            while (result->NextRow());
        }

        // Table realm specific but common for all characters of account for realm
        stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_TUTORIALS);
        stmt->setUInt32(0, accountId);
        CharacterDatabase.Execute(stmt);

        stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_ACCOUNT_DATA);
        stmt->setUInt32(0, accountId);
        CharacterDatabase.Execute(stmt);

        stmt = CharacterDatabase.GetPreparedStatement(CHAR_DEL_CHARACTER_BAN);
        stmt->setUInt32(0, accountId);
        CharacterDatabase.Execute(stmt);

        SQLTransaction trans = LoginDatabase.BeginTransaction();

        stmt = LoginDatabase.GetPreparedStatement(LOGIN_DEL_ACCOUNT);
        stmt->setUInt32(0, accountId);
        trans->Append(stmt);

        stmt = LoginDatabase.GetPreparedStatement(LOGIN_DEL_ACCOUNT_ACCESS);
        stmt->setUInt32(0, accountId);
        trans->Append(stmt);

        stmt = LoginDatabase.GetPreparedStatement(LOGIN_DEL_REALM_CHARACTERS);
        stmt->setUInt32(0, accountId);
        trans->Append(stmt);

        stmt = LoginDatabase.GetPreparedStatement(LOGIN_DEL_ACCOUNT_BANNED);
        stmt->setUInt32(0, accountId);
        trans->Append(stmt);

        LoginDatabase.CommitTransaction(trans);

        return AOR_OK;
    }

    AccountOpResult ChangeUsername(uint32 accountId, std::string newUsername, std::string newPassword)
    {
        // Check if accounts exists
        PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_ACCOUNT_BY_ID);
        stmt->setUInt32(0, accountId);
        PreparedQueryResult result = LoginDatabase.Query(stmt);

        if (!result)
            return AOR_NAME_NOT_EXIST;

        if (utf8length(newUsername) > MAX_ACCOUNT_STR)
            return AOR_NAME_TOO_LONG;

        if (utf8length(newPassword) > MAX_PASSWORD_LENGTH)
            return AOR_PASS_TOO_LONG;

        // SRP6aCalculatePasswordVerifier requires a lowercase email
        normalizeString(newUsername, false);
        normalizeString(newPassword);

        std::string salt = SRP6aGenerateSalt32();
        std::string passwordVerifier = SRP6aCalculatePasswordVerifier(newUsername, newPassword, salt);

        // everything else requires an uppercase email
        normalizeString(newUsername, true);

        stmt = LoginDatabase.GetPreparedStatement(LOGIN_UPD_USERNAME);

        stmt->setString(0, newUsername);
        stmt->setString(1, CalculateShaPassHash(newUsername, newPassword));
        stmt->setString(2, passwordVerifier);
        stmt->setString(3, salt);
        stmt->setUInt32(4, accountId);

        LoginDatabase.Execute(stmt);

        return AOR_OK;
    }

    AccountOpResult ChangePassword(uint32 accountId, std::string newPassword)
    {
        std::string username;

        if (!GetName(accountId, username))
            return AOR_NAME_NOT_EXIST;                          // Account doesn't exist

        if (utf8length(newPassword) > MAX_PASSWORD_LENGTH)
            return AOR_PASS_TOO_LONG;

        // SRP6aCalculatePasswordVerifier requires a lowercase email
        normalizeString(username, false);
        normalizeString(newPassword);

        std::string salt = SRP6aGenerateSalt32();
        std::string passwordVerifier = SRP6aCalculatePasswordVerifier(username, newPassword, salt);

        // everything else requires an uppercase email
        normalizeString(username, true);

        PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_UPD_PASSWORD);

        stmt->setString(0, CalculateShaPassHash(username, newPassword));
        stmt->setString(1, passwordVerifier);
        stmt->setString(2, salt);
        stmt->setUInt32(3, accountId);

        LoginDatabase.Execute(stmt);

        return AOR_OK;
    }
#endif

    uint32 GetId(std::string username)
    {
        PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_GET_ACCOUNT_ID_BY_USERNAME);
        stmt->setString(0, username);
        PreparedQueryResult result = LoginDatabase.Query(stmt);

        return (result) ? (*result)[0].GetUInt32() : 0;
    }

    uint32 GetSecurity(uint32 accountId)
    {
        PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_GET_ACCOUNT_ACCESS_GMLEVEL);
        stmt->setUInt32(0, accountId);
        PreparedQueryResult result = LoginDatabase.Query(stmt);

        return (result) ? (*result)[0].GetUInt8() : uint32(SEC_PLAYER);
    }

    uint32 GetSecurity(uint32 accountId, int32 realmId)
    {
        PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_GET_GMLEVEL_BY_REALMID);
        stmt->setUInt32(0, accountId);
        stmt->setInt32(1, realmId);
        PreparedQueryResult result = LoginDatabase.Query(stmt);

        return (result) ? (*result)[0].GetUInt8() : uint32(SEC_PLAYER);
    }

    bool GetName(uint32 accountId, std::string& name)
    {
        PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_GET_USERNAME_BY_ID);
        stmt->setUInt32(0, accountId);
        PreparedQueryResult result = LoginDatabase.Query(stmt);

        if (result)
        {
            name = (*result)[0].GetString();
            return true;
        }

        return false;
    }

    bool CheckPassword(uint32 accountId, std::string password)
    {
        std::string username;

        if (!GetName(accountId, username))
            return false;

        normalizeString(username);
        normalizeString(password);

        PreparedStatement* stmt = LoginDatabase.GetPreparedStatement(LOGIN_SEL_CHECK_PASSWORD);
        stmt->setUInt32(0, accountId);
        stmt->setString(1, CalculateShaPassHash(username, password));
        PreparedQueryResult result = LoginDatabase.Query(stmt);

        return (result) ? true : false;
    }

#ifndef CROSS
    uint32 GetCharactersCount(uint32 accountId)
    {
        // Check character count
        PreparedStatement* stmt = CharacterDatabase.GetPreparedStatement(CHAR_SEL_SUM_CHARS);
        stmt->setUInt32(0, accountId);
        PreparedQueryResult result = CharacterDatabase.Query(stmt);

        return (result) ? (*result)[0].GetUInt64() : 0;
    }
#endif

    bool normalizeString(std::string& utf8String, bool upper /* = true */)
    {
        wchar_t buffer[MAX_ACCOUNT_STR + 1];

        size_t maxLength = MAX_ACCOUNT_STR;
        if (!Utf8toWStr(utf8String, buffer, maxLength))
            return false;
#ifdef _MSC_VER
#pragma warning(disable: 4996)
#endif
        std::transform(&buffer[0], buffer+maxLength, &buffer[0], upper ? wcharToUpperOnlyLatin : wcharToLowerOnlyLatin);
#ifdef _MSC_VER
#pragma warning(default: 4996)
#endif

        return WStrToUtf8(buffer, maxLength, utf8String);
    }

    std::string CalculateShaPassHash(std::string& name, std::string& password)
    {
        SHA1Hash sha;
        sha.Initialize();
        sha.UpdateData(name);
        sha.UpdateData(":");
        sha.UpdateData(password);
        sha.Finalize();

        return ByteArrayToHexStr(sha.GetDigest(), sha.GetLength());
    }

    bool IsPlayerAccount(uint32 gmlevel)
    {
        return gmlevel == SEC_PLAYER;
    }

    bool IsModeratorAccount(uint32 gmlevel)
    {
        return gmlevel >= SEC_MODERATOR && gmlevel <= SEC_CONSOLE;
    }

    bool IsGMAccount(uint32 gmlevel)
    {
        return gmlevel >= SEC_GAMEMASTER && gmlevel <= SEC_CONSOLE;
    }

    bool IsAdminAccount(uint32 gmlevel)
    {
        return gmlevel >= SEC_ADMINISTRATOR && gmlevel <= SEC_CONSOLE;
    }

    bool IsConsoleAccount(uint32 gmlevel)
    {
        return gmlevel == SEC_CONSOLE;
    }

} // Namespace AccountMgr
