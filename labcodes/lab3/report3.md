### 前言
本次实验主要涉及到虚拟内存管理(VMM)，了解page fault,页面置换算法

#### 练习1：给未被映射的地址映射上物理页　
需要解决的就是page fault ．当虚拟页面没有与之对应的物理页面，发生缺页中断，这里我们要写的就是中断处理函数．
下面有几个信息有助于帮助我们来处理page中断
- 导致缺页中断的linear address 存储在cr2寄存器
- 当中断发生时候，由硬件设置的err_code 保存在stack．page fault 对应的 err_code 告诉我们下面信息
	-  bit 0　P  flag:用来判断page fault 是由于page not present(0)还是访问权限异常(1)
	- bit 1 W/R flag:  read(0),write(1)
	- bit 2 U/S flag: processor was executing at user mode (1) or supervisor mode (0) at the time of the exception

具体来看我们需要实现的代码：
```c
do_pgfault(struct mm_struct *mm, uint32_t  error_code, uintptr_t  addr){
	/*处理error_code 确保产生page fault原因的确是page not present*/
	pass
	/* IF (write an existed addr flag=3) OR
	* (write an non_existed addr && addr is writable) OR
	* (read an non_existed addr && addr is readable)
	* THEN
* continue process
*/
//// your code 
#endif
	// get_pte不能保证table 里面的地址有效？ 即使bool create=1 get_pte里面已经调用了一次alloc_page
	//get！！！ 这一步只是设置了table里面entry 但是不能保证entey指向的地址有效
	/*************/
	//页表本身需要占用物理内存来存放，如果addr对应的pte不存在，就需要分配物理内存来存放pte，之前的理解都不对
	ptep=get_pte(mm->pgdir,addr,1); 
	if(ptep==NULL) goto failed;
	if(*ptep==0) {
		if(pgdir_alloc_page(mm->pgdir,addr,perm)==NULL) goto failed;}
	else{
		if(swap_init_ok){
			struct Page* page=NULL;
			swap_in(mm,addr,&page); //从磁盘将addr对应page换入
			page_insert(mm->pgdir,page,addr,perm); //建立la<->pa
			swap_map_swappable(mm,addr,page,1);//[1]
			page->pra_vaddr=addr;//[2]
		}
	}

```
整个的思路：
- 先去查找page table 如果没有对应项就创建一个page table entry ，这里之前我理解有误，没明白get_pte()里面调用的alloc_page()和之后pgdir_alloc_page()里面调用的alloc_page()具体作用。

	get_pte()调用分配page目的在于本身page table entry 就需要占用一个物理page来保存，分配了物理内存用来保存pte，但是这个不代表pte指向的地址有效(la->pa建立了映射关系），这个就是下面pgdir_alloc_page()需要做的。
- 如果pte里面项不为空，结合之前的page fault errcode 判断，确定了对应的物理页存在swap 磁盘，需要置换。

	具体来看下pte里面如何来表示swap entry
	```c
		/* *
		* swap_entry_t
		* --------------------------------------------
		* | offset | reserved | 0 |
		* --------------------------------------------
		* 24 bits 7 bits 1 bit
		* */
	```
	存在位设为0,高24位用来查找置换页面在磁盘第一个sector
- [1]`swap_map_swappable(mm,addr,page,1);` 这个函数需要结合具体的页面置换算法来理解，具体来看FIFO的实现,这个对应了我们的**EXERCISE 2 part1**
	```c
	static  int
	_fifo_map_swappable(struct mm_struct *mm, uintptr_t  addr, struct Page *page, int  swap_in)
	{
	list_entry_t  *head=(list_entry_t*) mm->sm_priv;
	list_entry_t  *entry=&(page->pra_page_link);
	assert(entry !=  NULL  && head !=  NULL);
	//record the page access situlation
	//(1)link the most recent arrival page at the back of the pra_list_head qeueue.
	list_add(head,entry); //老是在想这其余参数有什么作用．．．
	return  0;
	}
	```

   根据FIFO原理，在`mm_struct`维护了一个用于页面访问先后顺序的链表头，相应的在`Page`里面新添加了一个成员`pra_page_link`。这个函数的实现很简单，需要注意的就是最先访问的页面会在链表尾部。
	
	其次,`int swap_in`以及虚拟地址`addr`在FIFO里面并没有用到，最开始给我造成了不少困惑。

### 练习2-完成基于FIFO的页面替换算法

#### part1
 主要实现了如何按照页面访问顺序，维护链表，只要理解了相应的数据结构，具体的实现参照之前的练习1。
 
#### part2-选择待置换页面
直接看代码实现
```c
static  int
_fifo_swap_out_victim(struct mm_struct *mm, struct Page **  ptr_page, int  in_tick) 
{
	list_entry_t  *head=(list_entry_t*) mm->sm_priv;
	assert(head !=  NULL);
	assert(in_tick==0);
	/* Select the victim */	
	/*LAB3 EXERCISE 2: YOUR CODE*/
	//(1) unlink the earliest arrival page in front of pra_list_head qeueue
	//(2) assign the value of *ptr_page to the addr of this page
	list_entry_t* le=head->prev; //seleect tail　这里可以理解了，因为之前是表头插入，所以新来的总是在表头，删去时间最长的在表尾部
	assert(le!=NULL);
	struct Page* page=  le2page(le,pra_page_link);
	list_del(le);
	*ptr_page=page; //将待置换的page，保存到传入参数
	return  0;
}
```
需要注意点的在对应代码做了注释。

-----------------




#### Q&&A
Q：页目录项（Page Directory Entry）和页表项（Page Table Entry）中组成部分对ucore实现页替换算法的潜在用处
>A: 

Q:如果ucore的缺页服务例程在执行过程中访问内存，出现了页访问异常，请问硬件要做哪些事情？
>A:


#### 一开始没有充分理解的知识点
- 一个页面被置换到硬盘上，操作系统如何表示
当PTE(page table entry)表示一般意义的物理页，维护了虚存的映射关系以及各种权限，最明显的是PTE_P(存在位)被标记；

	当PTE被用来描述被置换到磁盘上的物理页时，其PTE_P置空，其次对应的映射关系为如何找到磁盘上对应扇区。具体来说32bit的高24bit(包括了原来的20bit frame no)用来表示该物理页在磁盘起始扇区位置。

遇到的bug:
```cpp
if(*ptep==0){
pgdir_alloc_page(mm->pgdir,addr,perm);
}
else{
	if(swap_init_ok){
	struct Page* page=NULL;
	swap_in(mm,addr,&page);
	page_insert(mm->pgdir,page,addr,perm);
	swap_map_swappable(mm,addr,page,1);
	page->pra_vaddr=addr; //最开始写没注意到的
}
```
出现错误：

    page fault at 0x00005000: K/W [no page found].
	kernel panic at kern/mm/swap.c:101:
    assertion failed: (*ptep & PTE_P) != 0


在做fifo时候
``` cpp
static  int _fifo_swap_out_victim(struct mm_struct *mm, struct Page **  ptr_page, int  in_tick) //为什么是二级指针
{
list_entry_t  *head=(list_entry_t*) mm->sm_priv;
assert(head !=  NULL);
assert(in_tick==0);
/* Select the victim */
/*LAB3 EXERCISE 2: YOUR CODE*/
//(1) unlink the earliest arrival page in front of pra_list_head qeueue
//(2) assign the value of *ptr_page to the addr of this page
list_entry_t* le=head->prev; //seleect tail　这里可以理解了，因为之前是表头插入，所以新来的总是在表头，删去时间最长的在表尾部
assert(le!=NULL);
struct Page* page=  le2page(le,pra_page_link); //这里通过list entry->page ，但是page里面有两个数据成员类型都是　list_entry_t 使用page_link有什么问题？
list_del(le);
*ptr_page=page;　//这一步的目的是？
return  0;
}
```
### 心得
1. 通过step调试page fault 能够很清楚的看到发生page fault 中断之后执行过程：
` *(unsigned char *)0x2000 = 0x0b; ` //访问不存在page 产生page fault
    ` jmp __alltraps`       在这里将段寄存器压入stack 形成trapframe,加载内核段
    代码之下无细节
