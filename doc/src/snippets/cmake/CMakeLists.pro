#! [0]
cmake_minimum_required(VERSION 2.8.9)

project(testproject)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)
# Instruct CMake to run moc automatically when needed.
set(CMAKE_AUTOMOC ON)

# Find the QtWidgets library
find_package(Qt5Widgets)

# Tell CMake to create the helloworld executable
add_executable(helloworld main.cpp)

# Use the Widgets module from Qt 5.
qt5_use_modules(helloworld Widgets)
#! [0]

#! [1]
find_package(Qt5Core)

# Find the Widgets Sql and Network modules, and
# use them in helloworld.
qt5_use_modules(helloworld Widgets Sql Network)
#! [1]

#! [2]
find_package(Qt5Core)

get_target_property(QtCore_location Qt5::Core LOCATION)
#! [2]

#! [3]
find_package(Qt5Core)

set(CMAKE_CXX_FLAGS_COVERAGE "${CMAKE_CXX_FLAGS_RELEASE} -fprofile-arcs -ftest-coverage")

# set up a mapping so that the Release configuration for the Qt imported target is
# used in the COVERAGE CMake configuration.
set_target_properties(Qt5::Core PROPERTIES MAP_IMPORTED_CONFIG_COVERAGE "RELEASE")
#! [3]

#! [4]
cmake_minimum_required(VERSION 2.8.3)

project(testproject)

# Find includes in corresponding build directories
set(CMAKE_INCLUDE_CURRENT_DIR ON)

# Find the QtWidgets library
find_package(Qt5Widgets)

# Add the include directories for the Qt 5 Widgets module to
# the compile lines.
include_directories(${Qt5Widgets_INCLUDE_DIRS})

# Use the compile definitions defined in the Qt 5 Widgets module
add_definitions(${Qt5Widgets_DEFINITIONS})

# Add compiler flags for building executables (-fPIE)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} ${Qt5Widgets_EXECUTABLE_COMPILE_FLAGS}")

qt5_generate_moc(main.cpp main.moc)

# Tell CMake to create the helloworld executable
add_executable(helloworld main.cpp main.moc)

#Link the helloworld executable to the Qt 5 widgets library.
target_link_libraries(${Qt5Widgets_LIBRARIES})
#! [4]

#! [5]
find_package(Qt5Core)

add_executable(exe1 ${exe1_SRCS})
# Set the POSITION_INDEPENDENT_CODE property for the exe1 target...
set_target_properties(exe1 PROPERTIES POSITION_INDEPENDENT_CODE ON)

# Or set it globally for all targets:
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
add_executable(exe2 ${exe2_SRCS})

add_executable(exe3 ${exe3_SRCS})
#! [5]
