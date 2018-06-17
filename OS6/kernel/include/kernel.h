#ifndef _KERNEL_H
#define _KERNEL_H

#define PUBLIC
#define PRIVATE static
typedef unsigned char u8;
typedef unsigned short u16;
typedef unsigned int u32;
//GDT 和 IDT 和 LDT 的大小
#define GDT_SIZE 128
#define IDT_SIZE 256
#define LDT_SIZE 2
/* GDT 描述符 权限 */
#define	PRIVILEGE_KRNL	0
#define	PRIVILEGE_TASK	1
#define	PRIVILEGE_USER	3

#define	RPL_KRNL	0
#define	RPL_TASK	1
#define	RPL_USER	3

typedef struct s_descriptor
{
	u16  limit_low;
	u16  base_low;
	u8   base_mid;
	u8   attr1;
	u8   attr2_limit_high;
	u8   base_high;
}descriptor;
/* 门描述符 */
typedef struct s_gate
{
	u16	offset_low;	/* Offset Low */
	u16	selector;	/* Selector */
	u8	dcount;		/* 该字段只在调用门描述符中有效。如果在利用
				   调用门调用子程序时引起特权级的转换和堆栈
				   的改变，需要将外层堆栈中的参数复制到内层
				   堆栈。该双字计数字段就是用于说明这种情况
				   发生时，要复制的双字参数的数量。*/
	u8	attr;		/* P(1) DPL(2) DT(1) TYPE(4) */
	u16	offset_high;	/* Offset High */
}gate;
typedef struct s_tss
{
	u32 backLink;
	u32 esp0;
	u32 ss0;
	u32 esp1;
	u32 ss1;
	u32 esp2;
	u32 ss2;
	u32 cr3;
	u32 eip;
	u32 eflags;
	u32 eax;
	u32 ecx;
	u32 edx;
	u32 ebx;
	u32 esp;
	u32 ebp;
	u32 esi;
	u32 edi;
	u32 es;
	u32 cs;
	u32 ss;
	u32 ds;
	u32 fs;
	u32 gs;
	u32 ldt_s;
	u16 trapgate;
	u16 IOBase;
}tss;
/* GDT */
/* 描述符索引 */
#define	INDEX_DUMMY		0	    // 
#define	INDEX_FLAT_C	1	    // LOADER 里面已经确定了的.
#define	INDEX_FLAT_RW	2	    // 
#define	INDEX_VIDEO		3	    // 
#define INDEX_PAGE_DIR  4
#define INDEX_PAGE_TBL  5
#define INDEX_TSS       6
#define INDEX_FIRST_LDT 7

/* 选择子 */
#define	SELECTOR_DUMMY		   0		// 
#define	SELECTOR_FLAT_C		0x08		// LOADER 里面已经确定了的.
#define	SELECTOR_FLAT_RW	0x10		// 
#define	SELECTOR_VIDEO		0x18+3        // <-- RPL=3
#define SELECTOR_PAGE_DIR   0x20
#define SELECTOR_PAGE_TBL   0x28

//LDT 选择子 和 TSS 选择子
#define SELECTOR_TSS        0x30
#define SELECTOR_FIRST_LDT  0x38

#define	SELECTOR_KERNEL_CS	SELECTOR_FLAT_C
#define	SELECTOR_KERNEL_DS	SELECTOR_FLAT_RW
#define	SELECTOR_KERNEL_GS	SELECTOR_VIDEO
//选择子属性
#define	SA_RPL_MASK	0xFFFC
#define	SA_RPL0		0
#define	SA_RPL1		1
#define	SA_RPL2		2
#define	SA_RPL3		3

#define	SA_TI_MASK	0xFFFB
#define	SA_TIG		0
#define	SA_TIL		4
/* 描述符类型值说明 */
#define	DA_32			0x4000	/* 32 位段				*/
#define	DA_LIMIT_4K		0x8000	/* 段界限粒度为 4K 字节			*/
#define	DA_DPL0			0x00	/* DPL = 0				*/
#define	DA_DPL1			0x20	/* DPL = 1				*/
#define	DA_DPL2			0x40	/* DPL = 2				*/
#define	DA_DPL3			0x60	/* DPL = 3				*/
/* 存储段描述符类型值说明 */
#define	DA_DR			0x90	/* 存在的只读数据段类型值		*/
#define	DA_DRW			0x92	/* 存在的可读写数据段属性值		*/
#define	DA_DRWA			0x93	/* 存在的已访问可读写数据段类型值	*/
#define	DA_C			0x98	/* 存在的只执行代码段属性值		*/
#define	DA_CR			0x9A	/* 存在的可执行可读代码段属性值		*/
#define	DA_CCO			0x9C	/* 存在的只执行一致代码段属性值		*/
#define	DA_CCOR			0x9E	/* 存在的可执行可读一致代码段属性值	*/
/* 系统段描述符类型值说明 */
#define	DA_LDT			0x82	/* 局部描述符表段类型值			*/
#define	DA_TaskGate		0x85	/* 任务门类型值				*/
#define	DA_386TSS		0x89	/* 可用 386 任务状态段类型值		*/
#define	DA_386CGate		0x8C	/* 386 调用门类型值			*/
#define	DA_386IGate		0x8E	/* 386 中断门类型值			*/
#define	DA_386TGate		0x8F	/* 386 陷阱门类型值			*/
#endif