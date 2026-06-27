include(CMakePythonVenvMain)

function(CMakePythonVenv_find_program)
endfunction()

function(CMakePythonVenv_is_target_defined name output_var)
    set("${output_var}" FALSE PARENT_SCOPE)
endfunction()

function(CMakePythonVenv_execute_process)
    cmake_parse_arguments(args "" "RESULT_VARIABLE" "" ${ARGN})
    set("${args_RESULT_VARIABLE}" 1 PARENT_SCOPE)
endfunction()

CMakePythonVenv_create_virtual_environment(NAME simple)