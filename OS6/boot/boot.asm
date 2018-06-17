org 07c00h
  jmp LABEL_START
  nop
BS_OEMName: db "Feng0000"
BPB_BytePerSec: dw 0200h
BPB_SecPerClus: db 01h
BPB_RevdSecCnt: dw 01h
BPB_NumFATs:    db 02h
BPB_RootEntCnt: dw 0E0h
BPB_TotSec16:   dw 0B40h
BPB_Media:      db 0F0h
BPB_FATSz16:    dw 009h
BPB_SecPerTrk:  dw 012h
BPB_NumHeads:   dw 002h
BPB_HiddSec:    dd 0
BPB_TotSec32:   dd 0
BS_DrvNum:      db 0
BS_Reserved1:   db 0
BS_BootSig:     db 029h
BS_VolID:       dd 0
BS_VolLab:      db "BaoBaoS0.02"
BS_FileSysType: db "FAT12",0,0,0

;MessageFind: db  "Find File",0Ah,0
;MessageNotFind:  db  "Not Find File",0Ah,0
;MessageLoading:  db  "Loading",0Ah,0
;MessageBooting:  db  "Booting",0Ah,0
;MessageWaiting:  db  ".",0

MessageLength equ 9
BootMessage:  db  "Booting  "; 9字节, 不够则用空格补齐. 序号 0
Message1  db  "Ready.   ";     9字节, 不够则用空格补齐. 序号 1
Message2  db  "No LOADER";     9字节, 不够则用空格补齐. 序号 2

disppos:  dw  ((80*0+0)*2)
FileName: db  "LOADER  BIN"

BaseOfStack equ 07c00h
BaseofLoader  equ 09000h
OffsetLoader  equ 0100h
RootDirStart  equ 19
FATStart  equ 1
TotalItemPerSec equ 0010h   ;16
CharCmpCount  equ 000Bh     ;FileName has 11 char
TotalSecRootDir equ 14
DataSectorStart equ 31      ;19+14-2

RootDirCountSec:  dw  14    ;RootDir has 14 sector 
EVEN: db  0


LABEL_START:

    mov ax,cs
    mov ds,ax
    mov es,ax
    mov ss,ax
    mov sp,BaseOfStack

   ; clear Screen
    mov ax,0600h   ; AH = 6,  AL = 0h
    mov bx,0700h   ; 黑底白字(BL = 07h)
    mov cx,0       ; 左上角: (0, 0)
    mov dx,0184fh  ; 右下角: (80, 50)
    int 10h         ; int 10h

    mov dh,0
    call DisStr

    ;mov ax,MessageBooting
    ;push ax
    ;call DisStr
    ;add sp,2

    ;reset disk
    xor ah,ah
    xor dl,dl
    int 13h
.find_in_dir:   
    mov ax,BaseofLoader
    mov es,ax
    mov ax,OffsetLoader
    mov bx,ax

    mov dx,word[RootDirCountSec]
    cmp dx,0
    jz  .not_find
    mov ax,TotalSecRootDir
    sub ax,dx
    add ax,RootDirStart
    mov cl,1
    call ReadSector
  
    xor dx,dx
    mov dx,TotalItemPerSec
    mov bx,OffsetLoader
.find_in_a_sector:   
    cmp dx,0
    jz  .go_next_sector
    mov si,bx
    mov di,FileName
    mov cx,CharCmpCount
.cmpare:
    cmp cx,0000h
    jz .find

    mov al,byte[es:si]
    cmp byte[ds:di],al
    jnz .go_next_item
    dec cx
    inc si
    inc di
    jmp .cmpare
.go_next_item:
    add bx,0020h
    dec dx
    jmp .find_in_a_sector
.go_next_sector:
    dec word[RootDirCountSec]
    jmp .find_in_dir

.not_find:
    mov dh,2
    call DisStr

    ;mov ax,MessageNotFind
    ;push ax
    ;call DisStr
    ;add sp,2
    jmp .end
.find:

    ;mov ax,MessageLoading
    ;push ax
    ;call DisStr
    ;add sp,2

    mov ax,BaseofLoader
    mov es,ax
    mov ax,OffsetLoader
    mov bx,ax
   
    and si,0ffe0h
    add si,01ah
    mov ax,word[es:si]
    push ax
    add ax,DataSectorStart

