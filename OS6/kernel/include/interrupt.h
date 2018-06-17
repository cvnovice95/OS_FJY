#ifndef _INTERRUPT_H
#define _INTERRUPT_H


#define INT_M_CTL  0x20
#define INT_S_CTL  0xA0

#define INT_M_MASKCTL 0x21
#define INT_S_MASKCTL 0xA1

/* 中断向量 */
#define	INT_VECTOR_0		0x0
#define	INT_VECTOR_1		0x1
#define	INT_VECTOR_2	    0x2
#define	INT_VECTOR_3		0x3
#define	INT_VECTOR_4		0x4
#define	INT_VECTOR_5		0x5
#define	INT_VECTOR_6		0x6
#define	INT_VECTOR_7		0x7
#define	INT_VECTOR_8	    0x8
#define	INT_VECTOR_9		0x9
#define	INT_VECTOR_10		0xA
#define	INT_VECTOR_11		0xB
#define	INT_VECTOR_12		0xC
#define	INT_VECTOR_13		0xD
#define	INT_VECTOR_14		0xE
#define	INT_VECTOR_15		0xF
#define	INT_VECTOR_16		0x10
#define	INT_VECTOR_17		0x11
#define	INT_VECTOR_18		0x12
#define	INT_VECTOR_19		0x13

/* 中断向量 */
#define	INT_VECTOR_IRQ0			0x20
#define	INT_VECTOR_IRQ8			0x28
void init_interrupt();
#endif