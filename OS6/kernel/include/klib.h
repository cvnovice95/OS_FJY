#ifndef _KLIB_H
#define _KLIB_H
void* memcpy(void* pDst,void* pSrc,int iSize);
void  memset(void* addr,int value,int iSize);
void disp_str(char* psInfo);
void out_byte(unsigned short port,unsigned char value);
unsigned char in_byte(unsigned short port);
void disp_str_color(char* psInfo,unsigned char color);
void disp_int(int input);
void delay(int time);
#endif
