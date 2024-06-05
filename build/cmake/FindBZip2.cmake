# - Find BZip2
# Find the BZip2 include directory and library
#
#  BZIP2_INCLUDE_DIR    - where to find bzlib.h, etc.
#  BZIP2_LIBRARIES      - List of libraries when using BZip2.
#  BZIP2_FOUND          - True if BZip2 found.


message(STATUS "Looking for BZip2")

set(BZIP2_SEARCH_PATH ${CMAKE_CURRENT_LIST_DIR}/../depends/bzip2)

IF (BZIP2_INCLUDE_DIR)
    # Already in cache, be silent
    SET(BZIP2_FIND_QUIETLY TRUE)
ENDIF (BZIP2_INCLUDE_DIR)

FIND_PATH(BZIP2_INCLUDE_DIR bzlib.h PATHS ${BZIP2_SEARCH_PATH}/include)
FIND_LIBRARY(BZIP2_LIBRARY NAMES bz2 libbz2 PATHS ${BZIP2_SEARCH_PATH}/lib)

# handle the QUIETLY and REQUIRED arguments and set BZIP2_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(BZip2 DEFAULT_MSG BZIP2_LIBRARY BZIP2_INCLUDE_DIR)

IF(BZIP2_FOUND)
    SET(BZIP2_LIBRARIES ${BZIP2_LIBRARY})
ENDIF(BZIP2_FOUND)

