/**
 * D header file for Solaris
 */
module core.sys.solaris.link;

version (Solaris):
extern (C):
nothrow:

import core.stdc.config : c_ulong;
import core.sys.solaris.elf;
import core.stdc.stdint : uintptr_t;
import core.sys.solaris.dlfcn : Lmid_t;

// Unlike a lot of the libc interfaces, both versions are present in both
// 32 and 64-bit environments

struct Elf;

void ld_start(in char*, const Elf32_Half, in char*);
void ld_atexit(int);
void ld_open(in char**, in char**, int*, int, Elf**, Elf*, size_t, const Elf_Kind);
void ld_file(in char*, Elf32_Shdr**, Elf32_Word, Elf_Data*, Elf*, uint*);
void ld_input_section(in char*, Elf32_Shdr*, Elf32_Word, Elf_Data*, Elf*);

void ld_start64(in char*, const Elf64_Half, in char*);
void ld_atexit64(int);
void ld_open64(in char**, in char**, int*, int, Elf**, Elf*, size_t, const Elf_Kind);
void ld_file64(in char*, Elf64_Shdr**, Elf64_Word, Elf_Data*, Elf*, uint*);
void ld_input_section64(in char*, Elf64_Shdr*, Elf64_Word, Elf_Data*, Elf*);

enum LD_SUP_VNONE = 0;
enum LD_SUP_VERSION1 = 1;
enum LD_SUP_VERSION2 = 2;
enum LD_SUP_VERSION3 = 3;
enum LD_SUP_VCURRENT = LD_SUP_VERSION3;

enum LD_SUP_DERIVED     = 0x1;
enum LD_SUP_INHERITED   = 0x2;
enum LD_SUP_EXTRACTED   = 0x4;

enum LM_ID_BASE = 0x00;
enum LM_ID_LDSO = 0x01;
enum LM_ID_NUM  = 2;

enum LM_ID_BRAND    = 0xfd;
enum LM_ID_NONE     = 0xfe;
enum LM_ID_NEWLM    = 0xff;

enum LAV_NONE       = 0;
enum LAV_VERSION1   = 1;
enum LAV_VERSION2   = 2;
enum LAV_VERSION3   = 3;
enum LAV_VERSION4   = 4;
enum LAV_VERSION5   = 5;
enum LAV_CURRENT    = LAV_VERSION5;
enum LAV_NUM        = 6;

enum LA_FLG_BINDTO      = 0x0001;
enum LA_FLG_BINDFROM    = 0x0002;

enum LA_SYMB_NOPLTENTER = 0x0001;
enum LA_SYMB_NOPLTEXIT  = 0x0002;
enum LA_SYMB_STRUCTCALL = 0x0004;
enum LA_SYMB_DLSYM      = 0x0008;
enum LA_SYMB_ALTVALUE   = 0x0010;

enum LA_SER_ORIG        = 0x001;
enum LA_SER_LIBPATH     = 0x002;
enum LA_SER_RUNPATH     = 0x004;
enum LA_SER_CONFIG      = 0x008;
enum LA_SER_DEFAULT     = 0x040;
enum LA_SER_SECURE      = 0x080;
enum LA_SER_MASK        = 0xfff;

enum LA_ACT_CONSISTENT  = 0x00;
enum LA_ACT_ADD         = 0x01;
enum LA_ACT_DELETE      = 0x02;
enum LA_ACT_MAX         = 3;

version (D_LP64)
    alias long lagreg_t;
else
    alias int lagreg_t;

struct _la_sparc_regs
{
    lagreg_t    lr_rego0;
    lagreg_t    lr_rego1;
    lagreg_t    lr_rego2;
    lagreg_t    lr_rego3;
    lagreg_t    lr_rego4;
    lagreg_t    lr_rego5;
    lagreg_t    lr_rego6;
    lagreg_t    lr_rego7;
}

version (D_LP64)
{
    alias _la_sparc_regs La_sparcv9_regs;
    struct La_amd64_regs
    {
        lagreg_t        lr_rsp;
        lagreg_t        lr_rbp;
        lagreg_t        lr_rdi;     /* arg1 */
        lagreg_t        lr_rsi;     /* arg2 */
        lagreg_t        lr_rdx;     /* arg3 */
        lagreg_t        lr_rcx;     /* arg4 */
        lagreg_t        lr_r8;      /* arg5 */
        lagreg_t        lr_r9;      /* arg6 */
    } 
}
else
{
    alias _la_sparc_regs La_sparcv8_regs;
    struct LA_i86_regs
    {
        lagreg_t        lr_esp;
        lagreg_t        lr_ebp;
    }
}

struct Link_map
{
    c_ulong     l_addr;
    char*       l_name;
    version (D_64)
        Elf64_Dyn*  l_ld;
    else
        Elf32_Dyn*  l_ld;
    Link_map*   l_next;
    Link_map*   l_prev;
    char*       l_refname;
}

uint    la_version(uint);
void    la_activity(uintptr_t*, uint);
void    la_preinit(uintptr_t*);
char*   la_objsearch(in char*, uintptr_t*, uint);
uint    la_objopen(Link_map*, Lmid_t, uintptr_t*);
uint    la_objclose(uintptr_t*);
int     la_objfilter(uintptr_t*, in char*, uintptr_t*, uint);

version (D_LP64)
{
    uintptr_t la_amd64_pltenter(Elf64_Sym*, uint, uintptr_t*, uintptr_t*,
                                La_amd64_regs*, uint, in char*);
    uintptr_t la_symbind64(Elf64_Sym*, uint, uintptr_t*, uintptr_t*, uint*,
                           in char*);
    uintptr_t la_sparcv9_pltenter(Elf64_Sym*, uint, uintptr_t*, uintptr_t*,
                                  La_sparcv9_regs*, uint, in char*);
    uintptr_t la_pltexit64(Elf64_Sym*, uint, uintptr_t*, uintptr_t, in char*);
}
else
{
    uintptr_t la_symbind32(Elf32_Sym*, uint, uintptr_t*, uintptr_t*, uint*);
    uintptr_t la_sparcv8_pltenter(Elf32_Sym*, uint, uintptr_t*, uintptr_t*,
                                  La_sparcv8_regs*, uint*);
    uintptr_t la_i86_pltenter(Elf32_Sym*, uint, uintptr_t*, uintptr_t*,
                              La_i86_regs*, uint*);
    uintpt_t la_pltexit(Elf32_Sym*, uint, uintptr_t*, uintptr_t*, uintptr_t);
}

template ElfW(string type)
{
    version (D_LP64)
        mixin("alias Elf64_" ~ type ~ " ElfW;");
    else
        mixin("alias Elf32_" ~ type ~ " ElfW;");
}

struct dl_phdr_info
{
    ElfW!"Addr"         dlpi_addr;
    const(char)*        dlpi_name;
    const(ElfW!"Phdr")* dlpi_phdr;
    ElfW!"Half"         dlpi_phnum;

    ulong               dlpi_adds;
    ulong               dlpi_subs;
}

private alias extern(C) int function(dl_phdr_info*, size_t, void*) __phdr_cb;
int dl_iterate_phdr(__phdr_cb __callback, void* __data);

