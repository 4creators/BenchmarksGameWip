NaN
; Assembly listing for method NBodySystem:Advance(double,long,long,int):this
; Emitting BLENDED_CODE for X64 CPU with AVX
; optimized code
; rbp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T24] (  7,178   )   byref  ->  rdi         this
;  V01 arg1         [V01,T51] (  6, 66   )  double  ->  mm0        
;  V02 arg2         [V02,T48] (  3,  3   )    long  ->  rsi        
;  V03 arg3         [V03,T49] (  3,  3   )    long  ->  rdx        
;  V04 arg4         [V04,T47] (  4, 18   )     int  ->  rcx        
;* V05 loc0         [V05,T50] (  0,  0   )     int  ->  zero-ref   
;  V06 loc1         [V06,T25] (  5,161   )    long  ->  rax        
;  V07 loc2         [V07,T04] (  8,401   )    long  ->  rsi        
;  V08 loc3         [V08,T34] (  6, 82   )     int  ->  rdx        
;  V09 loc4         [V09,T20] (  4,194   )     int  ->   r8        
;  V10 loc5         [V10,T18] (  4,208   )   byref  ->   r9        
;  V11 loc6         [V11,T13] (  6,288   )     int  ->  r10        
;  V12 loc7         [V12,T15] (  4,256   )   byref  ->  r11        
;  V13 loc8         [V13,T29] (  7, 98   )     int  ->  rdx        
;  V14 loc9         [V14,T36] (  5, 80   )  simd16  ->  mm2         ld-addr-op
;  V15 loc10        [V15,T37] (  5, 80   )  simd16  ->  mm3         ld-addr-op
;  V16 loc11        [V16,T32] (  3, 96   )  simd16  ->  mm1        
;  V17 loc12        [V17,T12] (  7,352   )  simd16  ->  mm2        
;  V18 loc13        [V18,T46] (  2, 32   )  simd16  ->  mm1        
;* V19 loc14        [V19    ] (  0,  0   )  simd16  ->  zero-ref    ld-addr-op
;  V20 loc15        [V20,T19] (  4,208   )     int  ->   r8        
;  V21 loc16        [V21,T35] (  6, 82   )     int  ->  rdx        
;  V22 loc17        [V22,T00] ( 10,578   )     int  ->   r8        
;  V23 loc18        [V23,T05] (  7,400   )   byref  ->   r9        
;  V24 loc19        [V24,T14] (  6,288   )     int  ->  r10        
;  V25 loc20        [V25,T02] (  7,448   )   byref  ->  r11        
;  V26 loc21        [V26,T03] (  7,448   )   byref  ->  rbx        
;  V27 loc22        [V27,T38] (  5, 66   )     int  ->   r8        
;  V28 loc23        [V28,T27] (  8,128   )   byref  ->   r9        
;# V29 OutArgs      [V29    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V30 tmp1         [V30,T44] (  3, 48   )     int  ->  rdx        
;  V31 tmp2         [V31,T01] (  4,512   )    long  ->  rbx        
;  V32 tmp3         [V32,T41] (  2, 64   )  simd16  ->  mm1        
;  V33 tmp4         [V33,T33] (  3, 96   )  simd16  ->  mm1        
;  V34 tmp5         [V34,T16] (  2,256   )  simd16  ->  mm3        
;  V35 tmp6         [V35,T17] (  2,256   )  simd16  ->  mm4        
;  V36 tmp7         [V36,T42] (  2, 64   )  simd16  ->  mm3        
;  V37 tmp8         [V37,T06] (  3,384   )   byref  ->  r14        
;  V38 tmp9         [V38,T07] (  3,384   )   byref  ->  r14        
;  V39 tmp10        [V39,T08] (  3,384   )   byref  ->  r14        
;  V40 tmp11        [V40,T09] (  3,384   )   byref  ->  r14        
;  V41 tmp12        [V41,T10] (  3,384   )   byref  ->  r14        
;  V42 tmp13        [V42,T11] (  3,384   )   byref  ->  rbx        
;* V43 tmp14        [V43    ] (  0,  0   )   byref  ->  zero-ref   
;  V44 tmp15        [V44,T30] (  3, 96   )   byref  ->  rdx        
;  V45 tmp16        [V45,T31] (  3, 96   )   byref  ->  rdx        
;  V46 tmp17        [V46,T28] (  4,128   )  simd16  ->  mm1        
;  V47 tmp18        [V47,T43] (  2, 64   )  simd16  ->  mm2        
;  V48 tmp19        [V48,T26] (  5,160   )  simd16  ->  mm3        
;  V49 tmp20        [V49,T22] (  3,192   )  simd16  ->  mm3        
;  V50 tmp21        [V50,T23] (  3,192   )  simd16  ->  mm4        
;  V51 tmp22        [V51,T45] (  3, 48   )  simd16  ->  mm4        
;  V52 tmp23        [V52,T21] ( 12,192   )    long  ->   r9        
;  V53 cse0         [V53,T39] (  4, 64   )    long  ->   r8        
;  V54 cse1         [V54,T40] (  4, 64   )    long  ->   r8        
;
; Lcl frame size = 0

