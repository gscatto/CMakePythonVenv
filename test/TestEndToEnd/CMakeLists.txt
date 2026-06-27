cmake_minimum_required(VERSION 3.31.6)
project(TestEndToEnd LANGUAGES NONE)
include(FetchContent)
FetchContent_Declare(CMakePythonVenv SOURCE_DIR "${project_dir}")
FetchContent_MakeAvailable(CMakePythonVenv)
get_property(CMakePythonVenv_CMAKE_MODULE_PATH TARGET CMakePythonVenv PROPERTY CMAKE_MODULE_PATH)
list(APPEND CMAKE_MODULE_PATH "${CMakePythonVenv_CMAKE_MODULE_PATH}")
include(CMakePythonVenv)
CMakePythonVenv_create_virtual_environment(NAME hello)
CMakePythonVenv_install_packages(NAME hello REQUIREMENTS_FILE requirements.txt)
get_target_property(Python_ROOT_DIR hello ENV_DIR)
find_package(Python REQUIRED)
execute_process(
    COMMAND ${Python_EXECUTABLE} -c "import cowsay; cowsay.cow('Hello, world!')"
    RESULT_VARIABLE result
    OUTPUT_VARIABLE stdout
)
if(NOT result STREQUAL "0")
    message(FATAL_ERROR "test failed")
endif()
if(NOT stdout MATCHES "Hello, world!")
    message(FATAL_ERROR "test failed")
endif()