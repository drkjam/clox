cmake_minimum_required(VERSION 3.21)
project(clox C)

set(CMAKE_C_STANDARD 99)

file(GLOB sources *.c)
add_executable(clox ${sources})
