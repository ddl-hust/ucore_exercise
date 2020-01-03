
##  内核线程管理

### 前言

和之前练习一样，需要将之前lab1,2,3实验代码merge到lab4才能开始下一步．
这个有什么好的方法没，每次都是手动merge...用了patch 但是老是合并失败。

**整个lab的执行流:**
- `proc_init()`分配了第一个内核线程idleproc
- 调用`kernel_thread()`创建第二个内核线程initproc，有几个关键点
  - `tf.tf_regs.reg_ebx  = (uint32_t)fn;` 这个fn可以理解为fork()之后待装载的执行函数 
  - `tf.tf_eip  = (uint32_t)kernel_thread_entry;` 新建内核线程tf入口地址
 - `do_fork()` 这个是我们接下来需要实现的。拷贝parent线程的trapframe,设立context,以及将新fork的子进程添加到进程队列里面，在`fork()`里面有一个关键的函数`copy_thread()`
    - `proc->context.eip  = (uintptr_t)forkret;`这里设定了但进程切换时候，需要保存的程序计数器，因为该进程还没有执行过，所以这里实际上设定了当进程切换，待执行的第一条指令。
 
 总的来说内核进程初始化执行顺序：`proc_init()`->`kernel_thread()`->`do_fork()`->`copy_thread()`

cpu_idel()调度的顺序：`schedule()`->`proc_run`->`switch_to`->`forkret`->`__trapret:`->`kernel_thread_entry`->`init_main()[装载函数]`

 - `switch_to`：到这里就进入了汇编指令保存**from进程**的寄存器，从context恢复**to进程**的寄存器.
	
		//do-to 这一段汇编代码没有理清，各个寄存器的顺序

### 准备工作
	
- 关键数据结构`proc_struct`描述了一个进程PCB的信息

	- `mm`:内存管理的信息，包括内存映射列表、页表指针等。mm成员变量在lab3中用于虚存管理。但在实际OS中，内核线程常驻内存，不需要考虑swap page问题，在lab5中涉及到了用户进程，才考虑进程用户内存空间的swap page问题，mm才会发挥作用。所以在lab4中mm对于内核线程就没有用了，于是将其设为0。mm里有个很重要的项pgdir，记录的是该进程使用的一级页表的物理地址。由于*mm=NULL，所以在proc_struct数据结构中需要有一个代替pgdir项来记录页表起始地址，这就是proc_struct数据结构中的cr3成员变量。

  -  `context`:进程的上下文，用于进程切换（参见switch.S）。在 uCore中，所有的进程在内核中也是相对独立的（例如独立的内核堆栈以及上下文等等）。使用 context 保存寄存器的目的就在于在内核态中能够进行上下文之间的切换。实际利用context进行上下文切换的函数是在kern/process/switch.S中定义switch_to。

  -  `tf`: 中断帧的指针，总是指向内核栈的某个位置：当进程从用户空间跳到内核空间时，中断帧记录了进程在被中断前的状态。这个在lab3里面页面中断step 调试能够看到tf整个生命周期。

### [练习1]-初始化进程控制块
```c
static struct proc_struct *
alloc_proc(void)
{
    struct proc_struct *proc = kmalloc(sizeof(struct proc_struct));
    if (proc != NULL)
    {
        //LAB4:EXERCISE1 YOUR CODE
        /*
     * below fields in proc_struct need to be initialized
     *       enum proc_state state;                      // Process state
     *       int pid;                                    // Process ID
     *       int runs;                                   // the running times of Proces
     *       uintptr_t kstack;                           // Process kernel stack
     *       volatile bool need_resched;                 // bool value: need to be rescheduled to release CPU?
     *       struct proc_struct *parent;                 // the parent process
     *       struct mm_struct *mm;                       // Process's memory management field
     *       struct context context;                     // Switch here to run process
     *       struct trapframe *tf;                       // Trap frame for current interrupt
     *       uintptr_t cr3;                              // CR3 register: the base addr of Page Directroy Table(PDT)
     *       uint32_t flags;                             // Process flag
     *       char name[PROC_NAME_LEN + 1];               // Process name
     */
    }
    proc->state = PROC_UNINIT;
    proc->pid = -1;       //设置进程pid的未初始化值
    proc->cr3 = boot_cr3; //所有内核线程共用同一个pdt
    proc->parent = NULL;
    proc->mm = NULL;
    memset(&proc->context, 0, sizeof(struct context));
    proc->tf = 0;
    return proc;
}
```
**下面几点注意下**：

   - 在lab3里面page table 开启地址存在`mm`,在lab4里面只涉及到内核线程，不存在swap，为了简化数据结构，  没有用`mm`，将`boot_cr3`单独拿出来。
   
