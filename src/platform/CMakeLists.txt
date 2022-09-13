# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief
# @version 0.1.0
# @date 2022-09-06
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

set(
    RESOURCES
    platform.qrc
)

set(
    IERX_PLATFORM_SRCS
    platform.cxx
)

set(
    IERX_PLATFORM_HEADERS
    platform.h
)

ierx_add_library(
    IERXPlatform
    SOURCES
    ${IERX_PLATFORM_SRCS}
    ${RESOURCES}
    HEADERS
    ${IERX_PLATFORM_HEADERS}
)

target_link_libraries(IERXPlatform PRIVATE ${QT_LIBRARIES} IERX::Resources IERX::Components IERX::Workspace)
