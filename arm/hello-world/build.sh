#!/bin/bash

arm-none-eabi-as -g hello.s -o hello.o 
arm-none-eabi-ld hello.o -o hello
