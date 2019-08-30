#!/bin/bash

bash ./build.sh

qemu-arm -singlestep -g 1234 hello
