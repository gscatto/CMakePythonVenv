include(CMakePythonVenvMain)

function(CMakePythonVenv_is_target_defined name output_var)
    set("${output_var}" TRUE PARENT_SCOPE)
endfunction()

CMakePythonVenv_create_virtual_environment(NAME duplicate)
CMakePythonVenv_create_virtual_environment(NAME duplicate)