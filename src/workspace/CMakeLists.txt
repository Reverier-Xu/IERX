# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief workspace and storage support for project
# @version 0.1.0
# @date 2022-09-08
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

set(
    IERX_WORKSPACE_SRCS
    workspace.cxx
    project.cxx
    tasks.cxx
)

set(
    IERX_WORKSPACE_HEADERS
    workspace.h
    project.h
    tasks.h
)

ierx_add_library(
    IERXWorkspace
    SOURCES
    ${IERX_WORKSPACE_SRCS}
    HEADERS
    ${IERX_WORKSPACE_HEADERS}
)

target_link_libraries(IERXWorkspace PRIVATE ${QT_LIBRARIES})
