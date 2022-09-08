cmake_minimum_required(VERSION 3.16)

# ierx_add_library(<target> SOURCES <source1> [<source2> [...]])
function(ierx_add_library target)
    set(options)
    set(oneValueArgs)
    set(multiValueArgs SOURCES HEADERS)

    cmake_parse_arguments(ARGS "${options}" "${oneValueArgs}" "${multiValueArgs}" ${ARGN})
    #    message(STATUS "ierx_add_library: ${ARGS_HEADERS} ${ARGS_SOURCES}")

    string(REPLACE "IERX" "" shortTargetName ${target})
    if (${shortTargetName} STREQUAL ${target})
        message(FATAL_ERROR "Target passed to ierx_add_library needs to start with \"IERX\", was \"${target}\"")
    endif ()

    string(TOLOWER ${shortTargetName} shortTargetNameToLower)

    add_library(${target} SHARED ${ARGS_SOURCES} ${ARGS_HEADERS})
    add_library(IERX::${shortTargetName} ALIAS ${target})

    generate_export_header(
            ${target}
            EXPORT_FILE_NAME ${shortTargetNameToLower}export.h
    )

    target_include_directories(
            ${target}
            INTERFACE
            $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}> # useful for the "something.export.h" includes
    )

    target_include_directories(
            ${target}
            PUBLIC
            $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}> # useful for the "something.h" includes
    )

    set_target_properties(
            ${target} PROPERTIES
            VERSION ${IERX_PLUGIN_VERSION}
            SOVERSION ${IERX_BINARY_VERSION}
            AUTOMOC ON
            AUTORCC ON
            AUTOUIC ON
            ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
            LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib
    )

    install(
            TARGETS ${target}
            LIBRARY
            COMPONENT Libraries
            NAMELINK_SKIP
    )

    install(
            FILES ${ARGS_HEADERS}
            DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/${shortTargetNameToLower} COMPONENT Devel
    )
endfunction()
