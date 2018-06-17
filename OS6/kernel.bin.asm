00030400  B40C              mov ah,0xc
00030402  B04B              mov al,0x4b
00030404  6566A3D2000000    mov [gs:0xd2],ax
0003040B  C70580B503000000  mov dword [dword 0x3b580],0x0
         -0000
00030415  BCE0300300        mov esp,0x330e0
0003041A  0F010510B60300    sgdt [dword 0x3b610]
00030421  E8FB010000        call dword 0x30621
00030426  0F011510B60300    lgdt [dword 0x3b610]
0003042D  0F011DE0300300    lidt [dword 0x330e0]
00030434  EA3B0403000800    jmp dword 0x8:0x3043b
0003043B  31C0              xor eax,eax
0003043D  66B83000          mov ax,0x30
00030441  0F00D8            ltr ax
00030444  E98C0B0000        jmp dword 0x30fd5
00030449  6AFF              push byte -0x1
0003044B  6A00              push byte +0x0
0003044D  E9B6000000        jmp dword 0x30508
00030452  6AFF              push byte -0x1
00030454  6A01              push byte +0x1
00030456  E9AD000000        jmp dword 0x30508
0003045B  6AFF              push byte -0x1
0003045D  6A02              push byte +0x2
0003045F  E9A4000000        jmp dword 0x30508
00030464  6AFF              push byte -0x1
00030466  6A03              push byte +0x3
00030468  E99B000000        jmp dword 0x30508
0003046D  6AFF              push byte -0x1
0003046F  6A04              push byte +0x4
00030471  E992000000        jmp dword 0x30508
00030476  6AFF              push byte -0x1
00030478  6A05              push byte +0x5
0003047A  E989000000        jmp dword 0x30508
0003047F  6AFF              push byte -0x1
00030481  6A06              push byte +0x6
00030483  E980000000        jmp dword 0x30508
00030488  6AFF              push byte -0x1
0003048A  6A07              push byte +0x7
0003048C  EB7A              jmp short 0x30508
0003048E  6A08              push byte +0x8
00030490  EB76              jmp short 0x30508
00030492  6AFF              push byte -0x1
00030494  6A09              push byte +0x9
00030496  EB70              jmp short 0x30508
00030498  6A0A              push byte +0xa
0003049A  EB6C              jmp short 0x30508
0003049C  6A0B              push byte +0xb
0003049E  EB68              jmp short 0x30508
000304A0  6A0C              push byte +0xc
000304A2  EB64              jmp short 0x30508
000304A4  6A0D              push byte +0xd
000304A6  EB60              jmp short 0x30508
000304A8  6A0E              push byte +0xe
000304AA  EB5C              jmp short 0x30508
000304AC  6AFF              push byte -0x1
000304AE  6A0F              push byte +0xf
000304B0  EB56              jmp short 0x30508
000304B2  6AFF              push byte -0x1
000304B4  6A10              push byte +0x10
000304B6  EB50              jmp short 0x30508
000304B8  6A11              push byte +0x11
000304BA  EB4C              jmp short 0x30508
000304BC  6AFF              push byte -0x1
000304BE  6A12              push byte +0x12
000304C0  EB46              jmp short 0x30508
000304C2  6AFF              push byte -0x1
000304C4  6A13              push byte +0x13
000304C6  EB40              jmp short 0x30508
000304C8  6A00              push byte +0x0
000304CA  EB45              jmp short 0x30511
000304CC  6A01              push byte +0x1
000304CE  EB41              jmp short 0x30511
000304D0  6A02              push byte +0x2
000304D2  EB3D              jmp short 0x30511
000304D4  6A03              push byte +0x3
000304D6  EB39              jmp short 0x30511
000304D8  6A04              push byte +0x4
000304DA  EB35              jmp short 0x30511
000304DC  6A05              push byte +0x5
000304DE  EB31              jmp short 0x30511
000304E0  6A06              push byte +0x6
000304E2  EB2D              jmp short 0x30511
000304E4  6A07              push byte +0x7
000304E6  EB29              jmp short 0x30511
000304E8  6A08              push byte +0x8
000304EA  EB25              jmp short 0x30511
000304EC  6A09              push byte +0x9
000304EE  EB21              jmp short 0x30511
000304F0  6A0A              push byte +0xa
000304F2  EB1D              jmp short 0x30511
000304F4  6A0B              push byte +0xb
000304F6  EB19              jmp short 0x30511
000304F8  6A0C              push byte +0xc
000304FA  EB15              jmp short 0x30511
000304FC  6A0D              push byte +0xd
000304FE  EB11              jmp short 0x30511
00030500  6A0E              push byte +0xe
00030502  EB0D              jmp short 0x30511
00030504  6A0F              push byte +0xf
00030506  EB09              jmp short 0x30511
00030508  E883080000        call dword 0x30d90
0003050D  83C408            add esp,byte +0x8
00030510  F4                hlt
00030511  E84F080000        call dword 0x30d65
00030516  83C404            add esp,byte +0x4
00030519  F4                hlt
0003051A  8B2520BE0300      mov esp,[dword 0x3be20]
00030520  0F00542448        lldt [esp+0x48]
00030525  8D442448          lea eax,[esp+0x48]
00030529  A330B10300        mov [0x3b130],eax
0003052E  0FA9              pop gs
00030530  0FA1              pop fs
00030532  07                pop es
00030533  1F                pop ds
00030534  61                popad
00030535  83C404            add esp,byte +0x4
00030538  CF                iretd
00030539  6690              xchg ax,ax
0003053B  6690              xchg ax,ax
0003053D  6690              xchg ax,ax
0003053F  90                nop
00030540  55                push ebp
00030541  89E5              mov ebp,esp
00030543  8B7508            mov esi,[ebp+0x8]
00030546  8B3D80B50300      mov edi,[dword 0x3b580]
0003054C  B40F              mov ah,0xf
0003054E  AC                lodsb
0003054F  84C0              test al,al
00030551  7423              jz 0x30576
00030553  3C0A              cmp al,0xa
00030555  7516              jnz 0x3056d
00030557  50                push eax
00030558  89F8              mov eax,edi
0003055A  B3A0              mov bl,0xa0
0003055C  F6F3              div bl
0003055E  25FF000000        and eax,0xff
00030563  40                inc eax
00030564  B3A0              mov bl,0xa0
00030566  F6E3              mul bl
00030568  89C7              mov edi,eax
0003056A  58                pop eax
0003056B  EBE1              jmp short 0x3054e
0003056D  65668907          mov [gs:edi],ax
00030571  83C702            add edi,byte +0x2
00030574  EBD8              jmp short 0x3054e
00030576  893D80B50300      mov [dword 0x3b580],edi
0003057C  89EC              mov esp,ebp
0003057E  5D                pop ebp
0003057F  C3                ret
00030580  55                push ebp
00030581  89E5              mov ebp,esp
00030583  8B7508            mov esi,[ebp+0x8]
00030586  8B3D80B50300      mov edi,[dword 0x3b580]
0003058C  8A650C            mov ah,[ebp+0xc]
0003058F  AC                lodsb
00030590  84C0              test al,al
00030592  7423              jz 0x305b7
00030594  3C0A              cmp al,0xa
00030596  7516              jnz 0x305ae
00030598  50                push eax
00030599  89F8              mov eax,edi
0003059B  B3A0              mov bl,0xa0
0003059D  F6F3              div bl
0003059F  25FF000000        and eax,0xff
000305A4  40                inc eax
000305A5  B3A0              mov bl,0xa0
000305A7  F6E3              mul bl
000305A9  89C7              mov edi,eax
000305AB  58                pop eax
000305AC  EBE1              jmp short 0x3058f
000305AE  65668907          mov [gs:edi],ax
000305B2  83C702            add edi,byte +0x2
000305B5  EBD8              jmp short 0x3058f
000305B7  893D80B50300      mov [dword 0x3b580],edi
000305BD  89EC              mov esp,ebp
000305BF  5D                pop ebp
000305C0  C3                ret
000305C1  55                push ebp
000305C2  89E5              mov ebp,esp
000305C4  51                push ecx
000305C5  57                push edi
000305C6  56                push esi
000305C7  8B7D08            mov edi,[ebp+0x8]
000305CA  8B750C            mov esi,[ebp+0xc]
000305CD  8B4D10            mov ecx,[ebp+0x10]
000305D0  83F900            cmp ecx,byte +0x0
000305D3  740B              jz 0x305e0
000305D5  3E8A06            mov al,[ds:esi]
000305D8  46                inc esi
000305D9  268807            mov [es:edi],al
000305DC  47                inc edi
000305DD  49                dec ecx
000305DE  EBF0              jmp short 0x305d0
000305E0  8B4508            mov eax,[ebp+0x8]
000305E3  5E                pop esi
000305E4  5F                pop edi
000305E5  59                pop ecx
000305E6  89EC              mov esp,ebp
000305E8  5D                pop ebp
000305E9  C3                ret
000305EA  8B542404          mov edx,[esp+0x4]
000305EE  8A442408          mov al,[esp+0x8]
000305F2  EE                out dx,al
000305F3  90                nop
000305F4  90                nop
000305F5  C3                ret
000305F6  8B542404          mov edx,[esp+0x4]
000305FA  31C0              xor eax,eax
000305FC  EC                in al,dx
000305FD  90                nop
000305FE  90                nop
000305FF  C3                ret
00030600  55                push ebp
00030601  89E5              mov ebp,esp
00030603  56                push esi
00030604  57                push edi
00030605  51                push ecx
00030606  8B7D08            mov edi,[ebp+0x8]
00030609  8B550C            mov edx,[ebp+0xc]
0003060C  8B4D10            mov ecx,[ebp+0x10]
0003060F  83F900            cmp ecx,byte +0x0
00030612  7406              jz 0x3061a
00030614  8817              mov [edi],dl
00030616  47                inc edi
00030617  49                dec ecx
00030618  EBF5              jmp short 0x3060f
0003061A  59                pop ecx
0003061B  5F                pop edi
0003061C  5E                pop esi
0003061D  89EC              mov esp,ebp
0003061F  5D                pop ebp
00030620  C3                ret
00030621  55                push ebp
00030622  89E5              mov ebp,esp
00030624  83EC28            sub esp,byte +0x28
00030627  C7042440120300    mov dword [esp],0x31240
0003062E  E80DFFFFFF        call dword 0x30540
00030633  C704244C120300    mov dword [esp],0x3124c
0003063A  E801FFFFFF        call dword 0x30540
0003063F  C7042498120300    mov dword [esp],0x31298
00030646  E8F5FEFFFF        call dword 0x30540
0003064B  C70424E0120300    mov dword [esp],0x312e0
00030652  E8E9FEFFFF        call dword 0x30540
00030657  C7042428130300    mov dword [esp],0x31328
0003065E  E8DDFEFFFF        call dword 0x30540
00030663  C7042470130300    mov dword [esp],0x31370
0003066A  E8D1FEFFFF        call dword 0x30540
0003066F  C70424B8130300    mov dword [esp],0x313b8
00030676  E8C5FEFFFF        call dword 0x30540
0003067B  C70424FE130300    mov dword [esp],0x313fe
00030682  E8B9FEFFFF        call dword 0x30540
00030687  B810B60300        mov eax,0x3b610
0003068C  0FB700            movzx eax,word [eax]
0003068F  0FB7C0            movzx eax,ax
00030692  8D5001            lea edx,[eax+0x1]
00030695  B812B60300        mov eax,0x3b612
0003069A  8B00              mov eax,[eax]
0003069C  89542408          mov [esp+0x8],edx
000306A0  89442404          mov [esp+0x4],eax
000306A4  C7042480B10300    mov dword [esp],0x3b180
000306AB  E811FFFFFF        call dword 0x305c1
000306B0  C745E810B60300    mov dword [ebp-0x18],0x3b610
000306B7  C745EC12B60300    mov dword [ebp-0x14],0x3b612
000306BE  8B45E8            mov eax,[ebp-0x18]
000306C1  66C700FF03        mov word [eax],0x3ff
000306C6  BA80B10300        mov edx,0x3b180
000306CB  8B45EC            mov eax,[ebp-0x14]
000306CE  8910              mov [eax],edx
000306D0  C745F0E0300300    mov dword [ebp-0x10],0x330e0
000306D7  C745F4E2300300    mov dword [ebp-0xc],0x330e2
000306DE  8B45F0            mov eax,[ebp-0x10]
000306E1  66C700FF07        mov word [eax],0x7ff
000306E6  BA20B60300        mov edx,0x3b620
000306EB  8B45F4            mov eax,[ebp-0xc]
000306EE  8910              mov [eax],edx
000306F0  E853010000        call dword 0x30848
000306F5  E8AC0A0000        call dword 0x311a6
000306FA  C704241C140300    mov dword [esp],0x3141c
00030701  E83AFEFFFF        call dword 0x30540
00030706  C9                leave
00030707  C3                ret
00030708  55                push ebp
00030709  89E5              mov ebp,esp
0003070B  83EC1C            sub esp,byte +0x1c
0003070E  8B4D08            mov ecx,[ebp+0x8]
00030711  8B550C            mov edx,[ebp+0xc]
00030714  8B4514            mov eax,[ebp+0x14]
00030717  884DEC            mov [ebp-0x14],cl
0003071A  8855E8            mov [ebp-0x18],dl
0003071D  8845E4            mov [ebp-0x1c],al
00030720  0FB645EC          movzx eax,byte [ebp-0x14]
00030724  C1E003            shl eax,byte 0x3
00030727  0520B60300        add eax,0x3b620
0003072C  8945F8            mov [ebp-0x8],eax
0003072F  8B4510            mov eax,[ebp+0x10]
00030732  8945FC            mov [ebp-0x4],eax
00030735  8B45FC            mov eax,[ebp-0x4]
00030738  89C2              mov edx,eax
0003073A  8B45F8            mov eax,[ebp-0x8]
0003073D  668910            mov [eax],dx
00030740  8B45F8            mov eax,[ebp-0x8]
00030743  66C740020800      mov word [eax+0x2],0x8
00030749  8B45F8            mov eax,[ebp-0x8]
0003074C  C6400400          mov byte [eax+0x4],0x0
00030750  0FB645E4          movzx eax,byte [ebp-0x1c]
00030754  C1E005            shl eax,byte 0x5
00030757  89C2              mov edx,eax
00030759  0FB645E8          movzx eax,byte [ebp-0x18]
0003075D  09D0              or eax,edx
0003075F  89C2              mov edx,eax
00030761  8B45F8            mov eax,[ebp-0x8]
00030764  885005            mov [eax+0x5],dl
00030767  8B45FC            mov eax,[ebp-0x4]
0003076A  C1E810            shr eax,byte 0x10
0003076D  89C2              mov edx,eax
0003076F  8B45F8            mov eax,[ebp-0x8]
00030772  66895006          mov [eax+0x6],dx
00030776  C9                leave
00030777  C3                ret
00030778  55                push ebp
00030779  89E5              mov ebp,esp
0003077B  83EC18            sub esp,byte +0x18
0003077E  C744240411000000  mov dword [esp+0x4],0x11
00030786  C7042420000000    mov dword [esp],0x20
0003078D  E858FEFFFF        call dword 0x305ea
00030792  C744240411000000  mov dword [esp+0x4],0x11
0003079A  C70424A0000000    mov dword [esp],0xa0
000307A1  E844FEFFFF        call dword 0x305ea
000307A6  C744240420000000  mov dword [esp+0x4],0x20
000307AE  C7042421000000    mov dword [esp],0x21
000307B5  E830FEFFFF        call dword 0x305ea
000307BA  C744240428000000  mov dword [esp+0x4],0x28
000307C2  C70424A1000000    mov dword [esp],0xa1
000307C9  E81CFEFFFF        call dword 0x305ea
000307CE  C744240404000000  mov dword [esp+0x4],0x4
000307D6  C7042421000000    mov dword [esp],0x21
000307DD  E808FEFFFF        call dword 0x305ea
000307E2  C744240402000000  mov dword [esp+0x4],0x2
000307EA  C70424A1000000    mov dword [esp],0xa1
000307F1  E8F4FDFFFF        call dword 0x305ea
000307F6  C744240401000000  mov dword [esp+0x4],0x1
000307FE  C7042421000000    mov dword [esp],0x21
00030805  E8E0FDFFFF        call dword 0x305ea
0003080A  C744240401000000  mov dword [esp+0x4],0x1
00030812  C70424A1000000    mov dword [esp],0xa1
00030819  E8CCFDFFFF        call dword 0x305ea
0003081E  C7442404FD000000  mov dword [esp+0x4],0xfd
00030826  C7042421000000    mov dword [esp],0x21
0003082D  E8B8FDFFFF        call dword 0x305ea
00030832  C7442404FF000000  mov dword [esp+0x4],0xff
0003083A  C70424A1000000    mov dword [esp],0xa1
00030841  E8A4FDFFFF        call dword 0x305ea
00030846  C9                leave
00030847  C3                ret
00030848  55                push ebp
00030849  89E5              mov ebp,esp
0003084B  83EC18            sub esp,byte +0x18
0003084E  E825FFFFFF        call dword 0x30778
00030853  C744240C00000000  mov dword [esp+0xc],0x0
0003085B  C744240849040300  mov dword [esp+0x8],0x30449
00030863  C74424048E000000  mov dword [esp+0x4],0x8e
0003086B  C7042400000000    mov dword [esp],0x0
00030872  E891FEFFFF        call dword 0x30708
00030877  C744240C00000000  mov dword [esp+0xc],0x0
0003087F  C744240852040300  mov dword [esp+0x8],0x30452
00030887  C74424048E000000  mov dword [esp+0x4],0x8e
0003088F  C7042401000000    mov dword [esp],0x1
00030896  E86DFEFFFF        call dword 0x30708
0003089B  C744240C00000000  mov dword [esp+0xc],0x0
000308A3  C74424085B040300  mov dword [esp+0x8],0x3045b
000308AB  C74424048E000000  mov dword [esp+0x4],0x8e
000308B3  C7042402000000    mov dword [esp],0x2
000308BA  E849FEFFFF        call dword 0x30708
000308BF  C744240C03000000  mov dword [esp+0xc],0x3
000308C7  C744240864040300  mov dword [esp+0x8],0x30464
000308CF  C74424048E000000  mov dword [esp+0x4],0x8e
000308D7  C7042403000000    mov dword [esp],0x3
000308DE  E825FEFFFF        call dword 0x30708
000308E3  C744240C03000000  mov dword [esp+0xc],0x3
000308EB  C74424086D040300  mov dword [esp+0x8],0x3046d
000308F3  C74424048E000000  mov dword [esp+0x4],0x8e
000308FB  C7042404000000    mov dword [esp],0x4
00030902  E801FEFFFF        call dword 0x30708
00030907  C744240C00000000  mov dword [esp+0xc],0x0
0003090F  C744240876040300  mov dword [esp+0x8],0x30476
00030917  C74424048E000000  mov dword [esp+0x4],0x8e
0003091F  C7042405000000    mov dword [esp],0x5
00030926  E8DDFDFFFF        call dword 0x30708
0003092B  C744240C00000000  mov dword [esp+0xc],0x0
00030933  C74424087F040300  mov dword [esp+0x8],0x3047f
0003093B  C74424048E000000  mov dword [esp+0x4],0x8e
00030943  C7042406000000    mov dword [esp],0x6
0003094A  E8B9FDFFFF        call dword 0x30708
0003094F  C744240C00000000  mov dword [esp+0xc],0x0
00030957  C744240888040300  mov dword [esp+0x8],0x30488
0003095F  C74424048E000000  mov dword [esp+0x4],0x8e
00030967  C7042407000000    mov dword [esp],0x7
0003096E  E895FDFFFF        call dword 0x30708
00030973  C744240C00000000  mov dword [esp+0xc],0x0
0003097B  C74424088E040300  mov dword [esp+0x8],0x3048e
00030983  C74424048E000000  mov dword [esp+0x4],0x8e
0003098B  C7042408000000    mov dword [esp],0x8
00030992  E871FDFFFF        call dword 0x30708
00030997  C744240C00000000  mov dword [esp+0xc],0x0
0003099F  C744240892040300  mov dword [esp+0x8],0x30492
000309A7  C74424048E000000  mov dword [esp+0x4],0x8e
000309AF  C7042409000000    mov dword [esp],0x9
000309B6  E84DFDFFFF        call dword 0x30708
000309BB  C744240C00000000  mov dword [esp+0xc],0x0
000309C3  C744240898040300  mov dword [esp+0x8],0x30498
000309CB  C74424048E000000  mov dword [esp+0x4],0x8e
000309D3  C704240A000000    mov dword [esp],0xa
000309DA  E829FDFFFF        call dword 0x30708
000309DF  C744240C00000000  mov dword [esp+0xc],0x0
000309E7  C74424089C040300  mov dword [esp+0x8],0x3049c
000309EF  C74424048E000000  mov dword [esp+0x4],0x8e
000309F7  C704240B000000    mov dword [esp],0xb
000309FE  E805FDFFFF        call dword 0x30708
00030A03  C744240C00000000  mov dword [esp+0xc],0x0
00030A0B  C7442408A0040300  mov dword [esp+0x8],0x304a0
00030A13  C74424048E000000  mov dword [esp+0x4],0x8e
00030A1B  C704240C000000    mov dword [esp],0xc
00030A22  E8E1FCFFFF        call dword 0x30708
00030A27  C744240C00000000  mov dword [esp+0xc],0x0
00030A2F  C7442408A4040300  mov dword [esp+0x8],0x304a4
00030A37  C74424048E000000  mov dword [esp+0x4],0x8e
00030A3F  C704240D000000    mov dword [esp],0xd
00030A46  E8BDFCFFFF        call dword 0x30708
00030A4B  C744240C00000000  mov dword [esp+0xc],0x0
00030A53  C7442408A8040300  mov dword [esp+0x8],0x304a8
00030A5B  C74424048E000000  mov dword [esp+0x4],0x8e
00030A63  C704240E000000    mov dword [esp],0xe
00030A6A  E899FCFFFF        call dword 0x30708
00030A6F  C744240C00000000  mov dword [esp+0xc],0x0
00030A77  C7442408AC040300  mov dword [esp+0x8],0x304ac
00030A7F  C74424048E000000  mov dword [esp+0x4],0x8e
00030A87  C704240F000000    mov dword [esp],0xf
00030A8E  E875FCFFFF        call dword 0x30708
00030A93  C744240C00000000  mov dword [esp+0xc],0x0
00030A9B  C7442408B2040300  mov dword [esp+0x8],0x304b2
00030AA3  C74424048E000000  mov dword [esp+0x4],0x8e
00030AAB  C7042410000000    mov dword [esp],0x10
00030AB2  E851FCFFFF        call dword 0x30708
00030AB7  C744240C00000000  mov dword [esp+0xc],0x0
00030ABF  C7442408B8040300  mov dword [esp+0x8],0x304b8
00030AC7  C74424048E000000  mov dword [esp+0x4],0x8e
00030ACF  C7042411000000    mov dword [esp],0x11
00030AD6  E82DFCFFFF        call dword 0x30708
00030ADB  C744240C00000000  mov dword [esp+0xc],0x0
00030AE3  C7442408BC040300  mov dword [esp+0x8],0x304bc
00030AEB  C74424048E000000  mov dword [esp+0x4],0x8e
00030AF3  C7042412000000    mov dword [esp],0x12
00030AFA  E809FCFFFF        call dword 0x30708
00030AFF  C744240C00000000  mov dword [esp+0xc],0x0
00030B07  C7442408C2040300  mov dword [esp+0x8],0x304c2
00030B0F  C74424048E000000  mov dword [esp+0x4],0x8e
00030B17  C7042413000000    mov dword [esp],0x13
00030B1E  E8E5FBFFFF        call dword 0x30708
00030B23  C744240C00000000  mov dword [esp+0xc],0x0
00030B2B  C7442408C8040300  mov dword [esp+0x8],0x304c8
00030B33  C74424048E000000  mov dword [esp+0x4],0x8e
00030B3B  C7042420000000    mov dword [esp],0x20
00030B42  E8C1FBFFFF        call dword 0x30708
00030B47  C744240C00000000  mov dword [esp+0xc],0x0
00030B4F  C7442408CC040300  mov dword [esp+0x8],0x304cc
00030B57  C74424048E000000  mov dword [esp+0x4],0x8e
00030B5F  C7042421000000    mov dword [esp],0x21
00030B66  E89DFBFFFF        call dword 0x30708
00030B6B  C744240C00000000  mov dword [esp+0xc],0x0
00030B73  C7442408D0040300  mov dword [esp+0x8],0x304d0
00030B7B  C74424048E000000  mov dword [esp+0x4],0x8e
00030B83  C7042422000000    mov dword [esp],0x22
00030B8A  E879FBFFFF        call dword 0x30708
00030B8F  C744240C00000000  mov dword [esp+0xc],0x0
00030B97  C7442408D4040300  mov dword [esp+0x8],0x304d4
00030B9F  C74424048E000000  mov dword [esp+0x4],0x8e
00030BA7  C7042423000000    mov dword [esp],0x23
00030BAE  E855FBFFFF        call dword 0x30708
00030BB3  C744240C00000000  mov dword [esp+0xc],0x0
00030BBB  C7442408D8040300  mov dword [esp+0x8],0x304d8
00030BC3  C74424048E000000  mov dword [esp+0x4],0x8e
00030BCB  C7042424000000    mov dword [esp],0x24
00030BD2  E831FBFFFF        call dword 0x30708
00030BD7  C744240C00000000  mov dword [esp+0xc],0x0
00030BDF  C7442408DC040300  mov dword [esp+0x8],0x304dc
00030BE7  C74424048E000000  mov dword [esp+0x4],0x8e
00030BEF  C7042425000000    mov dword [esp],0x25
00030BF6  E80DFBFFFF        call dword 0x30708
00030BFB  C744240C00000000  mov dword [esp+0xc],0x0
00030C03  C7442408E0040300  mov dword [esp+0x8],0x304e0
00030C0B  C74424048E000000  mov dword [esp+0x4],0x8e
00030C13  C7042426000000    mov dword [esp],0x26
00030C1A  E8E9FAFFFF        call dword 0x30708
00030C1F  C744240C00000000  mov dword [esp+0xc],0x0
00030C27  C7442408E4040300  mov dword [esp+0x8],0x304e4
00030C2F  C74424048E000000  mov dword [esp+0x4],0x8e
00030C37  C7042427000000    mov dword [esp],0x27
00030C3E  E8C5FAFFFF        call dword 0x30708
00030C43  C744240C00000000  mov dword [esp+0xc],0x0
00030C4B  C7442408E8040300  mov dword [esp+0x8],0x304e8
00030C53  C74424048E000000  mov dword [esp+0x4],0x8e
00030C5B  C7042428000000    mov dword [esp],0x28
00030C62  E8A1FAFFFF        call dword 0x30708
00030C67  C744240C00000000  mov dword [esp+0xc],0x0
00030C6F  C7442408EC040300  mov dword [esp+0x8],0x304ec
00030C77  C74424048E000000  mov dword [esp+0x4],0x8e
00030C7F  C7042429000000    mov dword [esp],0x29
00030C86  E87DFAFFFF        call dword 0x30708
00030C8B  C744240C00000000  mov dword [esp+0xc],0x0
00030C93  C7442408F0040300  mov dword [esp+0x8],0x304f0
00030C9B  C74424048E000000  mov dword [esp+0x4],0x8e
00030CA3  C704242A000000    mov dword [esp],0x2a
00030CAA  E859FAFFFF        call dword 0x30708
00030CAF  C744240C00000000  mov dword [esp+0xc],0x0
00030CB7  C7442408F4040300  mov dword [esp+0x8],0x304f4
00030CBF  C74424048E000000  mov dword [esp+0x4],0x8e
00030CC7  C704242B000000    mov dword [esp],0x2b
00030CCE  E835FAFFFF        call dword 0x30708
00030CD3  C744240C00000000  mov dword [esp+0xc],0x0
00030CDB  C7442408F8040300  mov dword [esp+0x8],0x304f8
00030CE3  C74424048E000000  mov dword [esp+0x4],0x8e
00030CEB  C704242C000000    mov dword [esp],0x2c
00030CF2  E811FAFFFF        call dword 0x30708
00030CF7  C744240C00000000  mov dword [esp+0xc],0x0
00030CFF  C7442408FC040300  mov dword [esp+0x8],0x304fc
00030D07  C74424048E000000  mov dword [esp+0x4],0x8e
00030D0F  C704242D000000    mov dword [esp],0x2d
00030D16  E8EDF9FFFF        call dword 0x30708
00030D1B  C744240C00000000  mov dword [esp+0xc],0x0
00030D23  C744240800050300  mov dword [esp+0x8],0x30500
00030D2B  C74424048E000000  mov dword [esp+0x4],0x8e
00030D33  C704242E000000    mov dword [esp],0x2e
00030D3A  E8C9F9FFFF        call dword 0x30708
00030D3F  C744240C00000000  mov dword [esp+0xc],0x0
00030D47  C744240804050300  mov dword [esp+0x8],0x30504
00030D4F  C74424048E000000  mov dword [esp+0x4],0x8e
00030D57  C704242F000000    mov dword [esp],0x2f
00030D5E  E8A5F9FFFF        call dword 0x30708
00030D63  C9                leave
00030D64  C3                ret
00030D65  55                push ebp
00030D66  89E5              mov ebp,esp
00030D68  83EC18            sub esp,byte +0x18
00030D6B  C7042440140300    mov dword [esp],0x31440
00030D72  E8C9F7FFFF        call dword 0x30540
00030D77  8B4508            mov eax,[ebp+0x8]
00030D7A  890424            mov [esp],eax
00030D7D  E8E8010000        call dword 0x30f6a
00030D82  C704244D140300    mov dword [esp],0x3144d
00030D89  E8B2F7FFFF        call dword 0x30540
00030D8E  C9                leave
00030D8F  C3                ret
00030D90  55                push ebp
00030D91  89E5              mov ebp,esp
00030D93  57                push edi
00030D94  56                push esi
00030D95  53                push ebx
00030D96  83EC7C            sub esp,byte +0x7c
00030D99  C7459474000000    mov dword [ebp-0x6c],0x74
00030DA0  8D5598            lea edx,[ebp-0x68]
00030DA3  BB80160300        mov ebx,0x31680
00030DA8  B814000000        mov eax,0x14
00030DAD  89D7              mov edi,edx
00030DAF  89DE              mov esi,ebx
00030DB1  89C1              mov ecx,eax
00030DB3  F3A5              rep movsd
00030DB5  C70580B503000000  mov dword [dword 0x3b580],0x0
         -0000
