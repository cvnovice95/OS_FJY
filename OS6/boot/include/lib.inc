; lib.inc
; DispAL 用来显示一个字节
DispAL:
	push ecx
	push edx
	push edi                ;保护寄存器

	mov edi,[dwDispPos]     ;dwDispPos是显存偏移量

	mov ah,0fh              ;0000b black background 1111b white word

	mov dl,al               ; al is will byte(8bit) to show

	shr al,4
	mov ecx,2               ;loop counter

.begin:
    and al,01111b         ;reserve low 4 bit
    cmp al,9
    ja .1
    add al,'0'            ;num-> ascii num charactor
    jmp .2
  .1:
    sub al,0ah
    add al,'A'
  .2:
    mov [gs:edi],ax
    add edi,2

    mov al,dl
    loop .begin

    mov [dwDispPos],edi

    pop edi
    pop edx
    pop ecx

    ret
；DispInt 显示一个整数 一个字节一字节显示
DispInt:
	mov eax,[esp+4]
	shr eax,24
	call DispAL

	mov eax,[esp+4]
	shr eax,16
	call DispAL

	mov eax,[esp+4]
	shr eax,8
	call DispAL

	mov eax,[esp+4]
	call DispAL

	mov ah,07h
	mov al,'h'
    
    push edi
    mov edi,[dwDispPos]
    mov [gs:edi],ax
    add edi,4
    mov [dwDispPos],edi
    pop edi

    ret
；DispStr 根据字符串地址显示 字符串
 DispStr:
 	push ebp
 	mov ebp,esp

 	push ebx
 	push esi
 	push edi

 	mov esi,[ebp+8]
 	mov edi,[dwDispPos]
 	mov ah,0fh
 .1:
   lodsb
   test al,al  ;al & al=>result 
   jz .2
   cmp al,0Ah
   jnz .3
   push eax
   mov eax,edi
   mov bl,160
   div bl
   and eax,0ffh
   inc eax
   mov bl,160
   mul bl
   mov edi,eax
   pop eax
   jmp .1
 .3:
   mov [gs:edi],ax
   add edi,2
   jmp .1
 .2:
   mov [dwDispPos],edi

   pop edi
   pop esi
   pop ebx
   pop ebp

   ret
；DispReturn 回车
DispReturn:
    push szReturn
    call DispStr

    add esp,4  ;point to DispReturn ReturnAddress

    ret
；MemCpy 内存拷贝
MemCpy:
  push ebp
  mov ebp,esp

  push edi
  push esi
  push ecx

  mov edi,[ebp+8] ;destination
  mov esi,[ebp+12] ;src
  mov ecx,[ebp+16] ;counter

.1:
  cmp ecx,0
  jz .2
  mov al,[ds:esi]
  inc esi

  mov byte[es:edi],al
  inc edi
  
  dec ecx
  jmp .1
.2:
  mov eax,[ebp+8]

  pop ecx
  pop esi
  pop edi
  mov esp,ebp
  pop ebp

  ret


    
