#!/bin/bash

target=$1

gdb-multiarch --se ${target} --eval-command 'target remote localhost:1234' --eval-command 'layout regs'
