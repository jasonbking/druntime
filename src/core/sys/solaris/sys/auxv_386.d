module core.sys.solaris.sys.auxv_386;

version(Solaris):
extern (C):
nothrow:

enum {
    AV_386_FPU          = 0x00001,
    AV_386_TSC          = 0x00002,
    AV_386_CX8          = 0x00004,
    AV_386_SEP          = 0x00008,
    AV_386_AMD_SYSC     = 0x00010,
    AV_386_CMOV         = 0x00020,
    AV_386_MMX          = 0x00040,
    AV_386_AMD_MMX      = 0x00080,
    AV_386_AMD_3DNow    = 0x00100,
    AV_386_AMD_3DNowx   = 0x00200,
    AV_386_FXSR         = 0x00400,
    AV_386_SSE          = 0x00800,
    AV_386_SSE2         = 0x01000,
                       // 0x02000 withdrawn
    AV_386_SSE3         = 0x04000,
                       // 0x08000 withdrawn
    AV_386_CX16         = 0x10000,
    AV_386_AHF          = 0x20000,
    AV_386_TSCP         = 0x40000,
    AV_386_AMD_SSE4A    = 0x80000,
    AV_386_POPCNT       = 0x100000,
    AV_386_AMD_LZCNT    = 0x200000,
    AV_386_SSSE3        = 0x400000,
    AV_386_SSE4_1       = 0x800000,
    AV_386_SSE4_2       = 0x1000000,
    AV_386_MOVBE        = 0x2000000,
    AV_386_AES          = 0x40000000,
    AV_386_PCLMULQDQ    = 0x80000000,
    AV_386_XSAVE        = 0x100000000,
    AV_386_AVX          = 0x200000000,
    AV_386_VMX          = 0x400000000,
    AV_386_AMD_SVM      = 0x800000000,
}

enum {
    AV_386_2_F16C       = 0x00001,
    AV_386_2_RDRAND     = 0x00002
}
