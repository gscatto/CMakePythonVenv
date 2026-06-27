get_property(CMakePythonVenv_PROJECT_SOURCE_DIR TARGET CMakePythonVenv PROPERTY PROJECT_SOURCE_DIR)
include("${CMakePythonVenv_PROJECT_SOURCE_DIR}/main/CMakePythonVenvSupport.cmake")
include("${CMakePythonVenv_PROJECT_SOURCE_DIR}/main/CMakePythonVenvMain.cmake")