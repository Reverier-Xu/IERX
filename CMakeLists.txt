# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief CMakeLists.txt for the project
# @version 0.1.0
# @date 2022-09-06
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

message("====================================================================")
message("*       Interactive Explorer of Reverse-engineering X (IERX)       *")
message("*       ----------------------------------------------------       *")
message("*        Copyright (C) 2022 Woo Tech. All rights reserved.         *")
message("====================================================================")

set(VERSION_MAJOR 0)
set(VERSION_MINOR 1)
set(VERSION_PATCH 0)

execute_process(
    COMMAND git describe --always --dirty
    WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
    OUTPUT_VARIABLE GIT_VERSION
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

message(STATUS "Current build version: ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}.g${GIT_VERSION}\n")

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
    DESCRIPTION "Interactive Explorer for Reverse-engineering X"
    VERSION ${VERSION_MAJOR}.${VERSION_MINOR}.${VERSION_PATCH}
    LANGUAGES C CXX
)

set(CMAKE_CXX_STANDARD 17)
set(CXX_EXTENSIONS OFF)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_MAKE_PROGRAM ninja)

# Project Binary Version
set(IERX_BINARY_VERSION ${VERSION_MAJOR}${VERSION_MINOR})

# plugin version as used e.g. in plugin installation path
set(IERX_PLUGIN_VERSION ${VERSION_MAJOR}${VERSION_MINOR})

find_package(Qt6 6.4 REQUIRED COMPONENTS Core Widgets Network Qml Quick Concurrent Sql QuickControls2 Multimedia)
set(QT_LIBRARIES Qt::Core Qt::Widgets Qt::Network Qt::Quick Qt::Qml Qt::Concurrent Qt::Sql Qt::QuickControls2 Qt::Multimedia)

qt_standard_project_setup()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

# IERX Host
add_subdirectory(src)

feature_summary(WHAT ALL INCLUDE_QUIET_PACKAGES FATAL_ON_MISSING_REQUIRED_PACKAGES)
