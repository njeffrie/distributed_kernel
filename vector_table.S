// Interrupt vector table will be placed at 0x0
.section ".text.vector"

.globl _start
.globl _vector_table
_vector_table:
    b       _start
    ldr     pc, [pc, #0x3f4]
    ldr     pc, [pc, #0x3f4]
    ldr     pc, [pc, #0x3f4]
    ldr     pc, [pc, #0x3f4]
    ldr     pc, [pc, #0x3f4]
    ldr     pc, [pc, #0x3f4]
// Start FIQ handler at FIQ vector
_fiq:
    b       _start
// Allocate 1K for vector table and FIQ handler
.fill 992

// Addresses of exception handler wrappers, will be placed at 0x400
// (immediately after vector table)
.section ".data.vector"

.globl _undefined_exception
_undefined_exception:
.word _start
.globl _software_interrupt
_software_interrupt:
.word _start
.globl _prefetch_abort
_prefetch_abort:
.word _start
.globl _data_abort
_data_abort:
.word _start
.globl _not_used
_not_used:
.word _start
.globl _irq
_irq:
.word _start
