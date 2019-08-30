.text
.global _start
_start:
    // Load registers with values
    ldr r1, =message        // Load message into r1
    bl strlen               // Call strlen
    mov r7, #4              // Syscall write
    mov r4, #10             // Loop counter

loop:
    subs r4, r4, #1         // Decrement loop counter

    mov r0, #1              // Output to stdout
    swi 0                   // Make write syscall

    cmp r4, #0              // Compare counter
    bne loop                // Jump if counter r4 != 0

    mov r7, #1              // Interrupt exit
    swi 0                   // Make exit syscall

// Arguments:
// r1 string to measure
// r2 char counter
// r3 byte to compare
// Return values:
// r1 string that was counted
// r2 length of string
.global strlen

strlen:
    mov r2, #0              // Clear registers for use
    mov r3, #0
    push {r1}               // Push the original memory address onto the stack

strlen_loop:
    ldrb r3, [r1]           // Load byte from address at r1 into r3

    cmp r3, #0              // Compare to terminating null value
    addne r2, r2, #1        // Increment char counter
    addne r1, r1, #1        // Increment string pointer
    bne strlen_loop         // Jump if byte in r3 != 0

    pop {r1}                // Restore the original memory address into r1
    bx lr                   // Return from subroutine

.data
message:
    .asciz "Hello world!\n\0"
