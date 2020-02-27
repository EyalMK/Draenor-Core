# find Readline (terminal input library) includes and library
#
# READLINE_INCLUDE_DIR - where the directory containing the READLINE headers can be found
# READLINE_LIBRARY     - full path to the READLINE library
# READLINE_FOUND       - TRUE if READLINE was found

FIND_PATH(ZLIB_INCLUDE_DIR zlib.h)
FIND_LIBRARY(ZLIB_LIBRARIES NAMES z PATHS
    /usr/lib
    /usr/lib/x86_64-linux-gnu
)

IF (ZLIB_INCLUDE_DIR AND ZLIB_LIBRARIES)
    SET(ZLIB_FOUND TRUE)
    MESSAGE(STATUS "Found ZLIB library: ${ZLIB_LIBRARIES}")
    MESSAGE(STATUS "Include dir is: ${ZLIB_INCLUDE_DIR}")
    INCLUDE_DIRECTORIES(${ZLIB_INCLUDE_DIR})
ELSE (ZLIB_INCLUDE_DIR AND ZLIB_LIBRARIES)
    SET(ZLIB_FOUND FALSE)
    MESSAGE(FATAL_ERROR "** ZLIB library not found!\n** Your distro may provide a binary for ZLIB e.g. for ubuntu try apt-get install zlib1g-dev")
ENDIF (ZLIB_INCLUDE_DIR AND ZLIB_LIBRARIES)

