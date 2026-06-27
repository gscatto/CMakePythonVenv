# CMakePythonVenv

CMakePythonVenv integrates Python virtual environments into CMake, enabling isolated Python environments for your build workflows.

[Requirements](#requirements) | [Installation](#installation) | [Quick Start](#requirements) | [API Reference](#api-reference) | [Contributing](#contributing)

## Requirements

- CMake 3.31.6 (used for development)
- Python 3.3 (due to `venv` module)

## Installation

Add CMakePythonVenv to your CMake project using `FetchContent`:

```cmake
include(FetchContent)
FetchContent_Declare(CMakePythonVenv
    GIT_REPOSITORY "..."
    GIT_TAG "..."
)
FetchContent_MakeAvailable(CMakePythonVenv)
get_property(CMakePythonVenv_CMAKE_MODULE_PATH
    TARGET CMakePythonVenv
    PROPERTY CMAKE_MODULE_PATH
)
list(APPEND CMAKE_MODULE_PATH "${CMakePythonVenv_CMAKE_MODULE_PATH}")
include(CMakePythonVenv)
```

## Quick Start

Create a Python virtual environment, install packages from `requirements.txt` and use the Python interpreter in your build.

```cmake
# Create a virtual environment
CMakePythonVenv_create_virtual_environment(NAME venv)

# Install packages from requirements file
CMakePythonVenv_install_packages(
    NAME venv
    REQUIREMENTS_FILE requirements.txt
)

# Use the Python interpreter in your build
get_target_property(Python_ROOT_DIR venv ENV_DIR)
find_package(Python)
```

## API Reference

### CMakePythonVenv_create_virtual_environment()

Creates a new Python virtual environment.

```cmake
CMakePythonVenv_create_virtual_environment(
    NAME <name>
)
```

#### Parameters

- `NAME` (required) - Name of the virtual environment target

#### Examples

```cmake
# Create a virtual environment named "dev"
CMakePythonVenv_create_virtual_environment(NAME dev)
```

#### Properties

After creating a virtual environment, access the following properties through `get_target_property()`:

- `ENV_DIR` - Root directory of the virtual environment

### CMakePythonVenv_install_packages()

Installs Python packages into a virtual environment using `pip`.

```cmake
CMakePythonVenv_install_packages(
    NAME <name>
    [REQUIREMENTS_FILE <file>]
)
```

#### Parameters

- `NAME` (required) - Name of the virtual environment target
- `REQUIREMENTS_FILE` (optional) - Path to `requirements.txt` file

#### Examples

```cmake
# From requirements file
CMakePythonVenv_install_packages(
    NAME myenv
    REQUIREMENTS_FILE requirements.txt
)
```

## Contributing

Contributions are welcome! Please submit issues and pull requests on GitHub.

## License

MIT License — See `LICENSE` file for details.

Copyright © 2026 Giulio Scattolin