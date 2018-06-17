#include "kernel.h"
#include "klib.h"
#include "process.h"
#include "global.h"
void restart();
void TestA();
int kernel_main(){
	disp_str("-----\"kernel_main\" begins-----\n");

	pcb * p_proc = pcb_table;
	p_proc->ldt_sel = SELECTOR_FIRST_LDT;
	memcpy(&(p_proc->ldts[0]),&gdt[SELECTOR_KERNEL_CS>>3],sizeof(descriptor));
	p_proc->ldts[0].attr1 = DA_C|PRIVILEGE_TASK<<5;
	memcpy(&(p_proc->ldts[1]),&gdt[SELECTOR_KERNEL_DS>>3],sizeof(descriptor));
	p_proc->ldts[1].attr1 = DA_DRW|PRIVILEGE_TASK<<5;

	p_proc->regs.cs	= (0 & SA_RPL_MASK & SA_TI_MASK) | SA_TIL | RPL_TASK;
	p_proc->regs.ds	= (8 & SA_RPL_MASK & SA_TI_MASK) | SA_TIL | RPL_TASK;
	p_proc->regs.es	= (8 & SA_RPL_MASK & SA_TI_MASK) | SA_TIL | RPL_TASK;
	p_proc->regs.fs	= (8 & SA_RPL_MASK & SA_TI_MASK) | SA_TIL | RPL_TASK;
	p_proc->regs.ss	= (8 & SA_RPL_MASK & SA_TI_MASK) | SA_TIL | RPL_TASK;
	p_proc->regs.gs	= (SELECTOR_KERNEL_GS & SA_RPL_MASK) | RPL_TASK;
	p_proc->regs.eip= (u32)TestA;
	p_proc->regs.esp= (u32) task_stack + STACK_SIEZ_TEST_A_LEN;
	p_proc->regs.eflags = 0x1202;	// IF=1, IOPL=1, bit 2 is always 1.
	p_ready=pcb_table;
	restart();
	while(1){}
}
void TestA()
{
	int i = 0;
	while(1){
		disp_str("Thread A:");
		disp_int(i++);
		disp_str(".");
		delay(100);
	}
}
