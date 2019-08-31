#!/bin/bash

mkdir -p ./bin ./obj

target=$1
arm-none-eabi-as -g ./arm/${target}/${target}.s -o ./obj/${target}.o 
arm-none-eabi-ld ./obj/${target}.o -o ./bin/${target}
