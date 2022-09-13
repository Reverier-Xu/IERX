# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief
# @version 0.1.0
# @date 2022-09-08
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

set(
    IERX_WORKSPACE_SRCS
    project.cxx
)

set(
    IERX_WORKSPACE_HEADERS
    project.h
)

ierx_add_library(
    IERXWorkspace
    SOURCES
    ${IERX_WORKSPACE_SRCS}
    HEADERS
    ${IERX_WORKSPACE_HEADERS}
)

target_link_libraries(IERXWorkspace PRIVATE ${QT_LIBRARIES})