00030DBF  C7459000000000    mov dword [ebp-0x70],0x0
00030DC6  EB10              jmp short 0x30dd8
00030DC8  C704244F140300    mov dword [esp],0x3144f
00030DCF  E86CF7FFFF        call dword 0x30540
00030DD4  83459001          add dword [ebp-0x70],byte +0x1
00030DD8  817D908F010000    cmp dword [ebp-0x70],0x18f
00030DDF  7EE7              jng 0x30dc8
00030DE1  C70580B503000000  mov dword [dword 0x3b580],0x0
         -0000
00030DEB  8B4594            mov eax,[ebp-0x6c]
00030DEE  0FB6C0            movzx eax,al
00030DF1  89442404          mov [esp+0x4],eax
00030DF5  C7042451140300    mov dword [esp],0x31451
00030DFC  E87FF7FFFF        call dword 0x30580
00030E01  8B4594            mov eax,[ebp-0x6c]
00030E04  0FB6D0            movzx edx,al
00030E07  8B4508            mov eax,[ebp+0x8]
00030E0A  8B448598          mov eax,[ebp+eax*4-0x68]
00030E0E  89542404          mov [esp+0x4],edx
00030E12  890424            mov [esp],eax
00030E15  E866F7FFFF        call dword 0x30580
00030E1A  8B4594            mov eax,[ebp-0x6c]
00030E1D  0FB6C0            movzx eax,al
00030E20  89442404          mov [esp+0x4],eax
00030E24  C7042461140300    mov dword [esp],0x31461
00030E2B  E850F7FFFF        call dword 0x30580
00030E30  8B4594            mov eax,[ebp-0x6c]
00030E33  0FB6C0            movzx eax,al
00030E36  89442404          mov [esp+0x4],eax
00030E3A  C7042464140300    mov dword [esp],0x31464
00030E41  E83AF7FFFF        call dword 0x30580
00030E46  8B4518            mov eax,[ebp+0x18]
00030E49  890424            mov [esp],eax
00030E4C  E819010000        call dword 0x30f6a
00030E51  8B4594            mov eax,[ebp-0x6c]
00030E54  0FB6C0            movzx eax,al
00030E57  89442404          mov [esp+0x4],eax
00030E5B  C704246C140300    mov dword [esp],0x3146c
00030E62  E819F7FFFF        call dword 0x30580
00030E67  8B4514            mov eax,[ebp+0x14]
00030E6A  890424            mov [esp],eax
00030E6D  E8F8000000        call dword 0x30f6a
00030E72  8B4594            mov eax,[ebp-0x6c]
00030E75  0FB6C0            movzx eax,al
00030E78  89442404          mov [esp+0x4],eax
00030E7C  C7042470140300    mov dword [esp],0x31470
00030E83  E8F8F6FFFF        call dword 0x30580
00030E88  8B4510            mov eax,[ebp+0x10]
00030E8B  890424            mov [esp],eax
00030E8E  E8D7000000        call dword 0x30f6a
00030E93  837D0CFF          cmp dword [ebp+0xc],byte -0x1
00030E97  7421              jz 0x30eba
00030E99  8B4594            mov eax,[ebp-0x6c]
00030E9C  0FB6C0            movzx eax,al
00030E9F  89442404          mov [esp+0x4],eax
00030EA3  C7042475140300    mov dword [esp],0x31475
00030EAA  E8D1F6FFFF        call dword 0x30580
00030EAF  8B450C            mov eax,[ebp+0xc]
00030EB2  890424            mov [esp],eax
00030EB5  E8B0000000        call dword 0x30f6a
00030EBA  83C47C            add esp,byte +0x7c
00030EBD  5B                pop ebx
00030EBE  5E                pop esi
00030EBF  5F                pop edi
00030EC0  5D                pop ebp
00030EC1  C3                ret
00030EC2  55                push ebp
00030EC3  89E5              mov ebp,esp
00030EC5  83EC10            sub esp,byte +0x10
00030EC8  8B4508            mov eax,[ebp+0x8]
00030ECB  8945F4            mov [ebp-0xc],eax
00030ECE  C745FC00000000    mov dword [ebp-0x4],0x0
00030ED5  8B45F4            mov eax,[ebp-0xc]
00030ED8  8D5001            lea edx,[eax+0x1]
00030EDB  8955F4            mov [ebp-0xc],edx
00030EDE  C60030            mov byte [eax],0x30
00030EE1  8B45F4            mov eax,[ebp-0xc]
00030EE4  8D5001            lea edx,[eax+0x1]
00030EE7  8955F4            mov [ebp-0xc],edx
00030EEA  C60078            mov byte [eax],0x78
00030EED  837D0C00          cmp dword [ebp+0xc],byte +0x0
00030EF1  750E              jnz 0x30f01
00030EF3  8B45F4            mov eax,[ebp-0xc]
00030EF6  8D5001            lea edx,[eax+0x1]
00030EF9  8955F4            mov [ebp-0xc],edx
00030EFC  C60030            mov byte [eax],0x30
00030EFF  EB61              jmp short 0x30f62
00030F01  C745F81C000000    mov dword [ebp-0x8],0x1c
00030F08  EB52              jmp short 0x30f5c
00030F0A  8B45F8            mov eax,[ebp-0x8]
00030F0D  8B550C            mov edx,[ebp+0xc]
00030F10  89C1              mov ecx,eax
00030F12  D3FA              sar edx,cl
00030F14  89D0              mov eax,edx
00030F16  83E00F            and eax,byte +0xf
00030F19  8845F3            mov [ebp-0xd],al
00030F1C  837DFC00          cmp dword [ebp-0x4],byte +0x0
00030F20  7506              jnz 0x30f28
00030F22  807DF300          cmp byte [ebp-0xd],0x0
00030F26  7E30              jng 0x30f58
00030F28  C745FC01000000    mov dword [ebp-0x4],0x1
00030F2F  0FB645F3          movzx eax,byte [ebp-0xd]
00030F33  83C030            add eax,byte +0x30
00030F36  8845F3            mov [ebp-0xd],al
00030F39  807DF339          cmp byte [ebp-0xd],0x39
00030F3D  7E0A              jng 0x30f49
00030F3F  0FB645F3          movzx eax,byte [ebp-0xd]
00030F43  83C007            add eax,byte +0x7
00030F46  8845F3            mov [ebp-0xd],al
00030F49  8B45F4            mov eax,[ebp-0xc]
00030F4C  8D5001            lea edx,[eax+0x1]
00030F4F  8955F4            mov [ebp-0xc],edx
00030F52  0FB655F3          movzx edx,byte [ebp-0xd]
00030F56  8810              mov [eax],dl
00030F58  836DF804          sub dword [ebp-0x8],byte +0x4
00030F5C  837DF800          cmp dword [ebp-0x8],byte +0x0
00030F60  79A8              jns 0x30f0a
00030F62  8B45F4            mov eax,[ebp-0xc]
00030F65  C60000            mov byte [eax],0x0
00030F68  C9                leave
00030F69  C3                ret
00030F6A  55                push ebp
00030F6B  89E5              mov ebp,esp
00030F6D  83EC28            sub esp,byte +0x28
00030F70  8B4508            mov eax,[ebp+0x8]
00030F73  89442404          mov [esp+0x4],eax
00030F77  8B45F4            mov eax,[ebp-0xc]
00030F7A  890424            mov [esp],eax
00030F7D  E840FFFFFF        call dword 0x30ec2
00030F82  8B45F4            mov eax,[ebp-0xc]
00030F85  890424            mov [esp],eax
00030F88  E8B3F5FFFF        call dword 0x30540
00030F8D  C9                leave
00030F8E  C3                ret
00030F8F  55                push ebp
00030F90  89E5              mov ebp,esp
00030F92  83EC10            sub esp,byte +0x10
00030F95  C745FC00000000    mov dword [ebp-0x4],0x0
00030F9C  EB2D              jmp short 0x30fcb
00030F9E  C745F400000000    mov dword [ebp-0xc],0x0
00030FA5  EB1A              jmp short 0x30fc1
00030FA7  C745F800000000    mov dword [ebp-0x8],0x0
00030FAE  EB04              jmp short 0x30fb4
00030FB0  8345F801          add dword [ebp-0x8],byte +0x1
00030FB4  817DF80F270000    cmp dword [ebp-0x8],0x270f
00030FBB  7EF3              jng 0x30fb0
00030FBD  8345F401          add dword [ebp-0xc],byte +0x1
00030FC1  837DF409          cmp dword [ebp-0xc],byte +0x9
00030FC5  7EE0              jng 0x30fa7
00030FC7  8345FC01          add dword [ebp-0x4],byte +0x1
00030FCB  8B45FC            mov eax,[ebp-0x4]
00030FCE  3B4508            cmp eax,[ebp+0x8]
00030FD1  7CCB              jl 0x30f9e
00030FD3  C9                leave
00030FD4  C3                ret
00030FD5  55                push ebp
00030FD6  89E5              mov ebp,esp
00030FD8  83EC28            sub esp,byte +0x28
00030FDB  C70424D0160300    mov dword [esp],0x316d0
00030FE2  E859F5FFFF        call dword 0x30540
00030FE7  C745F4A0B50300    mov dword [ebp-0xc],0x3b5a0
00030FEE  8B45F4            mov eax,[ebp-0xc]
00030FF1  66C740483800      mov word [eax+0x48],0x38
00030FF7  8B45F4            mov eax,[ebp-0xc]
00030FFA  83C04A            add eax,byte +0x4a
00030FFD  C744240808000000  mov dword [esp+0x8],0x8
00031005  C744240488B10300  mov dword [esp+0x4],0x3b188
0003100D  890424            mov [esp],eax
00031010  E8ACF5FFFF        call dword 0x305c1
00031015  8B45F4            mov eax,[ebp-0xc]
00031018  C6404FB8          mov byte [eax+0x4f],0xb8
0003101C  8B45F4            mov eax,[ebp-0xc]
0003101F  83C052            add eax,byte +0x52
00031022  C744240808000000  mov dword [esp+0x8],0x8
0003102A  C744240490B10300  mov dword [esp+0x4],0x3b190
00031032  890424            mov [esp],eax
00031035  E887F5FFFF        call dword 0x305c1
0003103A  8B45F4            mov eax,[ebp-0xc]
0003103D  C64057B2          mov byte [eax+0x57],0xb2
00031041  8B45F4            mov eax,[ebp-0xc]
00031044  C7403805000000    mov dword [eax+0x38],0x5
0003104B  8B45F4            mov eax,[ebp-0xc]
0003104E  C7400C0D000000    mov dword [eax+0xc],0xd
00031055  8B45F4            mov eax,[ebp-0xc]
00031058  C740080D000000    mov dword [eax+0x8],0xd
0003105F  8B45F4            mov eax,[ebp-0xc]
00031062  C740040D000000    mov dword [eax+0x4],0xd
00031069  8B45F4            mov eax,[ebp-0xc]
0003106C  C740440D000000    mov dword [eax+0x44],0xd
00031073  8B45F4            mov eax,[ebp-0xc]
00031076  C70019000000      mov dword [eax],0x19
0003107C  BAB3100300        mov edx,0x310b3
00031081  8B45F4            mov eax,[ebp-0xc]
00031084  895034            mov [eax+0x34],edx
00031087  B800310300        mov eax,0x33100
0003108C  8D9000800000      lea edx,[eax+0x8000]
00031092  8B45F4            mov eax,[ebp-0xc]
00031095  895040            mov [eax+0x40],edx
00031098  8B45F4            mov eax,[ebp-0xc]
0003109B  C7403C02120000    mov dword [eax+0x3c],0x1202
000310A2  C70520BE0300A0B5  mov dword [dword 0x3be20],0x3b5a0
         -0300
