#!/bin/bash

gdb-multiarch --se hello --eval-command 'target remote localhost:1234' --eval-command 'layout regs'
