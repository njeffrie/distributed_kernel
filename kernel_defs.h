#ifndef KERNEL_DEFS_H_
#define KERNEL_DEFS_H_

#include <stdint.h>

// Memory-Mapped I/O input
#define MMIO_READ(reg) (*(volatile uint32_t*)reg)
// Memory-Mapped I/O output
#define MMIO_WRITE(reg, data) (*(volatile uint32_t*)(reg) = (data))

#endif /* KERNEL_DEFS_H_ */
