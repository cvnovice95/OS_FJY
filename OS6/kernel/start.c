#include "kernel.h"
#include "process.h"
#include "klib.h"
#include "interrupt.h"
#include "global.h"
#include "protect.h"
void cstart()
{
	disp_str("\n\n\n\n\n\n\n\n\n\n");
//disp_str("\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n");
disp_str("  ______                  ______                      _____    _____   \n");
disp_str("  | ___\\                  | ___\\                    |  _  |  /  ___|  \n");
disp_str("  | |_/ /   __ _    ___   | |_/ /  __ _     ___     | | | | \\ `--.   \n");
disp_str("  | ___\\   / _` |  / _ \\  | ___\\  / _` |   / _  \\   | | | |  _`--.\\  \n");
disp_str("  | |_/ / | (_| | | (_) | | |_/ / |(_| |  | (_) |   \\ \\_/ / /\\__/ /  \n");
disp_str("  \\____/   \\__,_|  \\___/  \\____/  \\__,_|   \\___/     \\___/ \\_____/  \n");
    disp_str("--------\"cstart\" start------\n");
	memcpy(&gdt,(void*)(*(u32*)(&gdt_ptr[2])),(*(u16*)(&gdt_ptr[0]))+1);
	u16 *p_gdt_limit = (u16*)(&gdt_ptr[0]);
	u32 *p_gdt_base = (u32*)(&gdt_ptr[2]);
	*p_gdt_limit = (GDT_SIZE*sizeof(descriptor))-1;
	*p_gdt_base = (u32)&gdt;

	u16 *p_ldt_limit = (u16*)(&idt_ptr[0]);
	u32 *p_ldt_base = (u32*)(&idt_ptr[2]);
	*p_ldt_limit = (IDT_SIZE*sizeof(gate))-1;
	*p_ldt_base = (u32)&idt;
   
    init_interrupt();
    init_descriptor();
	disp_str("--------\"cstart\" ends------\n");
}