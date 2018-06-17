
#include "kernel.h"
#include "process.h"
#include "klib.h"
#include "interrupt.h"
#include "global.h"
// Exception 
void hwint0();
void hwint1();
void hwint2();
void hwint3();
void hwint4();
void hwint5();
void hwint6();
void hwint7();
void hwint8();
void hwint9();
void hwint10();
void hwint11();
void hwint12();
void hwint13();
void hwint14();
void hwint15();
void hwint16();
void hwint17();
void hwint18();
void hwint19();
// HardWare Interrupt Master
void hwint20();
void hwint21();
void hwint22();
void hwint23();
void hwint24();
void hwint25();
void hwint26();
void hwint27();
// HardWare Interrupt Slave
void hwint28();
void hwint29();
void hwint30();
void hwint31();
void hwint32();
void hwint33();
void hwint34();
void hwint35();
 typedef void (*func_handler)();
// Vector [0h-ffh](0-255)
static void load_int_desc(u8 vector,u8 desc_type,func_handler handle,u8 privilege){
	gate * p_gate = &idt[vector];
	u32 base = (u32)handle;
	p_gate->offset_low = base & 0xffff;
	p_gate->selector = SELECTOR_KERNEL_CS;
	p_gate->dcount = 0;
	p_gate->attr = desc_type|privilege<<5;
	p_gate->offset_high = (base>>16)&0xffff;
}
void init_8259A(){
	out_byte(INT_M_CTL,0x11);  //M_ICW1
	out_byte(INT_S_CTL,0x11);  //S_ICW1

	out_byte(INT_M_MASKCTL,INT_VECTOR_IRQ0);  //M_ICW2  0x20
	out_byte(INT_S_MASKCTL,INT_VECTOR_IRQ8);  //S_ICW2  0x28

	out_byte(INT_M_MASKCTL,0x04);  //M_ICW3
	out_byte(INT_S_MASKCTL,0x02);  //S_ICW3

	out_byte(INT_M_MASKCTL,0x1);  //M_ICW4
	out_byte(INT_S_MASKCTL,0x1);  //S_ICW4

	out_byte(INT_M_MASKCTL,0xFD);  //M_OCW1
	out_byte(INT_S_MASKCTL,0xFF);  //S_OCW1

}
void init_interrupt(){
	init_8259A();

	// 全部初始化成中断门(没有陷阱门)
	load_int_desc(INT_VECTOR_0,	DA_386IGate,
		      hwint0,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_1,		DA_386IGate,
		      hwint1,	PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_2,		DA_386IGate,
		      hwint2,			PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_3,	DA_386IGate,
		      hwint3,	PRIVILEGE_USER);

	load_int_desc(INT_VECTOR_4,	DA_386IGate,
		      hwint4,			PRIVILEGE_USER);

	load_int_desc(INT_VECTOR_5,	DA_386IGate,
		      hwint5,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_6,	DA_386IGate,
		      hwint6,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_7,	DA_386IGate,
		      hwint7,	PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_8,	DA_386IGate,
		      hwint8,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_9,	DA_386IGate,
		      hwint9,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_10,	DA_386IGate,
		      hwint10,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_11,	DA_386IGate,
		      hwint11,	PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_12,	DA_386IGate,
		      hwint12,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_13,	DA_386IGate,
		      hwint13,	PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_14,	DA_386IGate,
		      hwint14,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_15,	DA_386IGate,
		      hwint15,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_16,	DA_386IGate,
		      hwint16,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_17,	DA_386IGate,
		      hwint17,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_18,	DA_386IGate,
		      hwint18,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_19,	DA_386IGate,
		      hwint19,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_IRQ0+0,	DA_386IGate,
		      hwint20,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_IRQ0+1,	DA_386IGate,
		      hwint21,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_IRQ0+2,	DA_386IGate,
		      hwint22,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_IRQ0+3,	DA_386IGate,
		      hwint23,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ0+4,	DA_386IGate,
		      hwint24,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ0+5,	DA_386IGate,
		      hwint25,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ0+6,	DA_386IGate,
		      hwint26,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ0+7,	DA_386IGate,
		      hwint27,		PRIVILEGE_KRNL);

	load_int_desc(INT_VECTOR_IRQ8+0,	DA_386IGate,
		      hwint28,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ8+1,	DA_386IGate,
		      hwint29,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ8+2,	DA_386IGate,
		      hwint30,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ8+3,	DA_386IGate,
		      hwint31,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ8+4,	DA_386IGate,
		      hwint32,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ8+5,	DA_386IGate,
		      hwint33,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ8+6,	DA_386IGate,
		      hwint34,		PRIVILEGE_KRNL);
	load_int_desc(INT_VECTOR_IRQ8+7,	DA_386IGate,
		      hwint35,		PRIVILEGE_KRNL);


}
void service_irq(int irq){
	disp_str("service_irq:");
	disp_int(irq);
	disp_str("\n");
}
void exception_handler(int vec_no,int err_code,int eip,int cs,int eflags)
{
	int i;
	int text_color = 0x74; /* 灰底红字 */

	char * err_msg[] = {"#DE Divide Error",
			    "#DB RESERVED",
			    "--  NMI Interrupt",
			    "#BP Breakpoint",
			    "#OF Overflow",
			    "#BR BOUND Range Exceeded",
			    "#UD Invalid Opcode (Undefined Opcode)",
			    "#NM Device Not Available (No Math Coprocessor)",
			    "#DF Double Fault",
			    "    Coprocessor Segment Overrun (reserved)",
			    "#TS Invalid TSS",
			    "#NP Segment Not Present",
			    "#SS Stack-Segment Fault",
			    "#GP General Protection",
			    "#PF Page Fault",
			    "--  (Intel reserved. Do not use.)",
			    "#MF x87 FPU Floating-Point Error (Math Fault)",
			    "#AC Alignment Check",
			    "#MC Machine Check",
			    "#XF SIMD Floating-Point Exception"
	};

	/* 通过打印空格的方式清空屏幕的前五行，并把 disp_pos 清零 */
	DispPos = 0;
	for(i=0;i<80*5;i++){
		disp_str(" ");
	}
	DispPos = 0;

	disp_str_color("Exception! --> ", text_color);
	disp_str_color(err_msg[vec_no], text_color);
	disp_str_color("\n\n", text_color);
	disp_str_color("EFLAGS:", text_color);
	disp_int(eflags);
	disp_str_color("CS:", text_color);
	disp_int(cs);
	disp_str_color("EIP:", text_color);
	disp_int(eip);

	if(err_code != 0xFFFFFFFF){
		disp_str_color("Error code:", text_color);
		disp_int(err_code);
	}
}