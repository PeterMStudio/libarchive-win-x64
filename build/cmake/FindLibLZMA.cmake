# - Find LibLZMA
# Find the LibLZMA include directory and library
#
#  LibLZMA_INCLUDE_DIR    - where to find lzma.h, etc.
#  LibLZMA_LIBRARIES      - List of libraries when using LibLZMA.
#  LibLZMA_FOUND          - True if LibLZMA found.


message(STATUS "Looking for LibLZMA")

set(LibLZMA_SEARCH_PATH ${CMAKE_CURRENT_LIST_DIR}/../depends/lzma)

IF (LibLZMA_INCLUDE_DIR)
    # Already in cache, be silent
    SET(LibLZMA_FIND_QUIETLY TRUE)
ENDIF (LibLZMA_INCLUDE_DIR)

FIND_PATH(LIBLZMA_INCLUDE_DIRS lzma.h PATHS ${LibLZMA_SEARCH_PATH}/include)


if(LIBLZMA_USE_STATIC_LIBS)
    # Look for the static library liblzmastatic.lib
    FIND_LIBRARY(LIBLZMA_LIBRARIES NAMES liblzmastatic PATHS ${LibLZMA_SEARCH_PATH}/lib)
else()
    # Look for the dynamic library liblzma.lib
    FIND_LIBRARY(LIBLZMA_LIBRARIES NAMES liblzma PATHS ${LibLZMA_SEARCH_PATH}/lib)
endif()


# handle the QUIETLY and REQUIRED arguments and set LibLZMA_FOUND to TRUE if
# all listed variables are TRUE
INCLUDE(FindPackageHandleStandardArgs)

IF (LIBLZMA_LIBRARIES)
    SET(LibLZMA_FOUND TRUE)
ENDIF()

FIND_PACKAGE_HANDLE_STANDARD_ARGS(LibLZMA DEFAULT_MSG LIBLZMA_LIBRARIES LIBLZMA_INCLUDE_DIRS)


