#!/bin/bash

arm-none-eabi-as -g strlen.s -o strlen.o 
arm-none-eabi-ld strlen.o -o strlen
