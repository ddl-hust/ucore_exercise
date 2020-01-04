## 用户进程
### 前言
这一部分实际上对应了如何实现`exec()` 即分析elf文件，将其加载到内存中。
`exit()` `kill()` 这些系统调用等

在开始做实验之前，对之前的lab有一些小的修改，有些还没有提示，有点坑。。。把没有提示的几个函数补充如下(其实自己调试最后也会发现内存报错-）
- **`trap/trap.c`**
```c
void idt_init(void) {
    int i;
    for (i = 0; i < sizeof(idt) / sizeof(struct gatedesc); i++) {
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    }
    // 添加下面这行
    // 设置给用户态用的中断门 让用户态能够进行系统调用
    SETGATE(idt[T_SYSCALL], 1, GD_KTEXT, __vectors[T_SYSCALL], DPL_USER);
    lidt(&idt_pd);
}
```
- **`proc.c/alloc_proc()`**
  ```c
	 // 新添加: 初始化进程等待状态 初始化进程相关指针
	proc->cptr=proc->optr=proc->yptr=NULL;
	proc->wait_state=0;
  ```
 
### part1  建立用户态trapframe
目的：完成系统调用之后能够返回到用户态
```c
//(6) setup trapframe for user environment
    struct trapframe *tf = current->tf;
    memset(tf, 0, sizeof(struct trapframe));
    /* LAB5:EXERCISE1 YOUR CODE
     * should set tf_cs,tf_ds,tf_es,tf_ss,tf_esp,tf_eip,tf_eflags
     * NOTICE: If we set trapframe correctly, then the user level process can return to USER MODE from kernel. So
     *          tf_cs should be USER_CS segment (see memlayout.h)
     *          tf_ds=tf_es=tf_ss should be USER_DS segment
     *          tf_esp should be the top addr of user stack (USTACKTOP)
     *          tf_eip should be the entry point of this binary program (elf->e_entry)
     *          tf_eflags should be set to enable computer to produce Interrupt
     */
    tf->tf_cs=USER_CS;
    tf->tf_ds=tf->tf_es=tf->tf_ss=USER_DS;
    tf->tf_esp=USTACKTOP;
    tf->tf_eip=elf->e_entry;
    tf->tf_eflags=FL_CF;
```
基本上按照提示做就ok，没什么难度，我觉得更加有趣的是整个`static  int load_icode(unsigned  char  *binary, size_t  size)`实现了如何解析elf可执行文件，很好的对应了《自我修养》里面加载部分，也对elf的各个段有了更加直观的理解。



### 练习2: 父进程复制自己的内存空间给子进程

创建子进程的函数do_fork在执行中将拷贝当前进程（即父进程）的用户内存地址空间中的合法内容到新进程中（子进程），完成内存资源的复制。具体是通过copy_range函数（位于kern/mm/pmm.c中）实现的，请补充copy_range的实现，确保能够正确执行。

这个函数是用来 拷贝父进程的用户内存地址空间到子进程中 share 此处没用到 不管它  
```c
    int copy_range(pde_t *to, pde_t *from, uintptr_t start, uintptr_t end, bool share) {  
     // 找到父进程的 页虚拟内存地址 和 子进程的 页虚拟内存地址 将 父进程的页 拷贝到 子进程的页  
     void* src_kvaddr = page2kva(page);  
     void* dst_kvaddr = page2kva(npage);  
     memcpy(dst_kvaddr, src_kvaddr, PGSIZE);  
     ret = page_insert(to, npage, start, perm);  
    }
```
#### 练习3: 阅读分析源代码，理解进程执行 fork/exec/wait/exit 的实现，以及系统调用的实现
-   请分析fork/exec/wait/exit在实现中是如何影响进程的执行状态的？
	- `fork` 创建新的 PCB **进程状态为 UNINIT**  
    -  `exec` 将当前进程的内存布局清除 再调用 `load_icode `读出 ELF映像中的内存布局 并填写 **进程状态不改变**  
	-` wait `当前进程若无子进程 则返回错误 若有子进程 则判定 是否为 **ZOMBIE 子进程** 有则释放子进程的资源 并返回子进程的返回状态码 。若无 ZOMBIE 状态子进程 则进入 **SLEEPING 状态** 等子进程唤醒  
	之前一直有个疑问child process 资源回收为什么需要通过parent proc?
	>  _这是因为进程要执行回收操作，就表明此进程还存在，还在执行指令，这就需要内核栈的空间不能释放，且表示进程存在的进程控制块不能释放。所以需要父进程来帮忙释放子进程无法完成的这两个资源回收工作。

	- `exit` 清除当前进程几乎所有资源(PCB和内核栈不清除) ,如果当前进程还有子进程,则需要把这些子进程的父进程指针设置为内核线程initproc，且各个子进程指针需要插入到initproc的子进程链表中。将当前进程状态设置为 **ZOMBIE**  ,若有父进程在等待当前进程exit 则 唤醒父进程。
	
-   请给出ucore中一个用户态进程的执行状态生命周期图（包执行状态，执行状态之间的变换关系，以及产生变换的事件或函数调用）。（字符方式画即可）
直接参考`proc.c`里面的进程状态转移流程图
```
-----------------------------
process state changing:
                                            
  alloc_proc                                 RUNNING
      +                                   +--<----<--+
      +                                   + proc_run +
      V                                   +-->---->--+ 
PROC_UNINIT -- proc_init/wakeup_proc --> PROC_RUNNABLE -- try_free_pages/do_wait/do_sleep --> PROC_SLEEPING --
                                           A      +                                                           +
                                           |      +--- do_exit --> PROC_ZOMBIE                                +
                                           +                                                                  + 
                                           -----------------------wakeup_proc----------------------------------
```

[详细实验文档说明](https://chyyuu.gitbooks.io/ucore_os_docs/content/lab5/lab5_3_3_process_exit_wait.html)

### 遇到的问题
1. 
```
kernel panic at kern/process/proc.c:461:
initproc exit.
```
出现上述情况的原因,用于创建用户进程的initproc被退出了，深层次的原因是创建的用户进程并没有被添加到`proc_list`相关代码部分：
```c
       {                                                                                                                                                                                          │
   │432             proc->pid = get_pid();                                                                                                                                                                 │
   │433             hash_proc(proc);                                                                                                                                                                       │
   │434             // list_add(&proc_list, &(proc->list_link));                                                                                                                                           │
   │435             set_links(proc);                                                                                                                                                                       │
   │436                                                                                                                                                                                                 │
   │437         } 
```
在`set_link`更新了`proc_list`，没搞明白-------------------------------------


2. 实验昨晚之后 `make grade` 结果如下
  ```
  badsegment:              (1.6s)
  -check result:                             OK
  -check output:                             OK
divzero:                 (1.3s)
  -check result:                             OK
  -check output:                             OK
softint:                 (1.3s)
  -check result:                             OK
  -check output:                             OK
faultread:               (1.3s)
  -check result:                             OK
  -check output:                             OK
faultreadkernel:         (1.3s)
  -check result:                             OK
  -check output:                             OK
hello:                   (1.3s)
  -check result:                             OK
  -check output:                             OK
testbss:                 (1.3s)
  -check result:                             OK
  -check output:                             OK
pgdir:                   (1.3s)
  -check result:                             OK
  -check output:                             OK
yield:                   (1.3s)
  -check result:                             OK
  -check output:                             OK
badarg:                  (1.3s)
  -check result:                             OK
  -check output:                             OK
exit:                    (1.3s)
  -check result:                             OK
  -check output:                             OK
spin:                    (2.3s)
  -check result:                             WRONG
   -e !! error: missing 'I am the parent.  Killing the child...'
   !! error: missing 'kill returns 0'
   !! error: missing 'wait returns 0'
   !! error: missing 'spin may pass.'
   !! error: missing 'all user-mode processes have quit.'
   !! error: missing 'init check memory pass.'

  -check output:                             OK
waitkill:                (2.3s)
  -check result:                             WRONG
   -e !! error: missing 'kill parent ok.'
   !! error: missing 'kill child1 ok.'
   !! error: missing 'all user-mode processes have quit.'
   !! error: missing 'init check memory pass.'

  -check output:                             OK
forktest:                (1.3s)
  -check result:                             OK
  -check output:                             OK
forktree:                (1.3s)
  -check result:                             OK
  -check output:                             OK
Total Score: 136/150
  ```
  有问题的几个地方`spin`,`waitkill`


### 知识点
- 系统调用路径
```c
vector128(vectors.S)--\>
\_\_alltraps(trapentry.S)--\>trap(trap.c)--\>trap\_dispatch(trap.c)----\>syscall(syscall.c)-
```
在syscall中，根据系统调用号来完成不同的系统调用服务。
 

