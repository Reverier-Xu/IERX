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
    launcher.qrc
)

set(
    IERX_LAUNCHER_SRCS
    launcher.cxx
)

set(
    IERX_LAUNCHER_HEADERS
    launcher.h
)

ierx_add_library(
    IERXLauncher
    SOURCES
    ${IERX_LAUNCHER_SRCS}
    ${RESOURCES}
    HEADERS
    ${IERX_LAUNCHER_HEADERS}
)

target_link_libraries(IERXLauncher PRIVATE ${QT_LIBRARIES} IERX::Resources)