G_M21290_IG01:
       55                   push     rbp
       4157                 push     r15
       4156                 push     r14
       53                   push     rbx
       C5F877               vzeroupper 
       488D6C2418           lea      rbp, [rsp+18H]

G_M21290_IG02:
       488BC6               mov      rax, rsi
       488BF2               mov      rsi, rdx
       E931030000           jmp      G_M21290_IG17

G_M21290_IG03:
       33D2                 xor      edx, edx
       4533C0               xor      r8d, r8d

G_M21290_IG04:
       4C63CA               movsxd   r9, edx
       49C1E106             shl      r9, 6
       4C030F               add      r9, qword ptr [rdi]
       448D5201             lea      r10d, [rdx+1]
       4183FA05             cmp      r10d, 5
       7D53                 jge      SHORT G_M21290_IG06

G_M21290_IG05:
       4D63DA               movsxd   r11, r10d
       49C1E306             shl      r11, 6
       4C031F               add      r11, qword ptr [rdi]
       4963D8               movsxd   rbx, r8d
       48C1E305             shl      rbx, 5
       4803D8               add      rbx, rax
       C4C17B1009           vmovsd   xmm1, qword ptr [r9]
       C4C1735C0B           vsubsd   xmm1, qword ptr [r11]
       C4E17B110B           vmovsd   qword ptr [rbx], xmm1
       C4C17B104908         vmovsd   xmm1, qword ptr [r9+8]
       C4C1735C4B08         vsubsd   xmm1, qword ptr [r11+8]
       C4E17B114B08         vmovsd   qword ptr [rbx+8], xmm1
       C4C17B104910         vmovsd   xmm1, qword ptr [r9+16]
       C4C1735C4B10         vsubsd   xmm1, qword ptr [r11+16]
       C4E17B114B10         vmovsd   qword ptr [rbx+16], xmm1
       41FFC2               inc      r10d
       41FFC0               inc      r8d
       4183FA05             cmp      r10d, 5
       7CAD                 jl       SHORT G_M21290_IG05

G_M21290_IG06:
       FFC2                 inc      edx
       83FA04               cmp      edx, 4
       7C92                 jl       SHORT G_M21290_IG04

G_M21290_IG07:
       33D2                 xor      edx, edx

G_M21290_IG08:
       4C63C2               movsxd   r8, edx
       49C1E005             shl      r8, 5
       4C03C0               add      r8, rax
       C4E17057C9           vxorps   xmm1, xmm1
       C4C1711208           vmovlpd  xmm1, xmm1, xmmword ptr [r8]
       4D8BC8               mov      r9, r8
       453909               cmp      dword ptr [r9], r9d
       4983C108             add      r9, 8
       C4E16857D2           vxorps   xmm2, xmm2
       C4C1691211           vmovlpd  xmm2, xmm2, xmmword ptr [r9]
       4D8BC8               mov      r9, r8
       453909               cmp      dword ptr [r9], r9d
       4983C110             add      r9, 16
       C4E16057DB           vxorps   xmm3, xmm3
       C4C1611219           vmovlpd  xmm3, xmm3, xmmword ptr [r9]
       448D4201             lea      r8d, [rdx+1]
       4D63C0               movsxd   r8, r8d
       49C1E005             shl      r8, 5
       4C03C0               add      r8, rax
       C4C1711608           vmovhpd  xmm1, xmm1, xmmword ptr [r8]
       4D8BC8               mov      r9, r8
       453909               cmp      dword ptr [r9], r9d
       4983C108             add      r9, 8
       C4C1691611           vmovhpd  xmm2, xmm2, xmmword ptr [r9]
       4D8BC8               mov      r9, r8
       453909               cmp      dword ptr [r9], r9d
       4983C110             add      r9, 16
       C4C1611619           vmovhpd  xmm3, xmm3, xmmword ptr [r9]
       C4E17159C9           vmulpd   xmm1, xmm1, xmm1
       C4E16959D2           vmulpd   xmm2, xmm2, xmm2
       C4E16159DB           vmulpd   xmm3, xmm3, xmm3
       C4E17158CA           vaddpd   xmm1, xmm1, xmm2
       C4E17158DB           vaddpd   xmm3, xmm1, xmm3
       C4E17828CB           vmovaps  xmm1, xmm3
       C4E1795AD3           vcvtpd2ps xmm2, xmm3
       C4E17852D2           vrsqrtps xmm2, xmm2
       C4E1785AD2           vcvtps2pd xmm2, xmm2
       4533C0               xor      r8d, r8d

