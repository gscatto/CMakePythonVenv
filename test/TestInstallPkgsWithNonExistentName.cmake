include(CMakePythonVenvMain)

function(CMakePythonVenv_is_target_defined name output_var)
    set("${output_var}" FALSE PARENT_SCOPE)
endfunction()

CMakePythonVenv_install_packages(NAME none)