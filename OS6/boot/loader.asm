org 0100h
  jmp LABEL_START
  nop
;--Boot Sector Information header
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
;-- end header


BaseOfStackInRealMode equ 0100h       ;Loader 在实模式下的栈
BaseofKernel  equ 08000h              ;kernel 被载入的段地址   （未分段机制）
OffsetKernel  equ 0000h               ;kernel 被载入的偏移地址  （未分段机制）
BaseofKernelPhyAddr equ BaseofKernel*10h  ;kernel 的物理基址 （未分段机制）
KernelEntryPhyAddr  equ 030400h           ;kernel 执行的线性地址 （分页后）
;--Paramter about Read Sector and Load file
RootDirStart  equ 19        ;RootDir Start Sector Num is 19
FATStart  equ 1             ;FAT Start Sector Num is 1
TotalItemPerSec equ 0010h   ;a Sector(512byte) has 16 item(file item)
CharCmpCount  equ 000Bh     ;FileName has 11 char
TotalSecRootDir equ 14      ; RootDir Area has  14 Sector =>BPB_RootEntCnt8*32/512
DataSectorStart equ 31      ; Boot+FAT1'Sectors +FAT2'Sectors+RootDir'Sectors=19+14-2

MessageLength equ 9
BootMessage:  db  "Loading  "; 9字节, 不够则用空格补齐. 序号 0
Message1  db  "Ready.   ";     9字节, 不够则用空格补齐. 序号 1
Message2  db  "No Kernel";     9字节, 不够则用空格补齐. 序号 2

disppos:  dw  ((80*0+0)*2)
FileName: db  "KERNEL  BIN"
RootDirCountSec:  dw  14    ;RootDir has 14 sector 
EVEN: db  0
;-- end Parameter(Read Sector)
;--Paramter in ProtectMode
%include "pm.inc"
BaseOfLoader equ 09000h
PageDirBase equ 100000h
PageTblBase equ 101000h
BaseOfLoaderPhyAddr equ BaseOfLoader*10h   ;Loader 的物理基址（未分段机制）
LABEL_GDT:
LABEL_DESC_NORMAL:Descriptor 0,0,0
LABEL_DESC_FLATC:Descriptor  0,0fffffh,DA_CR|DA_32|DA_LIMIT_4K
LABEL_DESC_FLATRW:Descriptor 0,0fffffh,DA_DRW|DA_32|DA_LIMIT_4K
LABEL_DESC_VIDEO:Descriptor  0b8000h,0ffffh,DA_DRW|DA_DPL_3
LABEL_DESC_PAGE_DIR:Descriptor PageDirBase,4095,DA_DRW
LABEL_DESC_TBL:Descriptor   PageTblBase,8*4096-1,DA_DRW
GdtLen equ $-LABEL_GDT
GdtPtr dw  GdtLen-1
       dd  BaseOfLoaderPhyAddr+LABEL_GDT
SelectorFlatC  equ LABEL_DESC_FLATC-LABEL_GDT
SelectorFlatRW equ LABEL_DESC_FLATRW-LABEL_GDT
SelectorVideo  equ LABEL_DESC_VIDEO-LABEL_GDT+SA_RPL3
SelectorPageDir equ LABEL_DESC_PAGE_DIR-LABEL_GDT
SelectorPageTbl equ LABEL_DESC_TBL-LABEL_GDT
;
[SECTION .RealModeCode]
[BITS 16]
LABEL_START:

    mov ax,cs
    mov ds,ax
    mov es,ax
    mov ss,ax
    mov sp,BaseOfStackInRealMode

    mov dh,0
    call DisStr

    mov ebx,0
    mov di,_MemChkBuf
.loop:
    mov eax,0E820h
    mov ecx,20
    mov edx,0534D4150h
    int 15h
    jc mem_chk_fail
    add di,20
    inc dword[_dwMCRNumber]
    cmp ebx,0
    jne .loop
    jmp mem_chk_ok
mem_chk_fail:
    mov dword[_dwMCRNumber],0
mem_chk_ok:

    ;reset disk
    xor ah,ah
    xor dl,dl
    int 13h
.find_in_dir:   
    mov ax,BaseofKernel
    mov es,ax
    mov ax,OffsetKernel
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
    mov bx,OffsetKernel
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
    jmp .end
.find:
    mov ax,BaseofKernel
    mov es,ax
    mov ax,OffsetKernel
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
    
    lgdt [GdtPtr]
    cli
    in al,92h
    or al,00000010b
    out 92h,al

    mov eax,cr0
    or  eax,00000001b
    mov cr0,eax

    jmp dword SelectorFlatC:(BaseOfLoaderPhyAddr+LABEL_SEG_CODE32_PM) ;跳入保护模式
    ;jmp BaseofKernel:OffsetKernel
.end:
    jmp $

GetFATItem:
    push es
    push bx
    push ax

    mov ax,BaseofKernel
    sub ax,0100h
    mov es,ax

    pop ax
    xor bx,bx          ;
    mov byte[EVEN], 0  ; init bx and [EVEN]   !important
    mov bx,3
    mul bx        ;dx:ax=ax*3
    mov bx,2
    div bx        ;dx:ax/2 => ax=shang (item offset) dx=yushu
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
    div bl                   ;al=shang  ah=yushu
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
    add dh, 3       ; start row is 3th
    int 10h     ; int 10h
    ret


