.text
.global _start
_start:
.ARM
    ldr r3, =loop_count     // Load loop count into r3
    ldr r4, =counter_val    // Load counter into r4
loop:
    add r4, r4, #1          // Increment loop counter

    mov r0, #1              // Load interrupt code ??
    ldr r1, =message        // Load message into r1
    ldr r2, =len            // Load length of message into r2
    mov r7, #4              // Interrupt print
    swi 0                   // Call interrupt

    cmp r3, r4              // Compare counter
    bne loop                // Jump if counter != loop_count

    mov r7, #1              // Interrupt code 1 exit
    swi 0                   // Call interrupt

.data
message:
    .asciz "hello world\n"
len = .-message
loop_count = 10
counter_val = 0
