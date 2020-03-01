////////////////////////////////////////////////////////////////////////////////
//
// Project-Hellscream https://hellscream.org
// Copyright (C) 2018-2020 Project-Hellscream-6.2
// Discord https://discord.gg/CWCF3C9
//
////////////////////////////////////////////////////////////////////////////////

#ifndef SHARED_PTRS_H
# define SHARED_PTRS_H

class Aura;
class UnitAura;
class AuraEffect;

# define CAST(x,y) std::dynamic_pointer_cast<x>(y)
# define CONST_CAST(x, y) std::const_pointer_cast<const x>(y)

# define TO_UNITAURA(y) CAST(UnitAura,y)

#endif /* !SHARED_PTRS_H */
