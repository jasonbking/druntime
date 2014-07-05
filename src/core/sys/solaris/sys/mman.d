module core.sys.solaris.sys.mman;

import core.sys.posix.sys.types : caddr_t;
import core.sys.posix.sys.mman : MAP_ANON;

version(Solaris):
extern (C):
nothrow:

// Additional mmap flags
alias MAP_ANON MAP_ANONYMOUS;

enum {
    MAP_ALIGN       = 0x200,
    MAP_TEXT        = 0x400,
    MAP_INITDATA    = 0x800,
    _MAP_LOW32      = 0x80,
}
alias _MAP_LOW32 MAP_32BIT;

enum {
    MADV_NORMAL,
    MADV_RANDOM,
    MADV_SEQUENTIAL,
    MADV_WILLNEED,
    MADV_DONTNEED,
    MADV_FREE,
    MADV_ACCESS_DEFAULT,
    MADV_ACCESS_LWP,
    MADV_ACCESS_MANY,
}

enum MMOBJ_PADDING      = 0x10000;
enum MMOBJ_INTERPRET    = 0x20000;
enum MMOBJ_ALL_FLAGS   = (MMOBJ_PADDING | MMOBJ_INTERPRET);

// values for mr_flags
enum MR_PADDING  = 0x1;
enum MR_HDR_ELF  = 0x2;
enum MR_HDR_AOUT = 0x3;

enum MR_TYPE_MASK = 0x0000ffff;
extern (D) uint MR_GET_TYPE(uint val) { return val & MR_TYPE_MASK; }

struct mmapobj_result_t
{
    caddr_t     mr_addr;
    size_t      mr_msize;
    size_t      mr_fsize;
    size_t      mr_offset;
    uint        mr_prot;
    uint        mr_flags;
}

int mmapobj(int, uint, mmapobj_result_t*, uint*, void*);

enum {
    MEMINFO_SHIFT       = 16,
    MEMINFO_MASK        = (0xFF << MEMINFO_SHIFT),
    MEMINFO_VPHYSICAL   = (0x01 << MEMINFO_SHIFT),
    MEMINFO_VLGRP       = (0x02 << MEMINFO_SHIFT),
    MEMINFO_VPAGESIZE   = (0x03 << MEMINFO_SHIFT),
    MEMINFO_VREPLCNT    = (0x04 << MEMINFO_SHIFT),
    MEMINFO_VREPL       = (0x05 << MEMINFO_SHIFT),
    MEMINFO_VREPL_LGRP  = (0x06 << MEMINFO_SHIFT),
    MEMINFO_PLGRP       = (0x07 << MEMINFO_SHIFT),

    MAX_MEMINFO_CNT     = 256,
    MAX_MEMINFO_REQ     = 31,
};

int meminfo(in ulong* inaddr, int addr_count, in uint* info_req, int info_count, ulong* outdata, uint* validity);
