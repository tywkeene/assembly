#!/bin/bash

target=$1

bash ./scripts/build.sh ${target}
qemu-arm -singlestep -g 1234 ./bin/${target}
