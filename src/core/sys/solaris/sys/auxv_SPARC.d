module core.sys.solaris.sys.auxv_SPARC;

import core.stdc.config;

version(Solaris):
extern (C):
nothrow:

enum {
    // The first four are legacy definitions
    AV_SPARC_MUL32              = 0x0001,   // 32x32-bit smul/umul is efficient
    AV_SPARC_DIV32              = 0x0002,   // 32x32-bit sdiv/udiv is efficient
    AV_SPARC_FSMULD             = 0x0004,   // fsmuld is efficient
    AV_SPARC_V8PLUS             = 0x0008,   // V9 instructions available to 32-bit apps

    AV_SPARC_POPC               = 0x0010,   // popc is efficient
    AV_SPARC_VIS                = 0x0020,   // VIS instruction set supported
    AV_SPARC_VIS2               = 0x0040,   // VIS2 instruction set supported
    AV_SPARC_ASI_BLK_INIT       = 0x0080,   // ASI_BLK_INIT_xxx ASI
    AV_SPARC_FMAF               = 0x0100,   // Fused Multiply-Add
    AV_SPARC_VIS3               = 0x0400,   // VIS3 instruction set extensions
    AV_SPARC_HPC                = 0x0800,   // High Performance Computing insns
    AV_SPARC_RANDOM             = 0x1000,   // random instruction
    AV_SPARC_TRANS              = 0x2000,   // transactions supported
    AV_SPARC_FJFMAU             = 0x4000,   // Fujitsu Unfused Multiply-Add
    AV_SPARC_IMA                = 0x8000,   // Integer Multiply-add
    AV_SPARC_ASI_CACHE_SPARING  = 0x10000,
}

// Obsolete compatability definitions
alias AV_SPARC_MUL32 AV_SPARC_HWMUL_32x32;
alias AV_SPARC_DIV32 AV_SPARC_HWDIV_32x32;
alias AV_SPARC_FSMULD AV_SPARC_HWFSMULD;
