find_package(Doxygen)

if(NOT DOXYGEN_FOUND)
  message(FATAL_ERROR "Doxygen is needed to build the documentation.")
else()
  if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile)
    set(DOXYGEN_IN ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile)
    add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD
      COMMAND doxygen
      WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
      COMMENT "Generating documents...")
    message(STATUS "Added generating API documentation with Doxygen in build time")
  else()
    message(WARNING "File not found: ${CMAKE_CURRENT_SOURCE_DIR}/Doxyfile")
  endif()
endif()
