cmake_minimum_required(VERSION 3.10)

project(LearningCMake VERSION 1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Configure a file with cmake variables
configure_file(TutorialConfig.h.in TutorialConfig.h)

add_executable(main tutorial.cxx)

# The configured file will be written to the binary tree
# add the binary path to the include search list
target_include_directories(main PUBLIC "${PROJECT_BINARY_DIR}")
