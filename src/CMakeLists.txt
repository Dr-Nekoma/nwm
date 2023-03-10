add_executable(nwm)
target_sources(nwm PRIVATE nwm.cc)
target_link_libraries(nwm PRIVATE absl::time spdlog::spdlog X11)

add_library(simple)
target_sources(simple
    PUBLIC
    $<INSTALL_INTERFACE:include/src/simple.h>
    $<BUILD_INTERFACE:${CMAKE_CURRENT_LIST_DIR}/simple.h>
    PRIVATE simple.cc)

if(ENABLE_TESTING)
    MAKE_CC_TEST(
        NAME simple_test
        SRCS simple_test.cc
        DEPS simple)
endif()
