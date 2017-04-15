// Linker should place this at memory address 0x0
.section ".text.vector"

.globl _start
.globl _vector_table
_vector_table:
    b       _start
    ldr     pc, _undefined_exception
    ldr     pc, _software_interrupt
    ldr     pc, _prefetch_abort
    ldr     pc, _data_abort
    ldr     pc, _not_used
    ldr     pc, _irq
// Start FIQ handler at FIQ vector
_fiq:
    ldr     pc, =_start
// Allocate 1K for FIQ handler
.fill 1024
.align 4
_undefined_exception:
    ldr     pc, =_start
_software_interrupt:
    ldr     pc, =_start
_prefetch_abort:
    ldr     pc, =_start
_data_abort:
    ldr     pc, =_start
_not_used:
    ldr     pc, =_start
_irq:
    ldr     pc, =_start