G_M21290_IG09:
       C4E17B101D2C020000   vmovsd   xmm3, qword ptr [reloc @RWD00]
       C4E17928E3           vmovapd  xmm4, xmm3
       C4E16157DB           vxorpd   xmm3, xmm3, xmm3
       C4E16310DC           vmovsd   xmm3, xmm3, xmm4
       C4E16114DB           vunpcklpd xmm3, xmm3, xmm3
       C4E17B102517020000   vmovsd   xmm4, qword ptr [reloc @RWD08]
       C4E17928EC           vmovapd  xmm5, xmm4
       C4E15957E4           vxorpd   xmm4, xmm4, xmm4
       C4E15B10E5           vmovsd   xmm4, xmm4, xmm5
       C4E15914E4           vunpcklpd xmm4, xmm4, xmm4
       C4E16959DB           vmulpd   xmm3, xmm2, xmm3
       C4E15959E1           vmulpd   xmm4, xmm4, xmm1
       C4E15959E2           vmulpd   xmm4, xmm4, xmm2
       C4E15959E2           vmulpd   xmm4, xmm4, xmm2
       C4E15959D2           vmulpd   xmm2, xmm4, xmm2
       C4E1615CD2           vsubpd   xmm2, xmm3, xmm2
       41FFC0               inc      r8d
       4183F802             cmp      r8d, 2
       7C9F                 jl       SHORT G_M21290_IG09

G_M21290_IG10:
       C4E15957E4           vxorpd   xmm4, xmm4, xmm4
       C4E15B10E0           vmovsd   xmm4, xmm4, xmm0
       C4E15914DC           vunpcklpd xmm3, xmm4, xmm4
       C4E1615EC9           vdivpd   xmm1, xmm3, xmm1
       C4E17159CA           vmulpd   xmm1, xmm1, xmm2
       4C63C2               movsxd   r8, edx
       4E8D04C6             lea      r8, [rsi+8*r8]
       C4C1792908           vmovapd  xmmword ptr [r8], xmm1
       83C202               add      edx, 2
       83FA0A               cmp      edx, 10
       0F8CD1FEFFFF         jl       G_M21290_IG08

G_M21290_IG11:
       33D2                 xor      edx, edx
       4533C0               xor      r8d, r8d

G_M21290_IG12:
       4C63CA               movsxd   r9, edx
       49C1E106             shl      r9, 6
       4C030F               add      r9, qword ptr [rdi]
       448D5201             lea      r10d, [rdx+1]
       4183FA05             cmp      r10d, 5
       0F8D03010000         jge      G_M21290_IG14

G_M21290_IG13:
       4D63D8               movsxd   r11, r8d
       49C1E305             shl      r11, 5
       4C03D8               add      r11, rax
       4963DA               movsxd   rbx, r10d
       48C1E306             shl      rbx, 6
       48031F               add      rbx, qword ptr [rdi]
       4D8D7120             lea      r14, bword ptr [r9+32]
       C4C17B100E           vmovsd   xmm1, qword ptr [r14]
       C4C17B1013           vmovsd   xmm2, qword ptr [r11]
       C4E16B595338         vmulsd   xmm2, qword ptr [rbx+56]
       4D63F8               movsxd   r15, r8d
       C4A16B5914FE         vmulsd   xmm2, qword ptr [rsi+8*r15]
       C4E1735CCA           vsubsd   xmm1, xmm2
       C4C17B110E           vmovsd   qword ptr [r14], xmm1
       4D8D7128             lea      r14, bword ptr [r9+40]
       C4C17B100E           vmovsd   xmm1, qword ptr [r14]
       C4C17B105308         vmovsd   xmm2, qword ptr [r11+8]
       C4E16B595338         vmulsd   xmm2, qword ptr [rbx+56]
       4D63F8               movsxd   r15, r8d
       C4A16B5914FE         vmulsd   xmm2, qword ptr [rsi+8*r15]
       C4E1735CCA           vsubsd   xmm1, xmm2
       C4C17B110E           vmovsd   qword ptr [r14], xmm1
       4D8D7130             lea      r14, bword ptr [r9+48]
       C4C17B100E           vmovsd   xmm1, qword ptr [r14]
       C4C17B105310         vmovsd   xmm2, qword ptr [r11+16]
       C4E16B595338         vmulsd   xmm2, qword ptr [rbx+56]
       4D63F8               movsxd   r15, r8d
       C4A16B5914FE         vmulsd   xmm2, qword ptr [rsi+8*r15]
       C4E1735CCA           vsubsd   xmm1, xmm2
       C4C17B110E           vmovsd   qword ptr [r14], xmm1
       4C8D7320             lea      r14, bword ptr [rbx+32]
       C4C17B100B           vmovsd   xmm1, qword ptr [r11]
       C4C173594938         vmulsd   xmm1, qword ptr [r9+56]
       4D63F8               movsxd   r15, r8d
       C4A173590CFE         vmulsd   xmm1, qword ptr [rsi+8*r15]
       C4C173580E           vaddsd   xmm1, qword ptr [r14]
       C4C17B110E           vmovsd   qword ptr [r14], xmm1
       4C8D7328             lea      r14, bword ptr [rbx+40]
       C4C17B104BNaN
