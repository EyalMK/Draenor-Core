#
#  MILLENIUM-STUDIO
#  Copyright 2016 Millenium-studio SARL
#  All Rights Reserved.
#

#ifndef CROSS
file(GLOB_RECURSE sources_Garrison Draenor/Garrison/*.hpp Draenor/Garrison/*.cpp Draenor/Garrison/*.hxx)
#endif /* not CROSS */
file(GLOB_RECURSE sources_Highmaul Draenor/Highmaul/*.hpp Draenor/Highmaul/*.cpp Draenor/Highmaul/*.hxx)
file(GLOB_RECURSE sources_HellfireCitadel Draenor/HellfireCitadel/*.hpp Draenor/HellfireCitadel/*.cpp Draenor/HellfireCitadel/*.hxx)
file(GLOB_RECURSE sources_ShadowmoonBurialGrounds Draenor/ShadowmoonBurialGrounds/*.hpp Draenor/ShadowmoonBurialGrounds/*.cpp Draenor/ShadowmoonBurialGrounds/*.hxx) 
file(GLOB_RECURSE sources_IronDocks Draenor/IronDocks/*.hpp Draenor/IronDocks/*.cpp Draenor/IronDocks/*.hxx)
file(GLOB_RECURSE sources_Everbloom Draenor/Everbloom/*.hpp Draenor/Everbloom/*.cpp Draenor/Everbloom/*.hxx)
file(GLOB_RECURSE sources_Auchindoun Draenor/Auchindoun/*.hpp Draenor/Auchindoun/*.cpp Draenor/Auchindoun/*.hxx)
file(GLOB_RECURSE sources_Skyreach Draenor/Skyreach/*.hpp Draenor/Skyreach/*.cpp Draenor/Skyreach/*.hxx)
file(GLOB_RECURSE sources_BloodmaulSlagMines Draenor/BloodmaulSlagMines/*.hpp Draenor/BloodmaulSlagMines/*.cpp Draenor/BloodmaulSlagMines/*.hxx)
file(GLOB_RECURSE sources_BlackrockFoundry Draenor/BlackrockFoundry/*.hpp Draenor/BlackrockFoundry/*.cpp Draenor/BlackrockFoundry/*.hxx)
file(GLOB_RECURSE sources_ScenarioFateOfKarabor Draenor/FateOfKaraborScenario/*.hpp Draenor/FateOfKaraborScenario/*.cpp Draenor/FateOfKaraborScenario/*.hxx)
file(GLOB_RECURSE sources_ScenarioBlackTemple Draenor/BlackTempleScenario/*.hpp Draenor/BlackTempleScenario/*.cpp Draenor/BlackTempleScenario/*.hxx)
file(GLOB_RECURSE sources_GrimrailDepot Draenor/GrimrailDepot/*.hpp Draenor/GrimrailDepot/*.cpp Draenor/GrimrailDepot/*.hxx)
file(GLOB_RECURSE sources_TanaanIntro Draenor/Tanaan_jungle/*.hpp Draenor/Tanaan_jungle/*.cpp Draenor/Tanaan_jungle/*.hxx)

set(scripts_STAT_SRCS
  ${scripts_STAT_SRCS}
#ifndef CROSS
  ${sources_Garrison}
#endif /* not CROSS */
  ${sources_Highmaul}
  ${sources_HellfireCitadel}
  ${sources_IronDocks}
  ${sources_Auchindoun}
  ${sources_Skyreach}
  ${sources_Everbloom}
  ${sources_BloodmaulSlagMines}
  ${sources_BlackrockFoundry}
  ${sources_ShadowmoonBurialGrounds}
  ${sources_ScenarioFateOfKarabor}
  ${sources_ScenarioBlackTemple}
  ${sources_GrimrailDepot}
  ${sources_TanaanIntro}
  ${sources_HellfireCitadel}

  Draenor/draenor_shadowmoon_valley.cpp
  Draenor/draenor_shadowmoon_valley.hpp
  Draenor/tanaan_jungle_100.cpp
  Draenor/tanaan_jungle_100.h
  Draenor/frostfire_ridge.cpp
  Draenor/frostfire_ridge.h
  Draenor/spires_of_arak.cpp
  Draenor/spires_of_arak.h
  Draenor/gorgrond.cpp
  Draenor/gorgrond.hpp
  Draenor/item_strongboxes.cpp
  Draenor/talador.cpp
)

message("  -> Prepared: Draenor")
