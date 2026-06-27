cmake_minimum_required(VERSION 3.31.6)
project(CMakePythonVenv LANGUAGES NONE)
if(PROJECT_IS_TOP_LEVEL)
    include(CTest)
    add_subdirectory(test)
endif()
add_custom_target(CMakePythonVenv)
set_target_properties(
    CMakePythonVenv
    PROPERTIES
        CMAKE_MODULE_PATH "${CMAKE_CURRENT_SOURCE_DIR}"
        PROJECT_SOURCE_DIR "${CMAKE_CURRENT_SOURCE_DIR}"
)