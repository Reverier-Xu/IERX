cmake_minimum_required(VERSION 3.16)

set(VERSION_MAJOR 0)
set(VERSION_MINOR 1)
set(VERSION_PATCH 0)

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
set(FORENSICCAT_BINARY_VERSION ${VERSION_MAJOR}${VERSION_MINOR})

# plugin version as used e.g. in plugin installation path
set(FORENSICCAT_PLUGIN_VERSION ${VERSION_MAJOR}${VERSION_MINOR})

find_package(Qt6 6.3 REQUIRED COMPONENTS Core Network Qml Quick)
qt_standard_project_setup()

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)

add_subdirectory(src)
