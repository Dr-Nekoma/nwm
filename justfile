
CC := "cc"
CFLAGS := "-Wall -Wextra -std=c11 -pedantic -ggdb"
LIBS := "-lm"
SRC := "src/main.c"

build:
    {{CC}} {{CFLAGS}} {{SRC}} -o nwm
