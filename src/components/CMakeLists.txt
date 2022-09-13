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
    components.qrc
)

set(
    IERX_COMPONENTS_SRCS
    editor.cxx
)

set(
    IERX_COMPONENTS_HEADERS
    editor.h
)

ierx_add_library(
    IERXComponents
    SOURCES
    ${IERX_COMPONENTS_SRCS}
    ${RESOURCES}
    HEADERS
    ${IERX_COMPONENTS_HEADERS}
)

target_link_libraries(IERXComponents PRIVATE ${QT_LIBRARIES} IERX::Resources)