[SECTION .code32]
ALIGN 32
[BITS 32]
LABEL_SEG_CODE32_PM:
    mov ax,SelectorFlatRW
    mov es,ax
    mov ds,ax
    mov ss,ax
    mov esp,TopOfStackInProtect

    mov ax,SelectorVideo
    mov gs,ax

    ;push szPMMessage
    ;call DispStr
    ;add esp,4

    ;push szMemChkTitle
    ;call DispStr
    ;add esp,4

    call DispMemSize
    call SetupPaging

    mov ah,0ch
    mov al,"P"
    mov [gs:((80*0+25)*2)],ax
    
    call CopyKernel

    jmp SelectorFlatC:KernelEntryPhyAddr

%include "lib.inc"
CopyKernel:
    ;mov ax,SelectorFlatRW
    ;mov es,ax
    xor esi,esi
    mov cx,word[BaseofKernelPhyAddr+2ch]
    movzx ecx,cx
    mov esi,[BaseofKernelPhyAddr+1ch]
    add esi,BaseofKernelPhyAddr
.begin:
    mov eax,[esi+0]
    cmp eax,0
    jz .NotLoad
    push dword[esi+10h]
    mov eax,[esi+04h]
    add eax,BaseofKernelPhyAddr
    push eax
    push dword[esi+08h]
    call MemCpy
    add esp,12
.NotLoad:
    add esi,20h
    dec ecx
    cmp ecx,0
    jnz .begin
    ret
SetupPaging:
    push es         ;stosd need use es register  eax=>ES:ESI
    ;calculate how much page table?
    xor edx,edx
    mov eax,[dwMemSize]
    mov ebx,400000h ;4M  one page table -> Memory 4M

    div ebx
    mov ecx,eax

    test edx,edx
    jz .no_remainder
    inc ecx
.no_remainder:
    push ecx   ;save ecx

    mov ax,SelectorPageDir ; at 1M  (1M:0)
    mov es,ax
    xor edi,edi
    xor eax,eax
    mov eax,PageTblBase|PG_P|PG_USU|PG_RWW
 .1:
    stosd
    add eax,4096
    loop .1

    mov ax,SelectorPageTbl ; at 1M+4K (1M+4K:0)
    mov es,ax
    pop eax     ; total 8 tbl
    mov ebx,1024;   one tbl have 1024 item
    mul ebx
    mov ecx,eax
    xor edi,edi
    xor eax,eax
    mov eax,PG_P|PG_USU|PG_RWW
 .2:
    stosd
    add eax,4096
    loop .2

    ;start page
    mov eax,PageDirBase
    mov cr3,eax
    mov eax,cr0
    or eax,80000000h
    mov cr0,eax
    jmp short .3
 .3:
    nop
    pop es
    ret
DispMemSize:
    push esi
    push edi
    push ecx

    mov esi,MemChkBuf
    mov ecx,[dwMCRNumber]

.loop:
    mov edx,5
    mov edi,ARDStruct
  .1:
    push dword[esi]
    ;call DispInt
    pop eax
    stosd      ;eax -> es:di
    add esi,4
    dec edx
    cmp edx,0
    jnz .1
    ;call DispReturn
    cmp dword[dwType],1   ;  AddressRageMemory
    jne .2
    mov eax,[dwBaseAddrLow]
    add eax,[dwLengthLow]
    cmp eax,[dwMemSize]  
    jb .2     ;  if eax<dwMemsize  =>next loop
    mov [dwMemSize],eax ;MemSize = BaseAddrLow+LengthLow
.2:
    loop .loop

    call DispReturn
    push szRAMSize
    call DispStr
    add esp,4

    push dword[dwMemSize]
    call DispInt
    add esp,4

    pop ecx
    pop edi
    pop esi

    ret
[SECTION .data]
ALIGN 32
[BITS 32]
LABEL_DATA:
;use these at RealMode

_szPMMessage: db "In Protect Mode now",0Ah,0Ah,0
_szMemChkTitle: db "BaseAddrL BaseAddrH LengthLow LengthHigh Type",0Ah,0
_szRAMSize: db "RAM Size:",0
_szReturn: db 0Ah,0

_wSPValueInRealMode dw 0
_dwMCRNumber: dd 0
_dwDispPos: dd (80*6+0)*2
_dwMemSize: dd 0
_ARDStruct:
    _dwBaseAddrLow: dd 0
    _dwBaseAddrHigh:dd 0
    _dwLengthLow: dd 0
    _dwLengthHigh: dd 0
    _dwType:dd 0
_MemChkBuf: times 256 db 0

;use these at ProtectMode
szPMMessage equ _szPMMessage+BaseOfLoaderPhyAddr
szMemChkTitle equ _szMemChkTitle+BaseOfLoaderPhyAddr
szRAMSize equ _szRAMSize+BaseOfLoaderPhyAddr
szReturn equ _szReturn+BaseOfLoaderPhyAddr
dwDispPos equ _dwDispPos+BaseOfLoaderPhyAddr
dwMemSize equ _dwMemSize+BaseOfLoaderPhyAddr
dwMCRNumber equ _dwMCRNumber+BaseOfLoaderPhyAddr
ARDStruct equ _ARDStruct+BaseOfLoaderPhyAddr
    dwBaseAddrLow equ _dwBaseAddrLow+BaseOfLoaderPhyAddr
    dwBaseAddrHigh equ _dwBaseAddrHigh+BaseOfLoaderPhyAddr
    dwLengthLow equ _dwLengthLow+BaseOfLoaderPhyAddr
    dwLengthHigh equ _dwLengthHigh+BaseOfLoaderPhyAddr
    dwType equ _dwType+BaseOfLoaderPhyAddr
MemChkBuf equ _MemChkBuf+BaseOfLoaderPhyAddr

DataLen equ $-LABEL_DATA
ProtectStack times 1024 db 0
TopOfStackInProtect equ BaseOfLoaderPhyAddr+$