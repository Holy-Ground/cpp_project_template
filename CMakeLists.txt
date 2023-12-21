cmake_minimum_required(VERSION 3.11)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

set(CMAKE_VERBOSE_MAKEFILE ON)

project(
  CPP_PROJECT_TEMPLATE
  LANGUAGES CXX
  VERSION 1.0.0
  DESCRIPTION "C++ Project Template"
  HOMEPAGE_URL "studio.holyground.com"
)
message(STATUS)
message(STATUS "Started all process in ${PROJECT_NAME} CMakeLists.txt.")
message(STATUS)

set(CPP_COMFILE_FLAGS_MSVC /W4 /WX /permissive-)
set(CPP_COMFILE_FLAGS_OTHERS -Wall -Wpedantic -Wextra -Werror)

if(NOT CPP_COMFILE_FLAGS)
  if(CMAKE_CXX_COMPILER_ID STREQUAL "MSVC")
    set(CPP_COMFILE_FLAGS ${CPP_COMFILE_FLAGS_MSVC})
  else()
    set(CPP_COMFILE_FLAGS ${CPP_COMFILE_FLAGS_OTHERS})
  endif()
endif()

# ! Set the path variables
# ! set(${PROJECT_NAME}_SOMETHING_PATH ${${PROJECT_NAME}_PATH}/something)
set(${PROJECT_NAME}_ROOT_PATH ${CMAKE_CURRENT_SOURCE_DIR})
set(${PROJECT_NAME}_SOURCE_PATH "${${PROJECT_NAME}_ROOT_PATH}/src")
set(${PROJECT_NAME}_INCLUDE_PATH "${${PROJECT_NAME}_ROOT_PATH}/include")
set(${PROJECT_NAME}_THIRDPARTY_PATH "${${PROJECT_NAME}_ROOT_PATH}/thirdparty")
set(${PROJECT_NAME}_MODULE_PATH "${${PROJECT_NAME}_ROOT_PATH}/module")
set(${PROJECT_NAME}_TEST_PATH "${${PROJECT_NAME}_ROOT_PATH}/test")
set(${PROJECT_NAME}_APPLICATION_PATH "${${PROJECT_NAME}_ROOT_PATH}/application")
set(${PROJECT_NAME}_RESOURCE_PATH "${${PROJECT_NAME}_ROOT_PATH}/resource")

if(NOT PARSED_SYSTEM_INFO)
  # ! Message for the system information
  message(STATUS "---------------CMake information---------------")
  message(STATUS "CMake version: ${CMAKE_VERSION}")
  message(STATUS "")

  message(STATUS "---------------System information---------------")
  message(STATUS "System architecture name: ${CMAKE_SYSTEM_PROCESSOR}")
  message(STATUS "System os name: ${CMAKE_SYSTEM_NAME}")
  message(STATUS "System os version: ${CMAKE_SYSTEM_VERSION}")
  message(STATUS "")

  message(STATUS "---------------Compiler information---------------")
  message(STATUS "C++ compiler id: ${CMAKE_CXX_COMPILER_ID}")
  message(STATUS "C++ compiler version: ${CMAKE_CXX_COMPILER_VERSION}")
  message(STATUS "C++ Compile options: ${CPP_COMFILE_FLAGS}")
  message(STATUS "")

  message(STATUS "---------------C++ standard information---------------")
  message(STATUS "C++ Build type: ${CMAKE_BUILD_TYPE}")
  message(STATUS "C++ standard version: ${CMAKE_CXX_STANDARD}")
  message(STATUS "C++ standard required: ${CMAKE_CXX_STANDARD_REQUIRED}")
  message(STATUS "C++ extensions: ${CMAKE_CXX_EXTENSIONS}")
  message(STATUS "")

  set(PARSED_SYSTEM_INFO TRUE)
endif()

# ! Message for the project information
message(STATUS "---------------Procject information---------------")
message(STATUS "PROJECT_NAME: ${PROJECT_NAME}")
message(STATUS "${PROJECT_NAME}_VERSION: ${PROJECT_VERSION}")
message(STATUS "${PROJECT_NAME}_DESCRIPTION: ${PROJECT_DESCRIPTION}")
message(STATUS "${PROJECT_NAME}_HOMEPAGE_URL: ${PROJECT_HOMEPAGE_URL}")
message(STATUS "")

# ! message(STATUS "${PROJECT_NAME}_SOMETHING_PATH: ${${PROJECT_NAME}_SOMETHING_PATH}")
message(STATUS "---------------Procject path information---------------")
message(STATUS "${PROJECT_NAME}_ROOT_PATH: ${${PROJECT_NAME}_ROOT_PATH}")
message(STATUS "${PROJECT_NAME}_INCLUDE_PATH: ${${PROJECT_NAME}_INCLUDE_PATH}")
message(STATUS "${PROJECT_NAME}_SOURCE_PATH: ${${PROJECT_NAME}_SOURCE_PATH}")
message(STATUS "${PROJECT_NAME}_THIRDPARTY_PATH: ${${PROJECT_NAME}_THIRDPARTY_PATH}")
message(STATUS "${PROJECT_NAME}_MODULE_PATH: ${${PROJECT_NAME}_MODULE_PATH}")
message(STATUS "${PROJECT_NAME}_TEST_PATH: ${${PROJECT_NAME}_TEST_PATH}")
message(STATUS "${PROJECT_NAME}_APPLICATION_PATH: ${${PROJECT_NAME}_APPLICATION_PATH}")
message(STATUS "${PROJECT_NAME}_RESOURCE_PATH: ${${PROJECT_NAME}_RESOURCE_PATH}")
message(STATUS "")

add_subdirectory(${${PROJECT_NAME}_THIRDPARTY_PATH})
add_subdirectory(${${PROJECT_NAME}_MODULE_PATH})
add_subdirectory(${${PROJECT_NAME}_APPLICATION_PATH})

set(${PROJECT_NAME}_SOURCE_FILES

  # ! Add source files here
)

# ! If you want to make a library, use the following code
# add_library(${PROJECT_NAME} STATIC
# ${${PROJECT_NAME}_SOURCE_FILES}
# )

# ! If you want to make an executable, use the following code
# add_executable(${PROJECT_NAME}
# ${${PROJECT_NAME}_SOURCE_FILES}
# )

# ! If you want to add include directories and link libraries, use the following code
# target_include_directories(${PROJECT_NAME} PUBLIC
# ${${PROJECT_NAME}_INCLUDE_PATH}

# ! Add include path here
# )
# target_link_libraries(${PROJECT_NAME} PRIVATE

# ! Add libraries here
# )
# add_dependencies(${PROJECT_NAME}

# ! Add dependencies here
# )
# target_compile_options(${PROJECT_NAME} PRIVATE
# ${CPP_COMFILE_FLAGS}
# )
# include(cmake/create_documents.cmake)

add_subdirectory(${${PROJECT_NAME}_TEST_PATH})
message(STATUS)
message(STATUS "Finished all process in ${PROJECT_NAME} CMakeLists.txt.")
message(STATUS)
