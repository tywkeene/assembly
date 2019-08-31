.text
.global _start
_start:
    // Load registers with values
    ldr r1, =message        // Load message into r1
    ldr r2, =len            // Load length of message into r2
    ldr r4, =loop_count     // Load loop count into r4
    mov r7, #4              // Syscall write

loop:
    subs r4, r4, #1         // Decrement loop counter

    mov r0, #1              // Output to stdout
    swi 0                   // Make write syscall

    cmp r4, #0              // Compare counter
    bne loop                // Jump if counter r4 != 0

    mov r7, #1              // Interrupt exit
    swi 0                   // make exit syscall

.data
message:
    .asciz "Hello, world!\n"
len = .-message
loop_count = 10
