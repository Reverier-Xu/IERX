# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief
# @version 0.1.0
# @date 2022-09-06
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

set(VERSION_MAJOR 0)
set(VERSION_MINOR 1)
set(VERSION_PATCH 0)

list(
    APPEND CMAKE_MODULE_PATH
    ${CMAKE_SOURCE_DIR}/cmake
)

include(GenerateExportHeader)
include(CMakePackageConfigHelpers)
include(FeatureSummary)
include(WriteBasicConfigVersionFile)
include(CheckFunctionExists)
include(IERXMacros)

project(
    IERX
    DESCRIPTION "Interactive Explorer for Reversing X"
    VERSION ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}
    LANGUAGES C CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Project Binary Version
set(IERX_BINARY_VERSION ${VERSION_MAJOR}${VERSION_MINOR})

# plugin version as used e.g. in plugin installation path
set(IERX_PLUGIN_VERSION ${VERSION_MAJOR}${VERSION_MINOR})

find_package(Qt6 6.3 REQUIRED COMPONENTS Core Widgets Network Qml Quick Concurrent WebEngineWidgets Sql)
set(QT_LIBRARIES Qt6::Core Qt6::Widgets Qt6::Network Qt6::Quick Qt6::Qml Qt6::Concurrent Qt6::WebEngineWidgets Qt6::Sql)

if (APPLE)
    find_package(Qt6 REQUIRED COMPONENTS MacExtras)
    list(APPEND QT_LIBRARIES Qt6::MacExtras)
elseif (WIN32)
    find_package(Qt6 REQUIRED COMPONENTS WinExtras)
    list(APPEND QT_LIBRARIES Qt6::WinExtras)
else ()
    find_package(Qt6 REQUIRED COMPONENTS DBus)
    list(APPEND QT_LIBRARIES Qt6::DBus)
    get_target_property(QT_DBUSXML2CPP_EXECUTABLE Qt6::qdbusxml2cpp LOCATION)
endif ()

qt_standard_project_setup()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_subdirectory(src)
