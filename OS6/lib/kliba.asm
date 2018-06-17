extern DispPos
;[SECTION .data]
;DispPos  dd 0
[SECTION .text]
global out_byte
global in_byte
global disp_str_color
global memcpy
global memset
global disp_str

disp_str:
	push ebp
	mov ebp,esp

	mov esi,[ebp+8]
	mov edi,[DispPos]
	mov ah,0fh
.1:
	lodsb
	test al,al
	jz .end
	cmp al,0Ah
	jnz .2
	push eax,
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
 .2:
 	mov [gs:edi],ax
 	add edi,2
 	jmp .1
 .end:
 	mov [DispPos],edi
    mov esp,ebp
    pop ebp
    ret
disp_str_color:
	push ebp
	mov ebp,esp

	mov esi,[ebp+8]
	mov edi,[DispPos]
	mov ah,[ebp+12]
.1:
	lodsb
	test al,al
	jz .end
	cmp al,0Ah
	jnz .2
	push eax,
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
 .2:
 	mov [gs:edi],ax
 	add edi,2
 	jmp .1
 .end:
 	mov [DispPos],edi
    mov esp,ebp
    pop ebp
    ret
memcpy:
    push ebp
    mov ebp,esp
	push ecx
	push edi
	push esi

	mov edi,[ebp+8]
	mov esi,[ebp+12]
	mov ecx,[ebp+16]

 .1:
 	cmp ecx,0
 	jz .end
    mov al,byte[ds:esi]
    inc esi
    mov byte[es:edi],al
    inc edi
    dec ecx
    jmp .1
 .end: 
    mov eax,[ebp+8]

    pop esi
    pop edi
    pop ecx
    mov esp,ebp
    pop ebp
    ret
out_byte:
	mov edx,[esp+4]  ;port
	mov al,[esp+8]
	out dx,al
	nop
	nop
	ret
in_byte:
	mov edx,[esp+4] ;port
	xor eax,eax
	in al,dx
	nop
	nop
	ret
memset:
	push	ebp
	mov	ebp, esp

	push	esi
	push	edi
	push	ecx

	mov	edi, [ebp + 8]	; Destination
	mov	edx, [ebp + 12]	; Char to be putted
	mov	ecx, [ebp + 16]	; Counter
.1:
	cmp	ecx, 0		; 判断计数器
	jz	.2		; 计数器为零时跳出

	mov	byte [edi], dl		; ┓
	inc	edi			; ┛

	dec	ecx		; 计数器减一
	jmp	.1		; 循环
.2:

	pop	ecx
	pop	edi
	pop	esi
	mov	esp, ebp
	pop	ebp

	ret			; 函数结束，返回