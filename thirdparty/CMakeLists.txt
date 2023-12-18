cmake_minimum_required(VERSION 3.11)

function(build_thirdparty COMFIGURATION_PACKAGE_PATH)
  include(${COMFIGURATION_PACKAGE_PATH})

  message(STATUS "Start installation verification for ${PROJECT_NAME}.")
  message(STATUS "Check ${PROJECT_NAME} in ${${PROJECT_NAME}_CMAKE_PATH}.")
  find_package(${PROJECT_NAME} QUIET HINTS ${${PROJECT_NAME}_CMAKE_PATH})

  if(${PROJECT_NAME}_FOUND)
    message(STATUS "Found ${PROJECT_NAME}.")
  else()
    message(STATUS "Not found ${PROJECT_NAME}! Using ExternalProject.")
    message(STATUS "Start install for ${PROJECT_NAME}.\n")

    configure_file(CMakeLists.txt.in ${PROJECT_NAME}/CMakeLists.txt)
    execute_process(
      COMMAND ${CMAKE_COMMAND} "${CMAKE_GENERATOR}" .
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME})
    execute_process(
      COMMAND ${CMAKE_COMMAND} --build .
      WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/${PROJECT_NAME})
    message(STATUS "Finish install for ${PROJECT_NAME}.\n")
  endif()

  find_package(${PROJECT_NAME} REQUIRED HINTS ${${PROJECT_NAME}_CMAKE_PATH})
  message(STATUS "Finish installation verification for ${PROJECT_NAME}.\n")
endfunction()

message(STATUS "Start Building thirdparties.")

file(GLOB ELEMENTS "*")

foreach(ELEMENT ${ELEMENTS})
  if(IS_DIRECTORY ${ELEMENT} AND EXISTS ${ELEMENT}/configurate_package.cmake)
    build_thirdparty(${ELEMENT}/configurate_package.cmake)
  endif()
endforeach()

message(STATUS "Finish Building thirdparties.\n")
