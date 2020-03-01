# find Readline (terminal input library) includes and library
#
# READLINE_INCLUDE_DIR - where the directory containing the READLINE headers can be found
# READLINE_LIBRARY     - full path to the READLINE library
# READLINE_FOUND       - TRUE if READLINE was found

FIND_PATH(BZIP2_INCLUDE_DIR bzlib.h)
FIND_LIBRARY(BZIP2_LIBRARIES NAMES bz2 PATHS
    /usr/lib
    /usr/lib/x86_64-linux-gnu
)

IF (BZIP2_INCLUDE_DIR AND BZIP2_LIBRARIES)
    SET(BZIP2_FOUND TRUE)
    MESSAGE(STATUS "Found BZip2 library: ${BZIP2_LIBRARIES}")
    MESSAGE(STATUS "Include dir is: ${BZIP2_INCLUDE_DIR}")
    INCLUDE_DIRECTORIES(${BZIP2_INCLUDE_DIR})
ELSE (BZIP2_INCLUDE_DIR AND BZIP2_LIBRARIES)
    SET(BZIP2_FOUND FALSE)
    MESSAGE(FATAL_ERROR "** BZip2 library not found!\n** Your distro may provide a binary for BZip2 e.g. for ubuntu try apt-get install libbz2-dev")
ENDIF (BZIP2_INCLUDE_DIR AND BZIP2_LIBRARIES)