000310AC  E869F4FFFF        call dword 0x3051a
000310B1  EBFE              jmp short 0x310b1
000310B3  55                push ebp
000310B4  89E5              mov ebp,esp
000310B6  83EC28            sub esp,byte +0x28
000310B9  C745F400000000    mov dword [ebp-0xc],0x0
000310C0  C70424F0160300    mov dword [esp],0x316f0
000310C7  E874F4FFFF        call dword 0x30540
000310CC  8B45F4            mov eax,[ebp-0xc]
000310CF  8D5001            lea edx,[eax+0x1]
000310D2  8955F4            mov [ebp-0xc],edx
000310D5  890424            mov [esp],eax
000310D8  E88DFEFFFF        call dword 0x30f6a
000310DD  C70424FA160300    mov dword [esp],0x316fa
000310E4  E857F4FFFF        call dword 0x30540
000310E9  C7042464000000    mov dword [esp],0x64
000310F0  E89AFEFFFF        call dword 0x30f8f
000310F5  EBC9              jmp short 0x310c0
000310F7  55                push ebp
000310F8  89E5              mov ebp,esp
000310FA  83EC10            sub esp,byte +0x10
000310FD  8B4508            mov eax,[ebp+0x8]
00031100  C1F803            sar eax,byte 0x3
00031103  C1E003            shl eax,byte 0x3
00031106  0580B10300        add eax,0x3b180
0003110B  8945FC            mov [ebp-0x4],eax
0003110E  8B45FC            mov eax,[ebp-0x4]
00031111  0FB64007          movzx eax,byte [eax+0x7]
00031115  0FB6C0            movzx eax,al
00031118  C1E018            shl eax,byte 0x18
0003111B  89C2              mov edx,eax
0003111D  8B45FC            mov eax,[ebp-0x4]
00031120  0FB64004          movzx eax,byte [eax+0x4]
00031124  0FB6C0            movzx eax,al
00031127  C1E010            shl eax,byte 0x10
0003112A  09C2              or edx,eax
0003112C  8B45FC            mov eax,[ebp-0x4]
0003112F  0FB74002          movzx eax,word [eax+0x2]
00031133  0FB7C0            movzx eax,ax
00031136  09D0              or eax,edx
00031138  C9                leave
00031139  C3                ret
0003113A  55                push ebp
0003113B  89E5              mov ebp,esp
0003113D  83EC04            sub esp,byte +0x4
00031140  8B4514            mov eax,[ebp+0x14]
00031143  668945FC          mov [ebp-0x4],ax
00031147  8B4510            mov eax,[ebp+0x10]
0003114A  89C2              mov edx,eax
0003114C  8B4508            mov eax,[ebp+0x8]
0003114F  668910            mov [eax],dx
00031152  8B450C            mov eax,[ebp+0xc]
00031155  89C2              mov edx,eax
00031157  8B4508            mov eax,[ebp+0x8]
0003115A  66895002          mov [eax+0x2],dx
0003115E  8B450C            mov eax,[ebp+0xc]
00031161  C1E810            shr eax,byte 0x10
00031164  89C2              mov edx,eax
00031166  8B4508            mov eax,[ebp+0x8]
00031169  885004            mov [eax+0x4],dl
0003116C  0FB745FC          movzx eax,word [ebp-0x4]
00031170  89C2              mov edx,eax
00031172  8B4508            mov eax,[ebp+0x8]
00031175  885005            mov [eax+0x5],dl
00031178  8B4510            mov eax,[ebp+0x10]
0003117B  C1E810            shr eax,byte 0x10
0003117E  83E00F            and eax,byte +0xf
00031181  89C2              mov edx,eax
00031183  0FB745FC          movzx eax,word [ebp-0x4]
00031187  66C1E808          shr ax,byte 0x8
0003118B  83E0F0            and eax,byte -0x10
0003118E  09C2              or edx,eax
00031190  8B4508            mov eax,[ebp+0x8]
00031193  885006            mov [eax+0x6],dl
00031196  8B450C            mov eax,[ebp+0xc]
00031199  C1E818            shr eax,byte 0x18
0003119C  89C2              mov edx,eax
0003119E  8B4508            mov eax,[ebp+0x8]
000311A1  885007            mov [eax+0x7],dl
000311A4  C9                leave
000311A5  C3                ret
000311A6  55                push ebp
000311A7  89E5              mov ebp,esp
000311A9  83EC18            sub esp,byte +0x18
000311AC  C744240868000000  mov dword [esp+0x8],0x68
000311B4  C744240400000000  mov dword [esp+0x4],0x0
000311BC  C7042400B10300    mov dword [esp],0x3b100
000311C3  E838F4FFFF        call dword 0x30600
000311C8  C7042410000000    mov dword [esp],0x10
000311CF  E823FFFFFF        call dword 0x310f7
000311D4  BA00B10300        mov edx,0x3b100
000311D9  01D0              add eax,edx
000311DB  C744240C89000000  mov dword [esp+0xc],0x89
000311E3  C744240867000000  mov dword [esp+0x8],0x67
000311EB  89442404          mov [esp+0x4],eax
000311EF  C70424B0B10300    mov dword [esp],0x3b1b0
000311F6  E83FFFFFFF        call dword 0x3113a
000311FB  66C70566B1030068  mov word [dword 0x3b166],0x68
         -00
