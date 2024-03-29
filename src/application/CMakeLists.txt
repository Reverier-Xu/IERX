# @file CMakeLists.txt
# @author Reverier-Xu (reverier.xu[at]woooo.tech)
# @brief the entry of src application
# @version 0.1.0
# @date 2022-09-06
#
# @copyright 2022 Woo Tech


cmake_minimum_required(VERSION 3.16)

set(
    IERX_APP_SRCS
    entry.cxx
    application.cxx
    application.h
)

add_executable(${PROJECT_NAME} ${IERX_APP_SRCS})

target_link_libraries(${PROJECT_NAME} PRIVATE ${QT_LIBRARIES} IERX::Resources IERX::Launcher IERX::Platform)

set_target_properties(
    ${PROJECT_NAME}
    PROPERTIES
    ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
    LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
    RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin
)

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin)
