macro(CMakePythonVenv_is_target_defined name output_var)
    if(TARGET "${name}")
        set("${output_var}" TRUE)
    else()
        set("${output_var}" FALSE)
    endif()
endmacro()

macro(CMakePythonVenv_add_custom_target)
    add_custom_target(${ARGN})
endmacro()

macro(CMakePythonVenv_find_program)
    find_program(${ARGN})
endmacro()

macro(CMakePythonVenv_execute_process)
    execute_process(${ARGN})
endmacro()

macro(CMakePythonVenv_set_property)
    set_property(${ARGN})
endmacro()

macro(CMakePythonVenv_get_property)
    get_property(${ARGN})
endmacro()

macro(CMakePythonVenv_find_package)
    find_package(${ARGN})
endmacro()