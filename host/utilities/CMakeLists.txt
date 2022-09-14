# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief the host platform for the project
# @version 0.1.0
# @date 2022-09-14
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

set(
    IERX_UTILITIES_SRCS
    systeminfo.cxx
)

set(
    IERX_UTILITIES_HEADERS
    systeminfo.h
)

ierx_add_library(
    IERXUtilities
    SOURCES
    ${IERX_UTILITIES_SRCS}
    HEADERS
    ${IERX_UTILITIES_HEADERS}
)

target_link_libraries(IERXUtilities PRIVATE ${QT_LIBRARIES})
