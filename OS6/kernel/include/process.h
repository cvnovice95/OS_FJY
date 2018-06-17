#ifndef _PROCESS_H
#define _PROCESS_H
typedef struct s_stackframe
{
	u32 gs;
	u32 fs;
	u32 es;
	u32 ds;
	u32 edi;
	u32 esi;
	u32 ebp;
	u32 kernel_esp;
	u32 ebx;
	u32 edx;
	u32 ecx;
	u32 eax;
	u32 retaddr;
	u32 eip;
	u32 cs;
	u32 eflags;
	u32 esp;
	u32 ss;
}stackframe;

typedef struct s_pcb
{
	stackframe regs;
	u16 ldt_sel;
	descriptor ldts[LDT_SIZE];
	u32 pid;
	char p_name[16];
}pcb;

#define NR_TASKS 1
#define STACK_SIEZ_TEST_A 0x8000
#define STACK_SIEZ_TEST_A_LEN STACK_SIEZ_TEST_A
#endif