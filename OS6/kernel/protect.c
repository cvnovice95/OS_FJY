#include "kernel.h"
#include "klib.h"
#include "process.h"
#include "global.h"
#define liner2phy(base,vir)  (u32)(((u32)base)+((u32)vir))
static void load_gdt_desc(descriptor * p_desc,u32 base,u32 limit,u16 attr);

u32 selector2phy(int selectornum){
	descriptor *p_desc = &gdt[selectornum>>3];
	return (p_desc->base_high<<24|p_desc->base_mid<<16|p_desc->base_low);
}
static void load_gdt_desc(descriptor * p_desc,u32 base,u32 limit,u16 attr){
	p_desc->limit_low = limit & 0x0ffff;
	p_desc->base_low = base &0x0ffff;
	p_desc->base_mid = (base>>16)&0x0ffff;
	p_desc->attr1 = attr & 0x0ffff;
	p_desc->attr2_limit_high = ((limit>>16)& 0x0f)|((attr>>8)&0xf0);
	p_desc->base_high =(base>>24)&0x0ffff;
}
void init_descriptor(){
    memset(&g_tss,0,sizeof(g_tss));
    load_gdt_desc(&gdt[INDEX_TSS],liner2phy(selector2phy(SELECTOR_KERNEL_DS),&g_tss),sizeof(g_tss)-1,DA_386TSS);
    g_tss.IOBase = sizeof(g_tss);
    load_gdt_desc(&gdt[INDEX_FIRST_LDT],liner2phy(selector2phy(SELECTOR_KERNEL_DS),&(pcb_table[0].ldts[0])),2*sizeof(descriptor)-1,DA_LDT);
}