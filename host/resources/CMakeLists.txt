# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief ui design and i18n translations for the project
# @version 0.1.0
# @date 2022-09-06
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

set(
    RESOURCES
    icons.qrc
)

ierx_add_library(
    IERXResources
    SOURCES
    ${RESOURCES}
)

target_link_libraries(IERXResources PRIVATE ${QT_LIBRARIES})