- 像`context`这样一整块内存的初始化，通过memset来完成


### [练习2]-完成fork()

```c
* do_fork -     parent process for a new child process
 * @clone_flags: used to guide how to clone the child process
 * @stack:       the parent's user stack pointer. if stack==0, It means to fork a kernel thread.
 * @tf:          the trapframe info, which will be copied to child process's proc->tf
 */
int do_fork(uint32_t clone_flags, uintptr_t stack, struct trapframe *tf)
{
    int ret = -E_NO_FREE_PROC;
    struct proc_struct *proc;
    if (nr_process >= MAX_PROCESS)
    { //超出最大进程数
        goto fork_out;
    }
    ret = -E_NO_MEM;
    
    //    1. call alloc_proc to allocate a proc_struct
    //    2. call setup_kstack to allocate a kernel stack for child process
    //    3. call copy_mm to dup OR share mm according clone_flag
    //    4. call copy_thread to setup tf & context in proc_struct
    //    5. insert proc_struct into hash_list && proc_list
    //    6. call wakeup_proc to make the new child process RUNNABLE
    //    7. set ret vaule using child proc's pid
    proc = alloc_proc();
    setup_kstack(proc);
    copy_mm(clone_flags, proc);
    copy_thread(proc, stack, tf);
    proc->pid=get_pid();
    hash_proc(proc);
    list_add(&proc_list, &(proc->list_link));
    wakeup_proc(proc);
    ret=proc->pid;

fork_out:
    return ret;

bad_fork_cleanup_kstack:
    put_kstack(proc);
bad_fork_cleanup_proc:
    kfree(proc);
    goto fork_out;
}
```
基本上按照提示来写就没问题，具体来看下`copy_thread()`
```c
// copy_thread - setup the trapframe on the  process's kernel stack top and
//             - setup the kernel entry point and stack of process
static void
copy_thread(struct proc_struct *proc, uintptr_t esp, struct trapframe *tf)
{
    proc->tf = (struct trapframe *)(proc->kstack + KSTACKSIZE) - 1;
    *(proc->tf) = *tf;
    proc->tf->tf_regs.reg_eax = 0; //返回值寄存器
    proc->tf->tf_esp = esp;//作为内核线程 用户esp为0
    proc->tf->tf_eflags |= FL_IF;//enable interrupt

    proc->context.eip = (uintptr_t)forkret;
    proc->context.esp = (uintptr_t)(proc->tf);
}
```
 这里主要就是设置了tf&&context,其中tf位于内核stack top,stack在do_fork()里面先设置了。

设置好中断帧后，最后就是设置initproc的进程上下文，（process context，也称执行现场）了。只有设置好执行现场后，一旦uCore调度器选择了initproc执行，就需要根据initproc->context中保存的执行现场来恢复initproc的执行。这里设置了initproc的执行现场中主要的两个信息：上次停止执行时的下一条指令地址context.eip和上次停止执行时的堆栈地址context.esp。其实initproc还没有执行过，所以这其实就是initproc实际执行的第一条指令地址和堆栈指针。可以看出，由于initproc的中断帧占用了实际给initproc分配的栈空间的顶部，所以initproc就只能把栈顶指针context.esp设置在initproc的中断帧的起始位置。根据context.eip的赋值，可以知道initproc实际开始执行的地方在forkret函数（主要完成do_fork函数返回的处理工作）处。至此，initproc内核线程已经做好准备执行了。



-----------------------------------

    


  
### 遇到的问题

- proc->context 如何初始化　里面都是一些寄存器
>将这种大块内存空间通过memset()

-  
```
age fault at 0x00000000: K/R [no page found]. kernel panic at kern/trap/trap.c:165: unhandled page fault.
```
错误原因：

do_fork() 里面没有设置proc的pid

### 知识点

- #### 内核线程特点

  * 内核线程只运行在内核态而用户进程会在在用户态和内核态交替运行
  * 所有内核线程直接使用共同的ucore内核内存空间，不需为每个内核线程维护单独的内存空间而用户进程需要维护各自的用户内存空间
 
 
### 与参考答案比较

1. 参考答案做了比较多的异常检查

比如参考答案：

       if ((proc = alloc_proc()) == NULL) {
        goto fork_out;}
        
我的：`proc = alloc_proc();`

2.答案多了`    local_intr_save(intr_flag);`
目的是为了屏蔽中断，使得将进程快添加到链表的操作不会被打断，之后在将中断回复．　
