# Automatically generated by config; do not edit
SRCS+=$(TOP)/common/libc/printf/__printf.c
SRCS+=$(TOP)/common/libc/printf/snprintf.c
SRCS+=$(TOP)/common/libc/stdlib/atoi.c
SRCS+=$(TOP)/common/libc/string/bzero.c
SRCS+=$(TOP)/common/libc/string/memcpy.c
SRCS+=$(TOP)/common/libc/string/memmove.c
SRCS+=$(TOP)/common/libc/string/strcat.c
SRCS+=$(TOP)/common/libc/string/strchr.c
SRCS+=$(TOP)/common/libc/string/strcmp.c
SRCS+=$(TOP)/common/libc/string/strcpy.c
SRCS+=$(TOP)/common/libc/string/strlen.c
SRCS+=$(TOP)/common/libc/string/strrchr.c
SRCS+=$(TOP)/common/libc/string/strtok_r.c
SRCS+=$(KTOP)/compile/ASST2/autoconf.c
SRCS+=$(KTOP)/dev/generic/beep.c
SRCS+=$(KTOP)/dev/generic/console.c
SRCS+=$(KTOP)/dev/generic/random.c
SRCS+=$(KTOP)/dev/generic/rtclock.c
SRCS+=$(KTOP)/dev/lamebus/beep_ltimer.c
SRCS+=$(KTOP)/dev/lamebus/con_lser.c
SRCS+=$(KTOP)/dev/lamebus/emu_att.c
SRCS+=$(KTOP)/dev/lamebus/emu.c
SRCS+=$(KTOP)/dev/lamebus/lamebus.c
SRCS+=$(KTOP)/dev/lamebus/lhd_att.c
SRCS+=$(KTOP)/dev/lamebus/lhd.c
SRCS+=$(KTOP)/dev/lamebus/lrandom_att.c
SRCS+=$(KTOP)/dev/lamebus/lrandom.c
SRCS+=$(KTOP)/dev/lamebus/lser_att.c
SRCS+=$(KTOP)/dev/lamebus/lser.c
SRCS+=$(KTOP)/dev/lamebus/ltimer_att.c
SRCS+=$(KTOP)/dev/lamebus/ltimer.c
SRCS+=$(KTOP)/dev/lamebus/ltrace_att.c
SRCS+=$(KTOP)/dev/lamebus/ltrace.c
SRCS+=$(KTOP)/dev/lamebus/random_lrandom.c
SRCS+=$(KTOP)/dev/lamebus/rtclock_ltimer.c
SRCS+=$(KTOP)/fs/sfs/sfs_fs.c
SRCS+=$(KTOP)/fs/sfs/sfs_io.c
SRCS+=$(KTOP)/fs/sfs/sfs_vnode.c
SRCS+=$(KTOP)/lib/array.c
SRCS+=$(KTOP)/lib/bitmap.c
SRCS+=$(KTOP)/lib/bswap.c
SRCS+=$(KTOP)/lib/kgets.c
SRCS+=$(KTOP)/lib/kprintf.c
SRCS+=$(KTOP)/lib/misc.c
SRCS+=$(KTOP)/lib/queue.c
SRCS+=$(KTOP)/lib/uio.c
SRCS.MACHINE.mips+=$(KTOP)/arch/mips/locore/trap.c
SRCS.MACHINE.mips+=$(KTOP)/arch/mips/syscall/syscall.c
SRCS.MACHINE.mips+=$(KTOP)/arch/mips/thread/cpu.c
SRCS.MACHINE.mips+=$(KTOP)/arch/mips/thread/switchframe.c
SRCS.MACHINE.mips+=$(KTOP)/arch/mips/thread/switch.S
SRCS.MACHINE.mips+=$(KTOP)/arch/mips/thread/thread_machdep.c
SRCS.MACHINE.mips+=$(KTOP)/arch/mips/thread/threadstart.S
SRCS.MACHINE.mips+=$(KTOP)/arch/mips/vm/dumbvm.c
SRCS.MACHINE.mips+=$(KTOP)/arch/mips/vm/ram.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/adddi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/anddi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/ashldi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/ashrdi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/cmpdi2.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/divdi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/iordi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/lshldi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/lshrdi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/moddi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/muldi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/negdi2.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/notdi2.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/qdivrem.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/subdi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/ucmpdi2.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/udivdi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/umoddi3.c
SRCS.MACHINE.mips+=$(TOP)/common/gcc-millicode/xordi3.c
SRCS.MACHINE.mips+=$(TOP)/common/libc/arch/mips/setjmp.S
SRCS.MACHINE.mips+=$(KTOP)/vm/copyinout.c
SRCS+=$(KTOP)/proc/pidmanager.c
SRCS+=$(KTOP)/proc/proc.c
SRCS+=$(KTOP)/startup/hello.c
SRCS+=$(KTOP)/startup/main.c
SRCS+=$(KTOP)/startup/menu.c
SRCS.PLATFORM.sys161+=$(KTOP)/arch/mips/locore/cache-mips161.S
SRCS.PLATFORM.sys161+=$(KTOP)/arch/mips/locore/exception-mips1.S
SRCS.PLATFORM.sys161+=$(KTOP)/arch/mips/vm/tlb-mips1.S
SRCS.PLATFORM.sys161+=$(KTOP)/arch/sys161/dev/lamebus_machdep.c
SRCS.PLATFORM.sys161+=$(KTOP)/arch/sys161/startup/start.S
SRCS+=$(KTOP)/syscall/file_syscalls.c
SRCS+=$(KTOP)/syscall/loadelf.c
SRCS+=$(KTOP)/syscall/proc_syscalls.c
SRCS+=$(KTOP)/syscall/runprogram.c
SRCS+=$(KTOP)/syscall/time_syscalls.c
SRCS+=$(KTOP)/test/arraytest.c
SRCS+=$(KTOP)/test/bitmaptest.c
SRCS+=$(KTOP)/test/fstest.c
SRCS+=$(KTOP)/test/malloctest.c
SRCS+=$(KTOP)/test/synchtest.c
SRCS+=$(KTOP)/test/threadtest.c
SRCS+=$(KTOP)/test/tt3.c
SRCS+=$(KTOP)/test/uw-tests.c
SRCS+=$(KTOP)/thread/clock.c
SRCS+=$(KTOP)/thread/spinlock.c
SRCS+=$(KTOP)/thread/spl.c
SRCS+=$(KTOP)/thread/synch.c
SRCS+=$(KTOP)/thread/thread.c
SRCS+=$(KTOP)/thread/threadlist.c
SRCS+=$(KTOP)/vfs/device.c
SRCS+=$(KTOP)/vfs/devnull.c
SRCS+=$(KTOP)/vfs/fdManager.c
SRCS+=$(KTOP)/vfs/filedescriptor.c
SRCS+=$(KTOP)/vfs/vfscwd.c
SRCS+=$(KTOP)/vfs/vfslist.c
SRCS+=$(KTOP)/vfs/vfslookup.c
SRCS+=$(KTOP)/vfs/vfspath.c
SRCS+=$(KTOP)/vfs/vnode.c
SRCS+=$(KTOP)/vm/kmalloc.c
SRCS+=$(KTOP)/vm/uw-vmstats.c