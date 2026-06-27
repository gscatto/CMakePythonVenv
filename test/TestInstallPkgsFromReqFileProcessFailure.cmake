include(CMakePythonVenvMain)

function(CMakePythonVenv_is_target_defined name output_var)
    set("${output_var}" TRUE PARENT_SCOPE)
endfunction()

function(CMakePythonVenv_get_property)
endfunction()

function(CMakePythonVenv_find_package)
endfunction()

function(CMakePythonVenv_execute_process)
    cmake_parse_arguments(args "" "RESULT_VARIABLE" "" ${ARGN})
    set("${args_RESULT_VARIABLE}" 1 PARENT_SCOPE)
endfunction()

CMakePythonVenv_install_packages(NAME hello REQUIREMENTS_FILE /absolute/path/to/requirements.txt)