cmake_minimum_required(VERSION 3.10)

project(LearningCMake VERSION 1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

option(USE_MYMATH "Use tutorial-provided math implementation" ON)


# Configure a file with cmake variables
configure_file(TutorialConfig.h.in TutorialConfig.h)

if(USE_MYMATH)
	add_subdirectory(MathFunctions)
	list(APPEND EXTRA_LIBS MathFunctions)
endif()

add_executable(main tutorial.cxx)

target_link_libraries(main PUBLIC ${EXTRA_LIBS})

# The configured file will be written to the binary tree
# add the binary path to the include search list
target_include_directories(main PUBLIC "${PROJECT_BINARY_DIR}") 
