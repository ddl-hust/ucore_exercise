### 准备工作
和之前练习一样，需要将之前lab1,2,3实验代码merge到lab4才能开始下一步．

### 练习１－分配并初始化一个进程控制块
我们需要填写的函数`alloc_proc()`,这个函数只在创建第一个内核线程idle时候被调用

初始化结构体proc_struct 关键数据成员`tf`,`contecxt`,`mm`
- `mm`:内存管理的信息，包括内存映射列表、页表指针等。mm成员变量在lab3中用于虚存管理。但在实际OS中，内核线程常驻内存，不需要考虑swap page问题，在lab5中涉及到了用户进程，才考虑进程用户内存空间的swap page问题，mm才会发挥作用。所以在lab4中mm对于内核线程就没有用了，这样内核线程的proc_struct的成员变量*mm=0是合理的。mm里有个很重要的项pgdir，记录的是该进程使用的一级页表的物理地址。由于*mm=NULL，所以在proc_struct数据结构中需要有一个代替pgdir项来记录页表起始地址，这就是proc_struct数据结构中的cr3成员变量。
- `context`:进程的上下文，用于进程切换（参见switch.S）。在 uCore中，所有的进程在内核中也是相对独立的（例如独立的内核堆栈以及上下文等等）。使用 context 保存寄存器的目的就在于在内核态中能够进行上下文之间的切换。实际利用context进行上下文切换的函数是在kern/process/switch.S中定义switch_to。
- `tf`: 中断帧的指针，总是指向内核栈的某个位置：当进程从用户空间跳到内核空间时，中断帧记录了进程在被中断前的状态。



内核线程特点
* 内核线程只运行在内核态而用户进程会在在用户态和内核态交替运行
* 所有内核线程直接使用共同的ucore内核内存空间，不需为每个内核线程维护单独的内存空间而用户进程需要维护各自的用户内存空间


### 遇到的问题
- proc->context 如何初始化　里面都是一些寄存器
- `age fault at 0x00000000: K/R [no page found].
kernel panic at kern/trap/trap.c:165:
    unhandled page fault.`
```
pgfault_handler(struct trapframe *tf) {
    extern struct mm_struct *check_mm_struct;
    print_pgfault(tf);
    if (check_mm_struct != NULL) {
        return do_pgfault(check_mm_struct, tf->tf_err, rcr2());
    }
    panic("unhandled page fault.\n");
}
```

