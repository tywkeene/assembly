#!/bin/bash

gdb-multiarch --se strlen --eval-command 'target remote localhost:1234' --eval-command 'layout regs'