Advance 1 No GC 00:00:07.2551150
08         vmovsd   xmm1, qword ptr [r11+8]
       C4C173594938         vmulsd   xmm1, qword ptr [r9+56]
       4D63F8               movsxd   r15, r8d
       C4A173590CFE         vmulsd   xmm1, qword ptr [rsi+8*r15]
       C4C173580E           vaddsd   xmm1, qword ptr [r14]
       C4C17B110E           vmovsd   qword ptr [r14], xmm1
       4883C330             add      rbx, 48
       C4C17B104B10         vmovsd   xmm1, qword ptr [r11+16]
       C4C173594938         vmulsd   xmm1, qword ptr [r9+56]
       4D63D8               movsxd   r11, r8d
       C4A173590CDE         vmulsd   xmm1, qword ptr [rsi+8*r11]
       C4E173580B           vaddsd   xmm1, qword ptr [rbx]
       C4E17B110B           vmovsd   qword ptr [rbx], xmm1
       41FFC2               inc      r10d
       41FFC0               inc      r8d
       4183FA05             cmp      r10d, 5
       0F8CFDFEFFFF         jl       G_M21290_IG13

G_M21290_IG14:
       FFC2                 inc      edx
       83FA04               cmp      edx, 4
       0F8CDAFEFFFF         jl       G_M21290_IG12

G_M21290_IG15:
       4533C0               xor      r8d, r8d

G_M21290_IG16:
       4D63D0               movsxd   r10, r8d
       49C1E206             shl      r10, 6
       4D8BCA               mov      r9, r10
       4C030F               add      r9, qword ptr [rdi]
       C4E17828C8           vmovaps  xmm1, xmm0
       C4C173594920         vmulsd   xmm1, qword ptr [r9+32]
       C4C1735809           vaddsd   xmm1, qword ptr [r9]
       C4C17B1109           vmovsd   qword ptr [r9], xmm1
       498D5108             lea      rdx, bword ptr [r9+8]
       C4E17828C8           vmovaps  xmm1, xmm0
       C4C173594928         vmulsd   xmm1, qword ptr [r9+40]
       C4E173580A           vaddsd   xmm1, qword ptr [rdx]
       C4E17B110A           vmovsd   qword ptr [rdx], xmm1
       498D5110             lea      rdx, bword ptr [r9+16]
       C4E17828C8           vmovaps  xmm1, xmm0
       C4C173594930         vmulsd   xmm1, qword ptr [r9+48]
       C4E173580A           vaddsd   xmm1, qword ptr [rdx]
       C4E17B110A           vmovsd   qword ptr [rdx], xmm1
       41FFC0               inc      r8d
       4183F805             cmp      r8d, 5
       7CA3                 jl       SHORT G_M21290_IG16

G_M21290_IG17:
       8BD1                 mov      edx, ecx
       8D4AFF               lea      ecx, [rdx-1]
       85D2                 test     edx, edx
       0F8FC4FCFFFF         jg       G_M21290_IG03

G_M21290_IG18:
       5B                   pop      rbx
       415E                 pop      r14
       415F                 pop      r15
       5D                   pop      rbp
       C3                   ret      

; Total bytes of code 860, prolog size 14 for method NBodySystem:Advance(double,long,long,int):this
; ============================================================
