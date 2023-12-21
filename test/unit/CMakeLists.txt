set(TEST_TYPE "UNIT")

set(SLASH "/")
set(UNDER_BAR "_")

set(${PROJECT_NAME}_${TEST_TYPE}_SOURCE_FILES

  # ! Add source files here
)

function(add_test_executable EXECUTABLE_NAME SOURCE_FILES)
  add_executable(${EXECUTABLE_NAME}

    ${SOURCE_FILES}.cpp
    main.cpp
  )
  target_link_libraries(${EXECUTABLE_NAME} PRIVATE
    ${GTEST_LIBRARIES}
    ${PROJECT_NAME}
  )

  add_test(NAME ${EXECUTABLE_NAME} COMMAND
    ${CMAKE_CURRENT_BINARY_DIR}/${EXECUTABLE_NAME}
    --gtest_color=yes
  )
endfunction()

find_package(GTEST REQUIRED HINTS ${GTEST_CMAKE_PATH})

# add_test_executable(${PROJECT_NAME}_${TEST_TYPE}_TESTS ${${PROJECT_NAME}_${TEST_TYPE}_SOURCE_FILES})
foreach(TEST_FILE_NAME ${${PROJECT_NAME}_${TEST_TYPE}_SOURCE_FILES})
  string(REPLACE ${SLASH} ${UNDER_BAR} TEST_FILE_NAME ${TEST_FILE_NAME})
  string(TOUPPER ${TEST_FILE_NAME} UPPER_TEST_FILE_NAME)
  set(TEST_NAME ${PROJECT_NAME}_${TEST_TYPE}_${UPPER_TEST_FILE_NAME}_TEST)

  add_test_executable(${TEST_NAME} ${TEST_FILE_NAME})
endforeach()
