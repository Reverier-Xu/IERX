# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief
# @version 0.1.0
# @date 2022-09-11
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

set(
        IERX_INTERFACES_SRCS
)

set(
        IERX_INTERFACES_HEADERS
)

ierx_add_library(
        IERXInterfaces
        SOURCES
        ${IERX_INTERFACES_SRCS}
        HEADERS
        ${IERX_INTERFACES_HEADERS}
)

target_link_libraries(IERXInterfaces PRIVATE ${QT_LIBRARIES})
