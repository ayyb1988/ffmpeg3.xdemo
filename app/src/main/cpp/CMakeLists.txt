
cmake_minimum_required(VERSION 3.4.1)

project("myffmpegdemo")
MESSAGE(STATUS "PROJECT_SOURCE_DIR =" ${PROJECT_SOURCE_DIR})
MESSAGE(STATUS "CMAKE_SOURCE_DIR =" ${CMAKE_SOURCE_DIR})

include_directories(${PROJECT_SOURCE_DIR}/ffmpeg/include)

link_directories(${CMAKE_SOURCE_DIR}/../jniLibs/armeabi-v7a)

add_library(
             native-lib
             SHARED
             native-lib.cpp )

find_library(
        log-lib
        log)

target_link_libraries(
        native-lib
        avcodec-57
        avfilter-6
        avformat-57
        avutil-55
        swresample-2
        swscale-4
        avdevice-57
        postproc-54

        ${log-lib})