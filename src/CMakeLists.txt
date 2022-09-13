# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief
# @version 0.1.0
# @date 2022-09-06
#
# @copyright 2022 Woo Tech

cmake_minimum_required(VERSION 3.16)

# Exported interfaces
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

# the entry of IERX
add_subdirectory(application)