.loadfile: 
    push ax         ; 
    push  bx        ;  
    mov ah, 0Eh     ;  | 每读一个扇区就在 "Booting  " 后面
    mov al, '.'     ;  | 打一个点, 形成这样的效果:
    mov bl, 0Fh     ;  | Booting ......
    int 10h         ;  
    pop bx          ;  
    pop ax          ; 

    ;push ax
    ;mov  ax,MessageWaiting
    ;push ax
    ;call DisStr
    ;add sp,2
    ;pop ax

    mov cl,1
    call ReadSector
    pop ax
    call GetFATItem
    cmp ax,0fffh
    jz  .finish_load
    push ax
    add bx,[BPB_BytePerSec]
    add ax,DataSectorStart
    jmp .loadfile
.finish_load:
    mov dh,1
    call DisStr
    jmp BaseofLoader:OffsetLoader
.end:
    jmp $

GetFATItem:
    push es
    push bx
    push ax

    mov ax,BaseofLoader
    sub ax,0100h
    mov es,ax

    pop ax
    xor bx,bx          ;
    mov byte[EVEN], 0  ; init bx and [EVEN]   !important
    mov bx,3
    mul bx        ;dx:ax=ax*3
    mov bx,2
    div bx        ;dx:ax/2 => ax=商 (item offset) dx=余数
    cmp dx,0
    jz  label_even
    mov byte[EVEN],1
label_even:
    xor dx,dx     ; dx clear ,set 0   !important
    mov bx,[BPB_BytePerSec]
    div bx    ;dx:ax /512=>  ax = Sec Num in Fat  dx=offset in current Sector(FAT)
    push dx
    mov bx,0
    add ax,FATStart
    mov cl,2
    call ReadSector

    pop dx
    add bx,dx
    mov ax,word[es:bx]
    cmp byte[EVEN],1
    jnz .get_ok
    shr ax,4
.get_ok:
    and ax,0fffh

    pop bx
    pop es
    ret 
ReadSector:
    push bp
    mov bp,sp
    sub sp,2

    mov byte[bp-2],cl
    push bx
    mov bl,[BPB_SecPerTrk]   ;18
    div bl                   ;al=商  ah=余数
    mov cl,ah
    add cl,1
    mov ch,al
    shr ch,1
    mov dh,al
    and dh,1
    mov dl,[BS_DrvNum]
    pop bx
.reading:
    mov ah,02h
    mov al,byte[bp-2]
    int 13h
    jc .reading

    add sp,2
    pop bp
    ret
DisStr:
    mov ax, MessageLength
    mul dh
    add ax, BootMessage
    mov bp, ax      ; ┓ 
    mov ax, ds      ; ┣ ES:BP = 串地址
    mov es, ax      ; ┛
    mov cx, MessageLength ; CX = 串长度
    mov ax, 01301h    ; AH = 13,  AL = 01h
    mov bx, 0007h   ; 页号为0(BH = 0) 黑底白字(BL = 07h)
    mov dl, 0
   
    int 10h     ; int 10h
    ret
;DisStr:
;    push bp
;    mov bp,sp
;
;    push si
;    push di
;    push bx
;
;    mov si,[bp+4]      ;ss:[bp+4]
;    mov di,[disppos]   ;ds:[disppos]
;    push es
;    mov ax,0b800h
;    mov es,ax
;    mov ah,0ch
;    cld
; .1:
;    lodsb
;    test al,al
;    jz .end
;    cmp al,0Ah
;    jnz .2
;    push ax
;    mov ax,di
;    mov bl,160
;   div bl
;    and ax,0ffh
;    inc ax
;    mul bl
;    mov di,ax
;    pop ax
;    jmp .1
; .2:
;    mov [es:di],ax
;    add di,2
;    jmp .1
;.end:
;    add di,2
;    mov [disppos],di
;
;    pop es
;    pop bx
;    pop di
;    pop si
;
;    mov sp,bp
;    pop bp
;    ret
times 510-($-$$) db 0
ends: dw  0aa55h