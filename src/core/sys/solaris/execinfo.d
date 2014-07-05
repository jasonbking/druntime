/**
 * D header file for Solaris.
 *
 * Copyright: Copyright 2014 Jason King.
 * License:   $(LINK2 http://www.boost.org/LICENSE_1_0.txt, Boost License 1.0)
 * Authors:   Jason King
 */
module core.sys.solaris.execinfo;

version (Solaris):
extern (C):
nothrow:

int backtrace(void** buffer, int size);
char** backtrace_symbols(const(void*)* buffer, int size);
void backtrace_symbols_fd(const(void*)* buffer, int size, int fd);
