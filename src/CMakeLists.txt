# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief the src platform for the project
# @version 0.1.0
# @date 2022-09-06
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

# global utilities
add_subdirectory(utilities)

# models and interface definitions
add_subdirectory(interfaces)

# designs, translations and ui resources
add_subdirectory(resources)

# workspace and project things
add_subdirectory(workspace)

# reusable ui components
add_subdirectory(components)

# application launcher
add_subdirectory(launcher)

# IERX platform
add_subdirectory(platform)

# Explorer part
add_subdirectory(explorer)

# Forensics part
add_subdirectory(forensics)

# binary reverse-engineering part
add_subdirectory(reversing)

# notebook part
add_subdirectory(notebook)

# the entry of IERX
add_subdirectory(application)