00031204  C7042410000000    mov dword [esp],0x10
0003120B  E8E7FEFFFF        call dword 0x310f7
00031210  BAEAB50300        mov edx,0x3b5ea
00031215  01D0              add eax,edx
00031217  C744240C82000000  mov dword [esp+0xc],0x82
0003121F  C74424080F000000  mov dword [esp+0x8],0xf
00031227  89442404          mov [esp+0x4],eax
0003122B  C70424B8B10300    mov dword [esp],0x3b1b8
00031232  E803FFFFFF        call dword 0x3113a
00031237  C9                leave
00031238  C3                ret
00031239  0000              add [eax],al
0003123B  0000              add [eax],al
0003123D  0000              add [eax],al
0003123F  000A              add [edx],cl
00031241  0A0A              or cl,[edx]
00031243  0A0A              or cl,[edx]
00031245  0A0A              or cl,[edx]
00031247  0A0A              or cl,[edx]
00031249  0A00              or al,[eax]
0003124B  0020              add [eax],ah
0003124D  205F5F            and [edi+0x5f],bl
00031250  5F                pop edi
00031251  5F                pop edi
00031252  5F                pop edi
00031253  5F                pop edi
00031254  2020              and [eax],ah
00031256  2020              and [eax],ah
00031258  2020              and [eax],ah
0003125A  2020              and [eax],ah
0003125C  2020              and [eax],ah
0003125E  2020              and [eax],ah
00031260  2020              and [eax],ah
00031262  2020              and [eax],ah
00031264  2020              and [eax],ah
00031266  5F                pop edi
00031267  5F                pop edi
00031268  5F                pop edi
00031269  5F                pop edi
0003126A  5F                pop edi
0003126B  5F                pop edi
0003126C  2020              and [eax],ah
0003126E  2020              and [eax],ah
00031270  2020              and [eax],ah
00031272  2020              and [eax],ah
00031274  2020              and [eax],ah
00031276  2020              and [eax],ah
00031278  2020              and [eax],ah
0003127A  2020              and [eax],ah
0003127C  2020              and [eax],ah
0003127E  2020              and [eax],ah
00031280  2020              and [eax],ah
00031282  5F                pop edi
00031283  5F                pop edi
00031284  5F                pop edi
00031285  5F                pop edi
00031286  5F                pop edi
00031287  2020              and [eax],ah
00031289  2020              and [eax],ah
0003128B  5F                pop edi
0003128C  5F                pop edi
0003128D  5F                pop edi
0003128E  5F                pop edi
0003128F  5F                pop edi
00031290  2020              and [eax],ah
00031292  200A              and [edx],cl
00031294  0000              add [eax],al
00031296  0000              add [eax],al
00031298  2020              and [eax],ah
0003129A  7C20              jl 0x312bc
0003129C  5F                pop edi
0003129D  5F                pop edi
0003129E  5F                pop edi
0003129F  5C                pop esp
000312A0  2020              and [eax],ah
000312A2  2020              and [eax],ah
000312A4  2020              and [eax],ah
000312A6  2020              and [eax],ah
000312A8  2020              and [eax],ah
000312AA  2020              and [eax],ah
000312AC  2020              and [eax],ah
000312AE  2020              and [eax],ah
000312B0  2020              and [eax],ah
000312B2  7C20              jl 0x312d4
000312B4  5F                pop edi
000312B5  5F                pop edi
000312B6  5F                pop edi
000312B7  5C                pop esp
000312B8  2020              and [eax],ah
000312BA  2020              and [eax],ah
000312BC  2020              and [eax],ah
000312BE  2020              and [eax],ah
000312C0  2020              and [eax],ah
000312C2  2020              and [eax],ah
000312C4  2020              and [eax],ah
000312C6  2020              and [eax],ah
000312C8  2020              and [eax],ah
000312CA  2020              and [eax],ah
000312CC  7C20              jl 0x312ee
000312CE  205F20            and [edi+0x20],bl
000312D1  207C2020          and [eax+0x20],bh
000312D5  2F                das
000312D6  2020              and [eax],ah
000312D8  5F                pop edi
000312D9  5F                pop edi
000312DA  5F                pop edi
000312DB  7C20              jl 0x312fd
000312DD  200A              and [edx],cl
000312DF  0020              add [eax],ah
000312E1  207C207C          and [eax+0x7c],bh
000312E5  5F                pop edi
000312E6  2F                das
000312E7  202F              and [edi],ch
000312E9  2020              and [eax],ah
000312EB  205F5F            and [edi+0x5f],bl
000312EE  205F20            and [edi+0x20],bl
000312F1  2020              and [eax],ah
000312F3  205F5F            and [edi+0x5f],bl
000312F6  5F                pop edi
000312F7  2020              and [eax],ah
000312F9  207C207C          and [eax+0x7c],bh
000312FD  5F                pop edi
000312FE  2F                das
000312FF  202F              and [edi],ch
00031301  2020              and [eax],ah
00031303  5F                pop edi
00031304  5F                pop edi
00031305  205F20            and [edi+0x20],bl
00031308  2020              and [eax],ah
0003130A  2020              and [eax],ah
0003130C  5F                pop edi
0003130D  5F                pop edi
0003130E  5F                pop edi
0003130F  2020              and [eax],ah
00031311  2020              and [eax],ah
00031313  207C207C          and [eax+0x7c],bh
00031317  207C207C          and [eax+0x7c],bh
0003131B  205C2060          and [eax+0x60],bl
0003131F  2D2D2E2020        sub eax,0x20202e2d
00031324  200A              and [edx],cl
00031326  0000              add [eax],al
00031328  2020              and [eax],ah
0003132A  7C20              jl 0x3134c
0003132C  5F                pop edi
0003132D  5F                pop edi
0003132E  5F                pop edi
0003132F  5C                pop esp
00031330  2020              and [eax],ah
00031332  202F              and [edi],ch
00031334  205F60            and [edi+0x60],bl
00031337  207C2020          and [eax+0x20],bh
0003133B  2F                das
0003133C  205F20            and [edi+0x20],bl
0003133F  5C                pop esp
00031340  2020              and [eax],ah
00031342  7C20              jl 0x31364
00031344  5F                pop edi
00031345  5F                pop edi
00031346  5F                pop edi
00031347  5C                pop esp
00031348  2020              and [eax],ah
0003134A  2F                das
0003134B  205F60            and [edi+0x60],bl
0003134E  207C2020          and [eax+0x20],bh
00031352  202F              and [edi],ch
00031354  205F20            and [edi+0x20],bl
00031357  205C2020          and [eax+0x20],bl
0003135B  207C207C          and [eax+0x7c],bh
0003135F  207C207C          and [eax+0x7c],bh
00031363  2020              and [eax],ah
00031365  5F                pop edi
00031366  60                pushad
00031367  2D2D2E5C20        sub eax,0x205c2e2d
0003136C  200A              and [edx],cl
0003136E  0000              add [eax],al
00031370  2020              and [eax],ah
00031372  7C20              jl 0x31394
00031374  7C5F              jl 0x313d5
00031376  2F                das
00031377  202F              and [edi],ch
00031379  207C2028          and [eax+0x28],bh
0003137D  5F                pop edi
0003137E  7C20              jl 0x313a0
00031380  7C20              jl 0x313a2
00031382  7C20              jl 0x313a4
00031384  285F29            sub [edi+0x29],bl
00031387  207C207C          and [eax+0x7c],bh
0003138B  207C5F2F          and [edi+ebx*2+0x2f],bh
0003138F  202F              and [edi],ch
00031391  207C285F          and [eax+ebp+0x5f],bh
00031395  7C20              jl 0x313b7
00031397  7C20              jl 0x313b9
00031399  207C2028          and [eax+0x28],bh
0003139D  5F                pop edi
0003139E  2920              sub [eax],esp
000313A0  7C20              jl 0x313c2
000313A2  2020              and [eax],ah
000313A4  5C                pop esp
000313A5  205C5F2F          and [edi+ebx*2+0x2f],bl
000313A9  202F              and [edi],ch
000313AB  202F              and [edi],ch
000313AD  5C                pop esp
000313AE  5F                pop edi
000313AF  5F                pop edi
000313B0  2F                das
000313B1  202F              and [edi],ch
000313B3  2020              and [eax],ah
000313B5  0A00              or al,[eax]
000313B7  0020              add [eax],ah
000313B9  205C5F5F          and [edi+ebx*2+0x5f],bl
000313BD  5F                pop edi
000313BE  5F                pop edi
000313BF  2F                das
000313C0  2020              and [eax],ah
000313C2  205C5F5F          and [edi+ebx*2+0x5f],bl
000313C6  2C5F              sub al,0x5f
000313C8  7C20              jl 0x313ea
000313CA  205C5F5F          and [edi+ebx*2+0x5f],bl
000313CE  5F                pop edi
000313CF  2F                das
000313D0  2020              and [eax],ah
000313D2  5C                pop esp
000313D3  5F                pop edi
000313D4  5F                pop edi
000313D5  5F                pop edi
000313D6  5F                pop edi
000313D7  2F                das
000313D8  2020              and [eax],ah
000313DA  5C                pop esp
000313DB  5F                pop edi
000313DC  5F                pop edi
000313DD  2C5F              sub al,0x5f
000313DF  7C20              jl 0x31401
000313E1  2020              and [eax],ah
000313E3  5C                pop esp
000313E4  5F                pop edi
000313E5  5F                pop edi
000313E6  5F                pop edi
000313E7  2F                das
000313E8  2020              and [eax],ah
000313EA  2020              and [eax],ah
000313EC  205C5F5F          and [edi+ebx*2+0x5f],bl
000313F0  5F                pop edi
000313F1  2F                das
000313F2  205C5F5F          and [edi+ebx*2+0x5f],bl
000313F6  5F                pop edi
000313F7  5F                pop edi
000313F8  5F                pop edi
000313F9  2F                das
000313FA  2020              and [eax],ah
000313FC  0A00              or al,[eax]
000313FE  2D2D2D2D2D        sub eax,0x2d2d2d2d
00031403  2D2D2D2263        sub eax,0x63222d2d
00031408  7374              jnc 0x3147e
0003140A  61                popad
0003140B  7274              jc 0x31481
0003140D  2220              and ah,[eax]
0003140F  7374              jnc 0x31485
00031411  61                popad
00031412  7274              jc 0x31488
00031414  2D2D2D2D2D        sub eax,0x2d2d2d2d
00031419  2D0A002D2D        sub eax,0x2d2d000a
0003141E  2D2D2D2D2D        sub eax,0x2d2d2d2d
00031423  2D22637374        sub eax,0x74736322
00031428  61                popad
00031429  7274              jc 0x3149f
0003142B  2220              and ah,[eax]
0003142D  656E              gs outsb
0003142F  64732D            fs jnc 0x3145f
00031432  2D2D2D2D2D        sub eax,0x2d2d2d2d
00031437  0A00              or al,[eax]
00031439  0000              add [eax],al
0003143B  0000              add [eax],al
0003143D  0000              add [eax],al
0003143F  007365            add [ebx+0x65],dh
00031442  7276              jc 0x314ba
00031444  6963655F697271    imul esp,[ebx+0x65],dword 0x7172695f
0003144B  3A00              cmp al,[eax]
0003144D  0A00              or al,[eax]
0003144F  2000              and [eax],al
00031451  45                inc ebp
00031452  7863              js 0x314b7
00031454  657074            gs jo 0x314cb
00031457  696F6E21202D2D    imul ebp,[edi+0x6e],dword 0x2d2d2021
0003145E  3E2000            and [ds:eax],al
00031461  0A0A              or cl,[edx]
00031463  004546            add [ebp+0x46],al
00031466  4C                dec esp
00031467  41                inc ecx
00031468  47                inc edi
00031469  53                push ebx
0003146A  3A00              cmp al,[eax]
0003146C  43                inc ebx
0003146D  53                push ebx
0003146E  3A00              cmp al,[eax]
00031470  45                inc ebp
00031471  49                dec ecx
00031472  50                push eax
00031473  3A00              cmp al,[eax]
00031475  45                inc ebp
00031476  7272              jc 0x314ea
00031478  6F                outsd
00031479  7220              jc 0x3149b
0003147B  636F64            arpl [edi+0x64],bp
0003147E  653A00            cmp al,[gs:eax]
00031481  23444520          and eax,[ebp+eax*2+0x20]
00031485  44                inc esp
00031486  69766964652045    imul esi,[esi+0x69],dword 0x45206564
0003148D  7272              jc 0x31501
0003148F  6F                outsd
00031490  7200              jc 0x31492
00031492  23444220          and eax,[edx+eax*2+0x20]
00031496  52                push edx
00031497  45                inc ebp
00031498  53                push ebx
00031499  45                inc ebp
0003149A  52                push edx
0003149B  56                push esi
0003149C  45                inc ebp
0003149D  44                inc esp
0003149E  002D2D20204E      add [dword 0x4e20202d],ch
000314A4  4D                dec ebp
000314A5  49                dec ecx
000314A6  20496E            and [ecx+0x6e],cl
000314A9  7465              jz 0x31510
000314AB  7272              jc 0x3151f
000314AD  7570              jnz 0x3151f
000314AF  7400              jz 0x314b1
000314B1  234250            and eax,[edx+0x50]
000314B4  204272            and [edx+0x72],al
000314B7  6561              gs popad
000314B9  6B706F69          imul esi,[eax+0x6f],byte +0x69
000314BD  6E                outsb
000314BE  7400              jz 0x314c0
000314C0  234F46            and ecx,[edi+0x46]
000314C3  204F76            and [edi+0x76],cl
000314C6  657266            gs jc 0x3152f
000314C9  6C                insb
000314CA  6F                outsd
000314CB  7700              ja 0x314cd
000314CD  234252            and eax,[edx+0x52]
000314D0  20424F            and [edx+0x4f],al
000314D3  55                push ebp
000314D4  4E                dec esi
000314D5  44                inc esp
000314D6  205261            and [edx+0x61],dl
000314D9  6E                outsb
000314DA  6765204578        and [gs:di+0x78],al
000314DF  636565            arpl [ebp+0x65],sp
000314E2  6465640000        add [fs:eax],al
000314E7  0023              add [ebx],ah
000314E9  55                push ebp
000314EA  44                inc esp
000314EB  20496E            and [ecx+0x6e],cl
000314EE  7661              jna 0x31551
000314F0  6C                insb
000314F1  6964204F70636F64  imul esp,[eax+0x4f],dword 0x646f6370
000314F9  652028            and [gs:eax],ch
000314FC  55                push ebp
000314FD  6E                outsb
000314FE  646566696E656420  imul bp,[gs:esi+0x65],word 0x2064
00031506  4F                dec edi
00031507  7063              jo 0x3156c
00031509  6F                outsd
0003150A  64652900          sub [gs:eax],eax
0003150E  0000              add [eax],al
00031510  234E4D            and ecx,[esi+0x4d]
00031513  20446576          and [ebp+0x76],al
00031517  696365204E6F74    imul esp,[ebx+0x65],dword 0x746f4e20
0003151E  204176            and [ecx+0x76],al
00031521  61                popad
00031522  696C61626C652028  imul ebp,[ecx+0x62],dword 0x2820656c
0003152A  4E                dec esi
0003152B  6F                outsd
0003152C  204D61            and [ebp+0x61],cl
0003152F  7468              jz 0x31599
00031531  20436F            and [ebx+0x6f],al
00031534  7072              jo 0x315a8
00031536  6F                outsd
00031537  636573            arpl [ebp+0x73],sp
0003153A  736F              jnc 0x315ab
0003153C  7229              jc 0x31567
0003153E  0023              add [ebx],ah
00031540  44                inc esp
00031541  46                inc esi
00031542  20446F75          and [edi+ebp*2+0x75],al
00031546  626C6520          bound ebp,[ebp+0x20]
0003154A  46                inc esi
0003154B  61                popad
0003154C  756C              jnz 0x315ba
0003154E  7400              jz 0x31550
00031550  2020              and [eax],ah
00031552  2020              and [eax],ah
00031554  43                inc ebx
00031555  6F                outsd
00031556  7072              jo 0x315ca
00031558  6F                outsd
00031559  636573            arpl [ebp+0x73],sp
0003155C  736F              jnc 0x315cd
0003155E  7220              jc 0x31580
00031560  53                push ebx
00031561  65676D            gs a16 insd
00031564  656E              gs outsb
00031566  7420              jz 0x31588
00031568  4F                dec edi
00031569  7665              jna 0x315d0
0003156B  7272              jc 0x315df
0003156D  756E              jnz 0x315dd
0003156F  2028              and [eax],ch
00031571  7265              jc 0x315d8
00031573  7365              jnc 0x315da
00031575  7276              jc 0x315ed
00031577  65642900          sub [fs:eax],eax
0003157B  23545320          and edx,[ebx+edx*2+0x20]
0003157F  49                dec ecx
00031580  6E                outsb
00031581  7661              jna 0x315e4
00031583  6C                insb
00031584  6964205453530023  imul esp,[eax+0x54],dword 0x23005353
0003158C  4E                dec esi
0003158D  50                push eax
0003158E  205365            and [ebx+0x65],dl
00031591  676D              a16 insd
00031593  656E              gs outsb
00031595  7420              jz 0x315b7
00031597  4E                dec esi
00031598  6F                outsd
00031599  7420              jz 0x315bb
0003159B  50                push eax
0003159C  7265              jc 0x31603
0003159E  7365              jnc 0x31605
000315A0  6E                outsb
000315A1  7400              jz 0x315a3
000315A3  235353            and edx,[ebx+0x53]
000315A6  205374            and [ebx+0x74],dl
000315A9  61                popad
000315AA  636B2D            arpl [ebx+0x2d],bp
000315AD  53                push ebx
000315AE  65676D            gs a16 insd
000315B1  656E              gs outsb
000315B3  7420              jz 0x315d5
000315B5  46                inc esi
000315B6  61                popad
000315B7  756C              jnz 0x31625
000315B9  7400              jz 0x315bb
000315BB  234750            and eax,[edi+0x50]
000315BE  204765            and [edi+0x65],al
000315C1  6E                outsb
000315C2  657261            gs jc 0x31626
000315C5  6C                insb
000315C6  205072            and [eax+0x72],dl
000315C9  6F                outsd
000315CA  7465              jz 0x31631
000315CC  6374696F          arpl [ecx+ebp*2+0x6f],si
000315D0  6E                outsb
000315D1  0023              add [ebx],ah
000315D3  50                push eax
000315D4  46                inc esi
000315D5  205061            and [eax+0x61],dl
000315D8  6765204661        and [gs:bp+0x61],al
000315DD  756C              jnz 0x3164b
000315DF  7400              jz 0x315e1
000315E1  0000              add [eax],al
000315E3  002D2D202028      add [dword 0x2820202d],ch
000315E9  49                dec ecx
000315EA  6E                outsb
000315EB  7465              jz 0x31652
000315ED  6C                insb
000315EE  207265            and [edx+0x65],dh
000315F1  7365              jnc 0x31658
000315F3  7276              jc 0x3166b
000315F5  65642E20446F20    and [cs:edi+ebp*2+0x20],al
000315FC  6E                outsb
000315FD  6F                outsd
000315FE  7420              jz 0x31620
00031600  7573              jnz 0x31675
00031602  652E2900          sub [cs:eax],eax
00031606  0000              add [eax],al
00031608  234D46            and ecx,[ebp+0x46]
0003160B  207838            and [eax+0x38],bh
0003160E  37                aaa
0003160F  204650            and [esi+0x50],al
00031612  55                push ebp
00031613  20466C            and [esi+0x6c],al
00031616  6F                outsd
00031617  61                popad
00031618  7469              jz 0x31683
0003161A  6E                outsb
0003161B  672D506F696E      sub eax,0x6e696f50
00031621  7420              jz 0x31643
00031623  45                inc ebp
00031624  7272              jc 0x31698
00031626  6F                outsd
00031627  7220              jc 0x31649
00031629  284D61            sub [ebp+0x61],cl
0003162C  7468              jz 0x31696
0003162E  204661            and [esi+0x61],al
00031631  756C              jnz 0x3169f
00031633  7429              jz 0x3165e
00031635  0023              add [ebx],ah
00031637  41                inc ecx
00031638  43                inc ebx
00031639  20416C            and [ecx+0x6c],al
0003163C  69676E6D656E74    imul esp,[edi+0x6e],dword 0x746e656d
00031643  204368            and [ebx+0x68],al
00031646  65636B00          arpl [gs:ebx+0x0],bp
0003164A  234D43            and ecx,[ebp+0x43]
0003164D  204D61            and [ebp+0x61],cl
00031650  636869            arpl [eax+0x69],bp
00031653  6E                outsb
00031654  65204368          and [gs:ebx+0x68],al
00031658  65636B00          arpl [gs:ebx+0x0],bp
0003165C  235846            and ebx,[eax+0x46]
0003165F  205349            and [ebx+0x49],dl
00031662  4D                dec ebp
00031663  44                inc esp
00031664  20466C            and [esi+0x6c],al
00031667  6F                outsd
00031668  61                popad
00031669  7469              jz 0x316d4
0003166B  6E                outsb
0003166C  672D506F696E      sub eax,0x6e696f50
00031672  7420              jz 0x31694
00031674  45                inc ebp
00031675  7863              js 0x316da
00031677  657074            gs jo 0x316ee
0003167A  696F6E00000081    imul ebp,[edi+0x6e],dword 0x81000000
00031681  1403              adc al,0x3
00031683  00921403009F      add [edx-0x60fffcec],dl
00031689  1403              adc al,0x3
0003168B  00B1140300C0      add [ecx-0x3ffffcec],dh
00031691  1403              adc al,0x3
00031693  00CD              add ch,cl
00031695  1403              adc al,0x3
00031697  00E8              add al,ch
00031699  1403              adc al,0x3
0003169B  0010              add [eax],dl
0003169D  1503003F15        adc eax,0x153f0003
000316A2  0300              add eax,[eax]
000316A4  50                push eax
000316A5  1503007B15        adc eax,0x157b0003
000316AA  0300              add eax,[eax]
000316AC  8B150300A315      mov edx,[dword 0x15a30003]
000316B2  0300              add eax,[eax]
000316B4  BB150300D2        mov ebx,0xd2000315
000316B9  150300E415        adc eax,0x15e40003
000316BE  0300              add eax,[eax]
000316C0  0816              or [esi],dl
000316C2  0300              add eax,[eax]
000316C4  3616              ss push ss
000316C6  0300              add eax,[eax]
000316C8  4A                dec edx
000316C9  16                push ss
000316CA  0300              add eax,[eax]
000316CC  5C                pop esp
000316CD  16                push ss
000316CE  0300              add eax,[eax]
000316D0  2D2D2D2D2D        sub eax,0x2d2d2d2d
000316D5  226B65            and ch,[ebx+0x65]
000316D8  726E              jc 0x31748
000316DA  656C              gs insb
000316DC  5F                pop edi
000316DD  6D                insd
000316DE  61                popad
000316DF  696E2220626567    imul ebp,[esi+0x22],dword 0x67656220
000316E6  696E732D2D2D2D    imul ebp,[esi+0x73],dword 0x2d2d2d2d
000316ED  2D0A005468        sub eax,0x6854000a
000316F2  7265              jc 0x31759
000316F4  61                popad
000316F5  6420413A          and [fs:ecx+0x3a],al
000316F9  002E              add [esi],ch
000316FB  001400            add [eax+eax],dl
000316FE  0000              add [eax],al
00031700  0000              add [eax],al
00031702  0000              add [eax],al
00031704  017A52            add [edx+0x52],edi
00031707  0001              add [ecx],al
00031709  7C08              jl 0x31713
0003170B  011B              add [ebx],ebx
0003170D  0C04              or al,0x4
0003170F  0488              add al,0x88
00031711  0100              add [eax],eax
00031713  001C00            add [eax+eax],bl
00031716  0000              add [eax],al
00031718  1C00              sbb al,0x0
0003171A  0000              add [eax],al
0003171C  05EFFFFFE7        add eax,0xe7ffffef
00031721  0000              add [eax],al
00031723  0000              add [eax],al
00031725  41                inc ecx
00031726  0E                push cs
00031727  088502420D05      or [ebp+0x50d4202],al
0003172D  02E3              add ah,bl
0003172F  C50C04            lds ecx,[esp+eax]
00031732  0400              add al,0x0
00031734  1C00              sbb al,0x0
00031736  0000              add [eax],al
00031738  3C00              cmp al,0x0
0003173A  0000              add [eax],al
0003173C  CC                int3
0003173D  EF                out dx,eax
0003173E  FF                db 0xff
0003173F  FF7000            push dword [eax+0x0]
00031742  0000              add [eax],al
00031744  00410E            add [ecx+0xe],al
00031747  088502420D05      or [ebp+0x50d4202],al
0003174D  026CC50C          add ch,[ebp+eax*8+0xc]
00031751  0404              add al,0x4
00031753  001C00            add [eax+eax],bl
00031756  0000              add [eax],al
00031758  5C                pop esp
00031759  0000              add [eax],al
0003175B  001CF0            add [eax+esi*8],bl
0003175E  FF                db 0xff
0003175F  FFD0              call eax
00031761  0000              add [eax],al
00031763  0000              add [eax],al
00031765  41                inc ecx
00031766  0E                push cs
00031767  088502420D05      or [ebp+0x50d4202],al
0003176D  02CC              add cl,ah
0003176F  C50C04            lds ecx,[esp+eax]
00031772  0400              add al,0x0
00031774  1C00              sbb al,0x0
00031776  0000              add [eax],al
00031778  7C00              jl 0x3177a
0003177A  0000              add [eax],al
0003177C  CC                int3
0003177D  F0                lock
0003177E  FF                db 0xff
0003177F  FF1D05000000      call dword far [dword 0x5]
00031785  41                inc ecx
00031786  0E                push cs
00031787  088502420D05      or [ebp+0x50d4202],al
0003178D  0319              add ebx,[ecx]
0003178F  05C50C0404        add eax,0x4040cc5
00031794  1C00              sbb al,0x0
00031796  0000              add [eax],al
00031798  9C                pushfd
00031799  0000              add [eax],al
0003179B  00C9              add cl,cl
0003179D  F5                cmc
0003179E  FF                db 0xff
0003179F  FF2B              jmp dword far [ebx]
000317A1  0000              add [eax],al
000317A3  0000              add [eax],al
000317A5  41                inc ecx
000317A6  0E                push cs
000317A7  088502420D05      or [ebp+0x50d4202],al
000317AD  67C50C            lds ecx,[si]
000317B0  0404              add al,0x4
000317B2  0000              add [eax],al
000317B4  2C00              sub al,0x0
000317B6  0000              add [eax],al
000317B8  BC000000D4        mov esp,0xd4000000
000317BD  F5                cmc
000317BE  FF                db 0xff
000317BF  FF32              push dword [edx]
000317C1  0100              add [eax],eax
000317C3  0000              add [eax],al
000317C5  41                inc ecx
000317C6  0E                push cs
000317C7  088502420D05      or [ebp+0x50d4202],al
000317CD  46                inc esi
000317CE  8703              xchg eax,[ebx]
000317D0  860483            xchg al,[ebx+eax*4]
000317D3  05032501C3        add eax,0xc3012503
000317D8  41                inc ecx
000317D9  C641C741          mov byte [ecx-0x39],0x41
000317DD  C50C04            lds ecx,[esp+eax]
000317E0  0400              add al,0x0
000317E2  0000              add [eax],al
000317E4  1C00              sbb al,0x0
000317E6  0000              add [eax],al
000317E8  EC                in al,dx
000317E9  0000              add [eax],al
000317EB  00D6              add dh,dl
000317ED  F6FF              idiv bh
000317EF  FFA800000000      jmp dword far [eax+0x0]
000317F5  41                inc ecx
000317F6  0E                push cs
000317F7  088502420D05      or [ebp+0x50d4202],al
000317FD  02A4C50C040400    add ah,[ebp+eax*8+0x4040c]
00031804  1C00              sbb al,0x0
00031806  0000              add [eax],al
00031808  0C01              or al,0x1
0003180A  0000              add [eax],al
0003180C  5E                pop esi
0003180D  F7FF              idiv edi
0003180F  FF2500000000      jmp dword [dword 0x0]
00031815  41                inc ecx
00031816  0E                push cs
00031817  088502420D05      or [ebp+0x50d4202],al
0003181D  61                popad
0003181E  C50C04            lds ecx,[esp+eax]
00031821  0400              add al,0x0
00031823  001C00            add [eax+eax],bl
00031826  0000              add [eax],al
00031828  2C01              sub al,0x1
0003182A  0000              add [eax],al
0003182C  63F7              arpl di,si
0003182E  FF                db 0xff
0003182F  FF4600            inc dword [esi+0x0]
00031832  0000              add [eax],al
00031834  00410E            add [ecx+0xe],al
00031837  088502420D05      or [ebp+0x50d4202],al
0003183D  0242C5            add al,[edx-0x3b]
00031840  0C04              or al,0x4
00031842  0400              add al,0x0
00031844  1800              sbb [eax],al
00031846  0000              add [eax],al
00031848  4C                dec esp
00031849  0100              add [eax],eax
0003184B  0089F7FFFFDE      add [ecx-0x21000009],cl
00031851  0000              add [eax],al
00031853  0000              add [eax],al
00031855  41                inc ecx
00031856  0E                push cs
00031857  088502420D05      or [ebp+0x50d4202],al
0003185D  0000              add [eax],al
0003185F  0018              add [eax],bl
00031861  0000              add [eax],al
00031863  006801            add [eax+0x1],ch
00031866  0000              add [eax],al
00031868  4B                dec ebx
00031869  F8                clc
0003186A  FF                db 0xff
0003186B  FF440000          inc dword [eax+eax+0x0]
0003186F  0000              add [eax],al
00031871  41                inc ecx
00031872  0E                push cs
00031873  088502420D05      or [ebp+0x50d4202],al
00031879  0000              add [eax],al
0003187B  001C00            add [eax+eax],bl
0003187E  0000              add [eax],al
00031880  8401              test [ecx],al
00031882  0000              add [eax],al
00031884  73F8              jnc 0x3187e
00031886  FF                db 0xff
00031887  FF4300            inc dword [ebx+0x0]
0003188A  0000              add [eax],al
0003188C  00410E            add [ecx+0xe],al
0003188F  088502420D05      or [ebp+0x50d4202],al
00031895  7FC5              jg 0x3185c
00031897  0C04              or al,0x4
00031899  0400              add al,0x0
0003189B  001C00            add [eax+eax],bl
0003189E  0000              add [eax],al
000318A0  A4                movsb
000318A1  0100              add [eax],eax
000318A3  0096F8FFFF6C      add [esi+0x6cfffff8],dl
000318A9  0000              add [eax],al
000318AB  0000              add [eax],al
000318AD  41                inc ecx
000318AE  0E                push cs
000318AF  088502420D05      or [ebp+0x50d4202],al
000318B5  0268C5            add ch,[eax-0x3b]
000318B8  0C04              or al,0x4
000318BA  0400              add al,0x0
000318BC  1C00              sbb al,0x0
000318BE  0000              add [eax],al
000318C0  C401              les eax,[ecx]
000318C2  0000              add [eax],al
000318C4  E2F8              loop 0x318be
000318C6  FF                db 0xff
000318C7  FF9300000000      call dword [ebx+0x0]
000318CD  41                inc ecx
000318CE  0E                push cs
000318CF  088502420D05      or [ebp+0x50d4202],al
000318D5  028FC50C0404      add cl,[edi+0x4040cc5]
000318DB  004743            add [edi+0x43],al
000318DE  43                inc ebx
000318DF  3A20              cmp ah,[eax]
000318E1  285562            sub [ebp+0x62],dl
000318E4  756E              jnz 0x31954
000318E6  7475              jz 0x3195d
000318E8  20342E            and [esi+ebp],dh
000318EB  382E              cmp [esi],ch
000318ED  342D              xor al,0x2d
000318EF  327562            xor dh,[ebp+0x62]
000318F2  756E              jnz 0x31962
000318F4  7475              jz 0x3196b
000318F6  317E31            xor [esi+0x31],edi
000318F9  342E              xor al,0x2e
000318FB  30342E            xor [esi+ebp],dh
000318FE  3329              xor ebp,[ecx]
00031900  20342E            and [esi+ebp],dh
00031903  382E              cmp [esi],ch
00031905  3400              xor al,0x0
00031907  002E              add [esi],ch
00031909  7368              jnc 0x31973
0003190B  7374              jnc 0x31981
0003190D  7274              jc 0x31983
0003190F  61                popad
00031910  6200              bound eax,[eax]
00031912  2E7465            cs jz 0x3197a
00031915  7874              js 0x3198b
00031917  002E              add [esi],ch
00031919  726F              jc 0x3198a
0003191B  6461              fs popad
0003191D  7461              jz 0x31980
0003191F  002E              add [esi],ch
00031921  65685F667261      gs push dword 0x6172665f
00031927  6D                insd
00031928  65002E            add [gs:esi],ch
0003192B  627373            bound esi,[ebx+0x73]
0003192E  002E              add [esi],ch
00031930  636F6D            arpl [edi+0x6d],bp
00031933  6D                insd
00031934  656E              gs outsb
00031936  7400              jz 0x31938
00031938  0000              add [eax],al
0003193A  0000              add [eax],al
0003193C  0000              add [eax],al
0003193E  0000              add [eax],al
00031940  0000              add [eax],al
00031942  0000              add [eax],al
00031944  0000              add [eax],al
00031946  0000              add [eax],al
00031948  0000              add [eax],al
0003194A  0000              add [eax],al
0003194C  0000              add [eax],al
0003194E  0000              add [eax],al
00031950  0000              add [eax],al
00031952  0000              add [eax],al
00031954  0000              add [eax],al
00031956  0000              add [eax],al
00031958  0000              add [eax],al
0003195A  0000              add [eax],al
0003195C  0000              add [eax],al
0003195E  0000              add [eax],al
00031960  0B00              or eax,[eax]
00031962  0000              add [eax],al
00031964  0100              add [eax],eax
00031966  0000              add [eax],al
00031968  06                push es
00031969  0000              add [eax],al
0003196B  0000              add [eax],al
0003196D  0403              add al,0x3
0003196F  0000              add [eax],al
00031971  0400              add al,0x0
00031973  0039              add [ecx],bh
00031975  0E                push cs
00031976  0000              add [eax],al
00031978  0000              add [eax],al
0003197A  0000              add [eax],al
0003197C  0000              add [eax],al
0003197E  0000              add [eax],al
00031980  1000              adc [eax],al
00031982  0000              add [eax],al
00031984  0000              add [eax],al
00031986  0000              add [eax],al
00031988  1100              adc [eax],eax
0003198A  0000              add [eax],al
0003198C  0100              add [eax],eax
0003198E  0000              add [eax],al
00031990  0200              add al,[eax]
00031992  0000              add [eax],al
00031994  40                inc eax
00031995  1203              adc al,[ebx]
00031997  004012            add [eax+0x12],al
0003199A  0000              add [eax],al
0003199C  BC04000000        mov esp,0x4
000319A1  0000              add [eax],al
000319A3  0000              add [eax],al
000319A5  0000              add [eax],al
000319A7  0020              add [eax],ah
000319A9  0000              add [eax],al
000319AB  0000              add [eax],al
000319AD  0000              add [eax],al
000319AF  0019              add [ecx],bl
000319B1  0000              add [eax],al
000319B3  0001              add [ecx],al
000319B5  0000              add [eax],al
000319B7  0002              add [edx],al
000319B9  0000              add [eax],al
000319BB  00FC              add ah,bh
000319BD  16                push ss
000319BE  0300              add eax,[eax]
000319C0  FC                cld
000319C1  16                push ss
000319C2  0000              add [eax],al
000319C4  E001              loopne 0x319c7
000319C6  0000              add [eax],al
000319C8  0000              add [eax],al
000319CA  0000              add [eax],al
000319CC  0000              add [eax],al
000319CE  0000              add [eax],al
000319D0  0400              add al,0x0
000319D2  0000              add [eax],al
000319D4  0000              add [eax],al
000319D6  0000              add [eax],al
000319D8  2300              and eax,[eax]
000319DA  0000              add [eax],al
000319DC  0800              or [eax],al
000319DE  0000              add [eax],al
000319E0  0300              add eax,[eax]
000319E2  0000              add [eax],al
000319E4  E028              loopne 0x31a0e
000319E6  0300              add eax,[eax]
000319E8  E018              loopne 0x31a02
000319EA  0000              add [eax],al
000319EC  44                inc esp
000319ED  95                xchg eax,ebp
000319EE  0000              add [eax],al
000319F0  0000              add [eax],al
000319F2  0000              add [eax],al
000319F4  0000              add [eax],al
000319F6  0000              add [eax],al
000319F8  2000              and [eax],al
000319FA  0000              add [eax],al
000319FC  0000              add [eax],al
000319FE  0000              add [eax],al
00031A00  2800              sub [eax],al
00031A02  0000              add [eax],al
00031A04  0100              add [eax],eax
00031A06  0000              add [eax],al
00031A08  3000              xor [eax],al
00031A0A  0000              add [eax],al
00031A0C  0000              add [eax],al
00031A0E  0000              add [eax],al
00031A10  DC18              fcomp qword [eax]
00031A12  0000              add [eax],al
00031A14  2B00              sub eax,[eax]
00031A16  0000              add [eax],al
00031A18  0000              add [eax],al
00031A1A  0000              add [eax],al
00031A1C  0000              add [eax],al
00031A1E  0000              add [eax],al
00031A20  0100              add [eax],eax
00031A22  0000              add [eax],al
00031A24  0100              add [eax],eax
00031A26  0000              add [eax],al
00031A28  0100              add [eax],eax
00031A2A  0000              add [eax],al
00031A2C  0300              add eax,[eax]
00031A2E  0000              add [eax],al
00031A30  0000              add [eax],al
00031A32  0000              add [eax],al
00031A34  0000              add [eax],al
00031A36  0000              add [eax],al
00031A38  07                pop es
00031A39  1900              sbb [eax],eax
00031A3B  0031              add [ecx],dh
00031A3D  0000              add [eax],al
00031A3F  0000              add [eax],al
00031A41  0000              add [eax],al
00031A43  0000              add [eax],al
00031A45  0000              add [eax],al
00031A47  0001              add [ecx],al
00031A49  0000              add [eax],al
00031A4B  0000              add [eax],al
00031A4D  0000              add [eax],al
00031A4F  00                db 0x00
