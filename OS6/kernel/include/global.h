#define EXTERN extern
#ifdef Global
#undef EXTERN
#define EXTERN 
#endif
EXTERN int DispPos;
EXTERN u8 gdt_ptr[6];
EXTERN descriptor gdt[GDT_SIZE];
EXTERN u8 idt_ptr[6];
EXTERN gate idt[IDT_SIZE];
EXTERN tss  g_tss;
EXTERN pcb* p_ready;
EXTERN pcb  pcb_table[NR_TASKS];
EXTERN char task_stack[STACK_SIEZ_TEST_A_LEN];


