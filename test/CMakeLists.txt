# Test PythonVenv_create_virtual_environment() function
add_test(NAME TestCreateVenvWithoutArgs COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}/main" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestCreateVenvWithoutArgs.cmake")
set_property(TEST TestCreateVenvWithoutArgs PROPERTY PASS_REGULAR_EXPRESSION "CMakePythonVenv_create_virtual_environment called without NAME parameter")
add_test(NAME TestCreateVenvProcessFailure COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}/main" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestCreateVenvProcessFailure.cmake")
set_property(TEST TestCreateVenvProcessFailure PROPERTY PASS_REGULAR_EXPRESSION "could not create Python virtual environment")
add_test(NAME TestCreateVenvDuplicate COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}/main" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestCreateVenvDuplicate.cmake")
set_property(TEST TestCreateVenvDuplicate PROPERTY PASS_REGULAR_EXPRESSION "Python virtual environment named \"duplicate\" already exists")
add_test(NAME TestCreateVenvWithName COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}/main" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestCreateVenvWithName.cmake")

# Test PythonVenv_install_packages() function
add_test(NAME TestInstallPkgsWithoutArgs COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}/main" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestInstallPkgsWithoutArgs.cmake")
set_property(TEST TestInstallPkgsWithoutArgs PROPERTY PASS_REGULAR_EXPRESSION "CMakePythonVenv_install_packages called without NAME parameter")
add_test(NAME TestInstallPkgsWithNonExistentName COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}/main" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestInstallPkgsWithNonExistentName.cmake")
set_property(TEST TestInstallPkgsWithNonExistentName PROPERTY PASS_REGULAR_EXPRESSION "Python virtual environment named \"none\" does not exist")
add_test(NAME TestInstallPkgsWithoutPackages COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}/main" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestInstallPkgsWithoutPackages.cmake")
set_property(TEST TestInstallPkgsWithoutPackages PROPERTY PASS_REGULAR_EXPRESSION "CMakePythonVenv_install_packages called without packages to install")
add_test(NAME TestInstallPkgsFromReqFileProcessFailure COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}/main" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestInstallPkgsFromReqFileProcessFailure.cmake")
set_property(TEST TestInstallPkgsFromReqFileProcessFailure PROPERTY PASS_REGULAR_EXPRESSION "could not install packages from.*/absolute/path/to/requirements.txt file")
add_test(NAME TestInstallPkgsFromReqFile COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}/main" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestInstallPkgsFromReqFile.cmake")

# Test end to end
add_test(NAME TestEndToEnd COMMAND "${CMAKE_COMMAND}" "-DCMAKE_MODULE_PATH=${PROJECT_SOURCE_DIR}" "-Dsource_dir=${CMAKE_CURRENT_SOURCE_DIR}/TestEndToEnd" "-Dbinary_dir=${CMAKE_CURRENT_BINARY_DIR}/TestEndToEnd" "-Dproject_dir=${PROJECT_SOURCE_DIR}" -P "${CMAKE_CURRENT_SOURCE_DIR}/TestEndToEnd.cmake")