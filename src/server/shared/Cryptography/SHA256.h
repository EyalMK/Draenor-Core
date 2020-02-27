////////////////////////////////////////////////////////////////////////////////
//
//  MILLENIUM-STUDIO
//  Copyright 2016 Millenium-studio SARL
//  All Rights Reserved.
//
////////////////////////////////////////////////////////////////////////////////

#ifndef _AUTH_SHA256_H
#define _AUTH_SHA256_H

#include "Define.h"
#include <string>
#include <openssl/sha.h>

class BigNumber;

class SHA256Hash
{
    public:
        SHA256Hash();
        ~SHA256Hash();

        void UpdateBigNumbers(BigNumber* bn0, ...);

        void UpdateData(const uint8 *dta, int len);
        void UpdateData(const std::string &str);

        void Initialize();
        void Finalize();

        uint8 *GetDigest(void) { return mDigest; };
        int GetLength(void) const { return SHA256_DIGEST_LENGTH; };

    private:
        SHA256_CTX mC;
        uint8 mDigest[SHA256_DIGEST_LENGTH];
};
#endif

