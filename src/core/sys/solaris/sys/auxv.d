module core.sys.solaris.sys.auxv;

import core.stdc.config;

version(Solaris):
extern (C):
nothrow:

struct auxv_t {
    int     a_type;
    union __a_un {
        c_long          a_val;
        void*           a_ptr;
        void function() a_fcn;
    }
    __a_un  a_un;
}
version (X86)
    static assert (auxv_t.sizeof == 8);
version (X86_64)
    static assert (auxv_t.sizeof == 12);

enum {
    AT_NULL             = 0,
    AT_IGNORE           = 1,
    AT_EXECFD           = 2,
    AT_PHDR             = 3,
    AT_PHENT            = 4,
    AT_PHNUM            = 5,
    AT_PAGESZ           = 6,
    AT_BASE             = 7,
    AT_FLAGS            = 8,
    AT_ENTRY            = 9,

    // Sun extensions
    AT_SUN_UID          = 2000,
    AT_SUN_RUID         = 2001,
    AT_SUN_GID          = 2002,
    AT_SUN_RGID         = 2003,
    AT_SUN_LDELF        = 2004,
    AT_SUN_LDSHDR       = 2005,
    AT_SUN_LDNAME       = 2006,
    AT_SUN_LPAGESZ      = 2007,
    AT_SUN_PLATFORM     = 2008,
    AT_SUN_HWCAP        = 2009,
    AT_SUN_HWCAP2       = 2023,
    AT_SUN_IFLUSH       = 2010,
    AT_SUN_CPU          = 2011,
    AT_SUN_EXECNAME     = 2014,
    AT_SUN_MMU          = 2015,
    AT_SUN_LDDATA       = 2016,
    AT_SUN_AUXFLAGS     = 2017,
    AT_SUN_EMULATOR     = 2018,
    AT_SUN_BRANDNAME    = 2019,
    AT_SUN_BRAND_AUX1   = 2020,
    AT_SUN_BRAND_AUX2   = 2021,
    AT_SUN_BRAND_AUX3   = 2022,

    AT_SUN_SETUGID      = 0x00000001,
    AT_SUN_HWCAPVERIFY  = 0x00000002,
    AT_SUN_SUN_NOPLM    = 0x00000004,
}

version (X86)
    public import core.sys.solaris.sys.auxv_386;
else version (X86_64)
    public import core.sys.solaris.sys.auxv_386;
//else version (SPARC)
//    public import core.sys.solaris.sys.auxv_SPARC;
