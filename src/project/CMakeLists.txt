# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief
# @version 0.1.0
# @date 2022-09-08
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

set(
        IERX_PROJECT_SRCS
        project.cxx
)

set(
        IERX_PROJECT_HEADERS
        project.h
)

ierx_add_library(
        IERXProject
        SOURCES
        ${IERX_PROJECT_SRCS}
        HEADERS
        ${IERX_PROJECT_HEADERS}
)

target_link_libraries(IERXProject PRIVATE ${QT_LIBRARIES})
