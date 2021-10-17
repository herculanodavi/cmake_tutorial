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


install(TARGETS main DESTINATION bin)
install(FILES "${PROJECT_BINARY_DIR}/TutorialConfig.h" DESTINATION include)


enable_testing()

# does the application run
add_test(NAME Runs COMMAND main 25)

# does the usage message work?
add_test(NAME Usage COMMAND main)
set_tests_properties(Usage
  PROPERTIES PASS_REGULAR_EXPRESSION "Usage:.*number"
  )

# define a function to simplify adding tests
function(do_test target arg result)
  add_test(NAME Comp${arg} COMMAND ${target} ${arg})
  set_tests_properties(Comp${arg}
    PROPERTIES PASS_REGULAR_EXPRESSION ${result}
    )
endfunction()

# do a bunch of result based tests
do_test(main 4 "4 is 2")
do_test(main 9 "9 is 3")
do_test(main 5 "5 is 2.236")
do_test(main 7 "7 is 2.645")
do_test(main 25 "25 is 5")
do_test(main -25 "-25 is (-nan|nan|0)")
do_test(main 0.0001 "0.0001 is 0.01")
