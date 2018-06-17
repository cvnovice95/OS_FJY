%include "kernel.inc"
extern cstart
extern gdt_ptr
extern idt_ptr
extern exception_handler
extern service_irq
extern DispPos

extern p_ready
extern g_tss
extern kernel_main

KERNEL_SELECTOR equ  8 ;KERNEL_SELECTOR=SelectorFlatC
[SECTION .bss]
StackSpace: resb 2*1024
StackTop:
[SECTION .text]

global restart

global hwint0
global hwint1
global hwint2
global hwint3
global hwint4
global hwint5
global hwint6
global hwint7
global hwint8
global hwint9
global hwint10
global hwint11
global hwint12
global hwint13
global hwint14
global hwint15
global hwint16
global hwint17
global hwint18
global hwint19

global hwint20
global hwint21
global hwint22
global hwint23
global hwint24
global hwint25
global hwint26
global hwint27
global hwint28
global hwint29
global hwint30
global hwint31
global hwint32
global hwint33
global hwint34
global hwint35

global _start
_start:
    mov ah,0ch
    mov al,'K'
    mov [gs:((80*1+25)*2)],ax
    mov dword[DispPos],0
	mov esp,StackTop
	sgdt [gdt_ptr]
	call cstart
	lgdt [gdt_ptr]
	lidt [idt_ptr]

	jmp KERNEL_SELECTOR:csinit
csinit:
     
    xor eax,eax
    mov ax,SELECTOR_TSS
    ltr ax
    jmp kernel_main
	;sti
	;ud2
	;jmp 0x40:0
	;hlt

hwint0:
	push	0xFFFFFFFF	; no err code
	push	0		; vector_no	= 0
	jmp	exception
hwint1:
	push	0xFFFFFFFF	; no err code
	push	1		; vector_no	= 1
	jmp	exception
hwint2:
	push	0xFFFFFFFF	; no err code
	push	2		; vector_no	= 2
	jmp	exception
hwint3:
	push	0xFFFFFFFF	; no err code
	push	3		; vector_no	= 3
	jmp	exception
hwint4:
	push	0xFFFFFFFF	; no err code
	push	4		; vector_no	= 4
	jmp	exception
hwint5:
	push	0xFFFFFFFF	; no err code
	push	5		; vector_no	= 5
	jmp	exception
hwint6:
	push	0xFFFFFFFF	; no err code
	push	6		; vector_no	= 6
	jmp	exception
hwint7:
	push	0xFFFFFFFF	; no err code
	push	7		; vector_no	= 7
	jmp	exception
hwint8:
	push	8		; vector_no	= 8
	jmp	exception
hwint9:
	push	0xFFFFFFFF	; no err code
	push	9		; vector_no	= 9
	jmp	exception
hwint10:
	push	10		; vector_no	= A
	jmp	exception
hwint11:
	push	11		; vector_no	= B
	jmp	exception
hwint12:
	push	12		; vector_no	= C
	jmp	exception
hwint13:
	push	13		; vector_no	= D
	jmp	exception
hwint14:
	push	14		; vector_no	= E
	jmp	exception
hwint15:
	push	0xFFFFFFFF	; no err code
	push	15		; vector_no	= f
	jmp	exception
hwint16:
	push	0xFFFFFFFF	; no err code
	push	16		; vector_no	= 10h
	jmp	exception
hwint17:
	push	17		; vector_no	= 11h
	jmp	exception
hwint18:
	push	0xFFFFFFFF	; no err code
	push	18		; vector_no	= 12h
	jmp	exception
hwint19:
	push	0xFFFFFFFF	; no err code
	push	19		; vector_no	= 13h
	jmp	exception

hwint20:
	push	0		; irq0
	jmp	service
hwint21:
	push	1		; irq1
	jmp	service
hwint22:
	push	2		; irq2
	jmp	service
hwint23:
	push	3		; irq3
	jmp	service
hwint24:
	push	4		; irq4
	jmp	service
hwint25:
	push	5		; irq5
	jmp	service
hwint26:
	push	6		; irq6
	jmp	service
hwint27:
	push	7		; irq7
	jmp	service
hwint28:
	push	8		; irq8
	jmp	service
hwint29:
	push	9		; irq9
	jmp	service
hwint30:
	push	10		; irq10
	jmp	service
hwint31:
	push	11		; irq11
	jmp	service
hwint32:
	push	12  	; irq12
	jmp	service
hwint33:
	push	13		; irq13
	jmp	service
hwint34:
	push	14		; irq14
	jmp	service
hwint35:
	push	15		; irq15
	jmp	service

exception:
	call	exception_handler
	add	esp, 4*2	; 让栈顶指向 EIP，堆栈中从顶向下依次是：EIP、CS、EFLAGS
	hlt
service:
	call   service_irq
	add esp,4
	hlt 
restart:
	mov esp,[p_ready]
	lldt [esp+LDT_SEL]
	lea eax,[esp+P_STACKTOP]
	mov dword[g_tss+SELECTOR_TSS],eax

	pop gs
	pop fs
	pop es
	pop ds
	popad

	add esp,4
	iretd
