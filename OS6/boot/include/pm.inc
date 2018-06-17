;Attr
;7  6  5  4  3  2  1  0  7  6   5  4  3  2  1  0
;G D/B 0 AVL {  limit }  P  {DPL}  S  {   TYPE  }
;
;P P=1表示段在内存中存在 P=0在内存中不存在
;DPL 特权级 0 1 2 3
;S  S = 1(指明该描述是数据段/代码段 描述符)  S = 0 (指明该描述符是系统段/门描述符)
;TYPE   数据段/代码段      系统段/门描述符
;=0 	只读				Und
;=1     只读,已访问         可用286TSS
;=2     读/写               LDT
;=3     读写,已访问         忙的286TSS
;=4     只读,向下扩展		286调用门
;=5     只读,向下扩展,已访问 任务门
;=6     读/写 向下扩展      286中断门
;=7     读/写 向下扩展,已访问 286陷阱门
;=8     只执行              Und
;=9     只执行,已访问       可用386TSS
;=A     执行/读             Und
;=B     执行/读,已访问      忙的386TSS
;=C     只执行,一致码段     386调用门
;=D     只执行,一致码段,已访问 und
;=E     执行/读 ,一致码段   386中断门
;=F     执行/读 ,一致码段,已访问 386陷阱门
;G=0    limit = 1B*1MB=1MB    G=1 limit =4KB*1MB=4GB
;D/B    (可执行代码段)D=1时 32 D=0 8(数据段) B=1 段的上部界限4GB;B=0 端的上部界限 64KB
; D=1 ESP   D=0 SP
DA_LIMIT_4K     equ     8000h ;段界限粒度是４Ｋ　单位跨度是４Ｋ　　Ｇ＝０单位跨度为１字节
DA_32    		equ 	4000h ;32位段
DA_DPL_0 		equ 	00h   ;DPL=0
DA_DPL_1 		equ 	20h
DA_DPL_2 		equ 	40h
DA_DPL_3 		equ 	60h

DA_DR 			equ 	90h  ;10010000 P=1 S=1 TYPE =0 存在的只读数据段
DA_DRW 			equ 	92h  ;10010010 P=1 S=1 TYPE =2 存在的可读写数据段
DA_DRWA 		equ 	93h  ;10010101 p=1 S=1 TYPE =3 存在的已访问读写数据段

DA_C 			equ 	98h  ;10011000 P=1 S=1 TYPE =8 存在的只执行代码段
DA_CR 			equ 	9ah  ;10011010 P=1 S=1 TYPE =10 存在的可执行可读代码段
DA_CC0 			equ 	9ch  ;10011100  P=1 S=1 TYPE =12 存在的只执行一致码段
DA_CC0R 		equ 	9eh  ;10011110 P=1 S=1 TYPE =14  存在的可执行可读一致码段

DA_LDT 			equ 	82h  ;10000010 P=1 S=0 TYPE =2  LDT描述符属性
DA_TaskGate 	equ 	85h  ;10000101 P=1 S=0 TYPE =5  任务门
DA_386TSS 		equ 	89h  ;10001001 P=1 S=0 TYPE =9 可用386任务状态段(TSS)
DA_386CGate 	equ 	8ch  ;10001100 P=1 S=0 TYPE =12 386调用门
DA_386IGate 	equ 	8eh  ;10001110 P=1 S=0 TYPE =14 386中断门
DA_386TGate 	equ 	8fh  ;10001111 P=1 S=0 TYPE =15 386陷阱门
;GDT Descriptor
%macro Descriptor 3
	dw %2 & 0FFFFh        ;段界限1
	dw %1 & 0FFFFh        ;段基址1
	db (%1>>16) & 0FFh    ;段基址2
	dw ((%2>>8) & 0F00h)|(%3 & 0F0FFh) ;属性1+段界限2+属性2
	db (%1>>24) & 0FFh    ;段基址3
%endmacro

;Gate selector offset DCount Attr
%macro Gate 4
	dw (%2&0ffffh)
	dw %1
	dw (%3 & 01fh)|((%4 << 8) & 0ff00h)
	dw ((%2 >> 16) & 0ffffh)
%endmacro

SA_RPL0		EQU	0	;RPL
SA_RPL1		EQU	1	; 
SA_RPL2		EQU	2	; 
SA_RPL3		EQU	3	; 

SA_TIG		EQU	0	;TI
SA_TIL		EQU	4	;

PG_P		EQU	1	; 页存在属性位
PG_RWR		EQU	0	; R/W 属性位值, 读/执行
PG_RWW		EQU	2	; R/W 属性位值, 读/写/执行
PG_USS		EQU	0	; U/S 属性位值, 系统级
PG_USU		EQU	4	; U/S 属性位值, 用户级