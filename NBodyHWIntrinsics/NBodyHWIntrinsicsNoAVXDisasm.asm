; Assembly listing for method NBodyHWIntrinsics.NBody:Main(ref)
; Emitting BLENDED_CODE for X64 CPU with SSE2
; optimized code
; rbp based frame
; partially interruptible
; Final local variable assignments
;
;  V00 arg0         [V00,T01] (  5,  4   )     ref  ->  rsi         class-hnd
;  V01 loc0         [V01,T00] (  6,  6   )    long  ->  rdi        
;* V02 loc1         [V02    ] (  0,  0   )     int  ->  zero-ref   
;  V03 loc2         [V03,T24] (  4,  4   )  double  ->  mm6         ld-addr-op
;  V04 OutArgs      [V04    ] (  1,  1   )  lclBlk (32) [rsp+0x00]  
;  V05 tmp1         [V05,T02] (  3,  6   )     ref  ->  rbx         class-hnd
;  V06 tmp2         [V06,T13] (  3,  2   )     int  ->  rdx        
;  V07 tmp3         [V07,T03] (  3,  6   )     ref  ->  rsi         class-hnd
;* V08 tmp4         [V08    ] (  0,  0   )  double  ->  zero-ref   
;  V09 tmp5         [V09,T04] (  4,  4   )     ref  ->  rcx         class-hnd
;* V10 tmp6         [V10    ] (  0,  0   )  struct (16) zero-ref   
;* V11 tmp7         [V11    ] (  0,  0   )  struct (16) zero-ref   
;* V12 tmp8         [V12    ] (  0,  0   )  struct (16) zero-ref   
;* V13 tmp9         [V13    ] (  0,  0   )  struct (16) zero-ref    ld-addr-op
;  V14 tmp10        [V14,T12] (  3,  3   )     int  ->  rbx        
;  V15 tmp11        [V15,T14] (  2,  2   )   byref  ->  rsi        
;* V16 tmp12        [V16    ] (  0,  0   )  struct ( 8) zero-ref   
;* V17 tmp13        [V17    ] (  0,  0   )    bool  ->  zero-ref   
;* V18 tmp14        [V18    ] (  0,  0   )  double  ->  zero-ref   
;  V19 tmp15        [V19,T17] (  2,  1   )   byref  ->  rsi         V10._pointer(offs=0x00) P-INDEP
;  V20 tmp16        [V20,T21] (  2,  1   )     int  ->  rax         V10._length(offs=0x08) P-INDEP
;  V21 tmp17        [V21,T18] (  2,  1   )   byref  ->  rsi         V11._pointer(offs=0x00) P-INDEP
;  V22 tmp18        [V22,T22] (  2,  1   )     int  ->  rbx         V11._length(offs=0x08) P-INDEP
;  V23 tmp19        [V23,T19] (  2,  1   )   byref  ->  rsi         V12._pointer(offs=0x00) P-INDEP
;  V24 tmp20        [V24,T23] (  2,  1   )     int  ->  rax         V12._length(offs=0x08) P-INDEP
;* V25 tmp21        [V25    ] (  0,  0   )   byref  ->  zero-ref    V13._pointer(offs=0x00) P-INDEP
;* V26 tmp22        [V26    ] (  0,  0   )     int  ->  zero-ref    V13._length(offs=0x08) P-INDEP
;  V27 tmp23        [V27,T20] (  2,  1   )   byref  ->  rsi         V16._value(offs=0x00) P-INDEP
;  V28 tmp24        [V28,T05] (  2,  4   )     ref  ->   r8        
;  V29 tmp25        [V29,T06] (  2,  4   )     ref  ->  r14        
;  V30 tmp26        [V30,T07] (  2,  4   )     ref  ->  rdx        
;  V31 tmp27        [V31    ] (  2,  2   )  struct (16) [rbp+0x08]   do-not-enreg[XSB] must-init addr-exposed
;  V32 tmp28        [V32,T11] (  3,  3   )   byref  ->  rdx         stack-byref
;  V33 tmp29        [V33,T15] (  2,  2   )     ref  ->   r8        
;  V34 tmp30        [V34,T08] (  2,  4   )     ref  ->   r8        
;  V35 tmp31        [V35,T09] (  2,  4   )     ref  ->  rdi        
;  V36 tmp32        [V36,T10] (  2,  4   )     ref  ->  rdx        
;* V37 GsCookie     [V37    ] (  0,  0   )    long  ->  zero-ref    do-not-enreg[X] must-init addr-exposed
;  V38 LocAllocSP   [V38    ] (  1,  1   )    long  ->  [rbp+0x18]   do-not-enreg[X] must-init addr-exposed
;  V39 cse0         [V39,T16] (  3,  1.50)     ref  ->   r8        
;
; Lcl frame size = 80

G_M55945_IG01:
       55                   push     rbp
       4156                 push     r14
       57                   push     rdi
       56                   push     rsi
       53                   push     rbx
       4883EC50             sub      rsp, 80
       0F29742440           movaps   qword ptr [rsp+40H], xmm6
       488D6C2420           lea      rbp, [rsp+20H]
       488BF1               mov      rsi, rcx
       488D7D00             lea      rdi, [rbp]
       B908000000           mov      ecx, 8
       33C0                 xor      rax, rax
       F3AB                 rep stosd 
       488BCE               mov      rcx, rsi
       48896518             mov      qword ptr [rbp+18H], rsp
       48B878563412F0DEBC9A mov      rax, 0x9ABCDEF012345678
       48894500             mov      qword ptr [rbp], rax
       488BF1               mov      rsi, rcx

G_M55945_IG02:
       4883C420             add      rsp, 32
       BF20000000           mov      edi, 32

G_M55945_IG03:
       6A00                 push     0
       6A00                 push     0
       48FFCF               dec      rdi
       75F7                 jne      SHORT G_M55945_IG03
       4883EC20             sub      rsp, 32
       488D7C2420           lea      rdi, [rsp+20H]
       48896518             mov      qword ptr [rbp+18H], rsp
       488BCF               mov      rcx, rdi
       488BD7               mov      rdx, rdi
       E812EFFFFF           call     NBodyHWIntrinsics.NBody:Initialize(long):this
       E8F5F1FFFF           call     System.Console:get_Out():ref
       488BD8               mov      rbx, rax
       488BCF               mov      rcx, rdi
       E812EFFFFF           call     NBodyHWIntrinsics.NBody:Energy():double:this
       0F28F0               movaps   xmm6, xmm0
       48B8003459D4E7010000 mov      rax, 0x1E7D4593400
       4C8B30               mov      r14, gword ptr [rax]
       E8E55DFFFF           call     System.Globalization.NumberFormatInfo:get_CurrentInfo():ref
       4C8BC0               mov      r8, rax
       498BD6               mov      rdx, r14
       0F28C6               movaps   xmm0, xmm6
       E82FFDFFFF           call     System.Number:FormatDouble(double,ref,ref):ref
       488BD0               mov      rdx, rax
       488BCB               mov      rcx, rbx
       488B03               mov      rax, qword ptr [rbx]
       488B8080000000       mov      rax, qword ptr [rax+128]
       FF5010               call     gword ptr [rax+16]System.IO.TextWriter:WriteLineAsync(ref):ref:this
       837E0800             cmp      dword ptr [rsi+8], 0
       7507                 jne      SHORT G_M55945_IG04
       BA80F0FA02           mov      edx, 0x2FAF080
       EB63                 jmp      SHORT G_M55945_IG06

G_M55945_IG04:
       837E0800             cmp      dword ptr [rsi+8], 0
       0F86DC000000         jbe      G_M55945_IG10
       488B4E10             mov      rcx, gword ptr [rsi+16]
       4885C9               test     rcx, rcx
       0F84C4000000         je       G_M55945_IG09

G_M55945_IG05:
       488D710C             lea      rsi, bword ptr [rcx+12]
       8B5908               mov      ebx, dword ptr [rcx+8]
       85DB                 test     ebx, ebx
       0F9DC1               setge    cl
       0FB6C9               movzx    rcx, cl
       48BA603059D4E7010000 mov      rdx, 0x1E7D4593060
       4C8B02               mov      r8, gword ptr [rdx]
       498BD0               mov      rdx, r8
       E81C4C8F72           call     System.Diagnostics.Debug:Assert(bool,ref,ref)
       8BC3                 mov      eax, ebx
       8BD8                 mov      ebx, eax
       8BC3                 mov      eax, ebx
       488D5508             lea      rdx, bword ptr [rbp+08H]
       488932               mov      bword ptr [rdx], rsi
       894208               mov      dword ptr [rdx+8], eax
       E8675DFFFF           call     System.Globalization.NumberFormatInfo:get_CurrentInfo():ref
       4C8BC0               mov      r8, rax
       488D4D08             lea      rcx, bword ptr [rbp+08H]
       BA07000000           mov      edx, 7
       E8FEFBFFFF           call     System.Number:ParseInt32(struct,int,ref):int
       8BD0                 mov      edx, eax

G_M55945_IG06:
       F20F101584000000     movsd    xmm2, qword ptr [reloc @RWD00]
       488BCF               mov      rcx, rdi
       E86CEEFFFF           call     NBodyHWIntrinsics.NBody:Advance(int,double):this
       E82FF1FFFF           call     System.Console:get_Out():ref
       488BF0               mov      rsi, rax
       488BCF               mov      rcx, rdi
       E84CEEFFFF           call     NBodyHWIntrinsics.NBody:Energy():double:this
       0F28F0               movaps   xmm6, xmm0
       48B8003459D4E7010000 mov      rax, 0x1E7D4593400
       488B38               mov      rdi, gword ptr [rax]
       E81F5DFFFF           call     System.Globalization.NumberFormatInfo:get_CurrentInfo():ref
       4C8BC0               mov      r8, rax
       488BD7               mov      rdx, rdi
       0F28C6               movaps   xmm0, xmm6
       E869FCFFFF           call     System.Number:FormatDouble(double,ref,ref):ref
       488BD0               mov      rdx, rax
       488BCE               mov      rcx, rsi
       488B06               mov      rax, qword ptr [rsi]
       488B4070             mov      rax, qword ptr [rax+112]
       FF5028               call     qword ptr [rax+40]System.IO.TextWriter:WriteLine(ref):this
       48B978563412F0DEBC9A mov      rcx, 0x9ABCDEF012345678
       48394D00             cmp      qword ptr [rbp], rcx
       7405                 je       SHORT G_M55945_IG07
       E87CBE315F           call     CORINFO_HELP_FAIL_FAST

G_M55945_IG07:
       90                   nop      

G_M55945_IG08:
       0F287520             movaps   xmm6, qword ptr [rbp+20H]
       488D6530             lea      rsp, [rbp+30H]
       5B                   pop      rbx
       5E                   pop      rsi
       5F                   pop      rdi
       415E                 pop      r14
       5D                   pop      rbp
       C3                   ret      

G_M55945_IG09:
       B945000000           mov      ecx, 69
       E8CAFDFFFF           call     System.ThrowHelper:ThrowArgumentNullException(int)
       CC                   int3     

G_M55945_IG10:
       E83C5F325F           call     CORINFO_HELP_RNGCHKFAIL
       CC                   int3     

; Total bytes of code 421, prolog size 57 for method NBodyHWIntrinsics.NBody:Main(ref)
; ============================================================
; Assembly listing for method NBodyHWIntrinsics.NBody:Initialize(long):this
; Emitting BLENDED_CODE for X64 CPU with SSE2
; optimized code
; rsp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T15] (  3,  3   )   byref  ->  rcx         this
;  V01 arg1         [V01,T16] (  3,  3   )    long  ->  rdx        
;  V02 loc0         [V02,T21] (  3,  2.50)    long  ->  rcx        
;* V03 loc1         [V03    ] (  0,  0   )    long  ->  zero-ref    ptr
;* V04 loc2         [V04    ] (  0,  0   )    long  ->  zero-ref    ptr
;  V05 loc3         [V05,T06] ( 11, 17   )  simd16  ->  mm0        
;  V06 loc4         [V06,T12] (  4, 10   )  simd16  ->  mm1        
;  V07 loc5         [V07,T09] (  9, 15   )  simd16  ->  mm2        
;  V08 loc6         [V08,T10] (  4, 13   )  simd16  ->  mm4        
;  V09 loc7         [V09,T14] (  4,  7   )  simd16  ->  mm5        
;  V10 loc8         [V10,T17] (  2,  5   )    long  ->  rax        
;  V11 loc9         [V11,T07] (  5, 17   )     int  ->  rcx        
;  V12 loc10        [V12,T03] (  5, 20   )  simd16  ->  mm3        
;  V13 loc11        [V13,T04] (  5, 20   )  simd16  ->  mm6        
;  V14 loc12        [V14,T05] (  5, 20   )  simd16  ->  mm7        
;  V15 loc13        [V15,T02] (  8, 32   )  simd16  ->  mm8        
;# V16 OutArgs      [V16    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V17 tmp1         [V17,T13] (  9,  8   )    long  ->  rax        
;  V18 tmp2         [V18    ] (  1,  1   )     blk (32) [rsp+0x00]   do-not-enreg[X] must-init addr-exposed ptr unsafe-buffer
;  V19 tmp3         [V19,T11] (  6, 12   )    long  ->  rax        
;  V20 tmp4         [V20,T19] (  3,  3   )  simd16  ->  mm3        
;  V21 tmp5         [V21,T20] (  3,  3   )  simd16  ->  mm3        
;* V22 tmp6         [V22    ] (  0,  0   )    long  ->  zero-ref   
;  V23 tmp7         [V23,T08] (  2, 16   )    long  ->   r8        
;  V24 tmp8         [V24    ] (  1,  8   )  simd16  ->  [rsp+0x20]   do-not-enreg[SB] ptr
;  V25 tmp9         [V25    ] (  1,  8   )    long  ->  [rsp+0x20]   do-not-enreg[] V24._00(offs=0x00) P-DEP
;  V26 tmp10        [V26    ] (  1,  8   )    long  ->  [rsp+0x28]   do-not-enreg[] V24._01(offs=0x08) P-DEP
;* V27 GsCookie     [V27    ] (  0,  0   )    long  ->  zero-ref    do-not-enreg[X] must-init addr-exposed
;  V28 tmp12        [V28,T00] ( 43, 64   )   byref  ->  rdx         this
;  V29 tmp13        [V29,T18] (  4,  3   )    long  ->  rax        
;  V30 cse0         [V30,T01] (  9, 36   )    long  ->   r9        
;
; Lcl frame size = 136

G_M2790_IG01:
       57                   push     rdi
       56                   push     rsi
       4881EC88000000       sub      rsp, 136
       0F29742470           movaps   qword ptr [rsp+70H], xmm6
       0F297C2460           movaps   qword ptr [rsp+60H], xmm7
       440F29442450         movaps   qword ptr [rsp+50H], xmm8
       440F294C2440         movaps   qword ptr [rsp+40H], xmm9
       488BF1               mov      rsi, rcx
       488D3C24             lea      rdi, [rsp]
       B910000000           mov      ecx, 16
       33C0                 xor      rax, rax
       F3AB                 rep stosd 
       488BCE               mov      rcx, rsi
       48B878563412F0DEBC9A mov      rax, 0x9ABCDEF012345678
       4889442438           mov      qword ptr [rsp+38H], rax

G_M2790_IG02:
       488BC2               mov      rax, rdx
       488BD1               mov      rdx, rcx
       488BC8               mov      rcx, rax
       4883E10F             and      rcx, 15
       4885C9               test     rcx, rcx
       740A                 je       SHORT G_M2790_IG03
       48F7D9               neg      rcx
       488D440110           lea      rax, [rcx+rax+16]
       EB00                 jmp      SHORT G_M2790_IG03

G_M2790_IG03:
       488982C0010000       mov      qword ptr [rdx+448], rax
       488D4840             lea      rcx, [rax+64]
       48898AC8010000       mov      qword ptr [rdx+456], rcx
       488D8880000000       lea      rcx, [rax+128]
       48898AD0010000       mov      qword ptr [rdx+464], rcx
       488D88C0000000       lea      rcx, [rax+192]
       48898AD8010000       mov      qword ptr [rdx+472], rcx
       488D8800010000       lea      rcx, [rax+256]
       48898AE0010000       mov      qword ptr [rdx+480], rcx
       488D8840010000       lea      rcx, [rax+320]
       48898AE8010000       mov      qword ptr [rdx+488], rcx
       480580010000         add      rax, 384
       488982F0010000       mov      qword ptr [rdx+496], rax
       488B82C0010000       mov      rax, qword ptr [rdx+448]
       F20F10059D030000     movsd    xmm0, qword ptr [reloc @RWD00]
       F20F114010           movsd    qword ptr [rax+16], xmm0
       488B82C0010000       mov      rax, qword ptr [rdx+448]
       F20F100591030000     movsd    xmm0, qword ptr [reloc @RWD08]
       F20F114018           movsd    qword ptr [rax+24], xmm0
       488B82C0010000       mov      rax, qword ptr [rdx+448]
       F20F100585030000     movsd    xmm0, qword ptr [reloc @RWD16]
       F20F114020           movsd    qword ptr [rax+32], xmm0
       488B82C0010000       mov      rax, qword ptr [rdx+448]
       F20F100579030000     movsd    xmm0, qword ptr [reloc @RWD24]
       F20F114028           movsd    qword ptr [rax+40], xmm0
       488B82C8010000       mov      rax, qword ptr [rdx+456]
       F20F10056D030000     movsd    xmm0, qword ptr [reloc @RWD32]
       F20F114010           movsd    qword ptr [rax+16], xmm0
       488B82C8010000       mov      rax, qword ptr [rdx+456]
       F20F100561030000     movsd    xmm0, qword ptr [reloc @RWD40]
       F20F114018           movsd    qword ptr [rax+24], xmm0
       488B82C8010000       mov      rax, qword ptr [rdx+456]
       F20F100555030000     movsd    xmm0, qword ptr [reloc @RWD48]
       F20F114020           movsd    qword ptr [rax+32], xmm0
       488B82C8010000       mov      rax, qword ptr [rdx+456]
       F20F100549030000     movsd    xmm0, qword ptr [reloc @RWD56]
       F20F114028           movsd    qword ptr [rax+40], xmm0
       488B82D0010000       mov      rax, qword ptr [rdx+464]
       F20F10053D030000     movsd    xmm0, qword ptr [reloc @RWD64]
       F20F114010           movsd    qword ptr [rax+16], xmm0
       488B82D0010000       mov      rax, qword ptr [rdx+464]
       F20F100531030000     movsd    xmm0, qword ptr [reloc @RWD72]
       F20F114018           movsd    qword ptr [rax+24], xmm0
       488B82D0010000       mov      rax, qword ptr [rdx+464]
       F20F100525030000     movsd    xmm0, qword ptr [reloc @RWD80]
       F20F114020           movsd    qword ptr [rax+32], xmm0
       488B82D0010000       mov      rax, qword ptr [rdx+464]
       F20F100519030000     movsd    xmm0, qword ptr [reloc @RWD88]
       F20F114028           movsd    qword ptr [rax+40], xmm0
       488B82D8010000       mov      rax, qword ptr [rdx+472]
       F20F10050D030000     movsd    xmm0, qword ptr [reloc @RWD96]
       F20F114010           movsd    qword ptr [rax+16], xmm0
       488B82D8010000       mov      rax, qword ptr [rdx+472]
       F20F100501030000     movsd    xmm0, qword ptr [reloc @RWD104]
       F20F114018           movsd    qword ptr [rax+24], xmm0
       488B82D8010000       mov      rax, qword ptr [rdx+472]
       F20F1005F5020000     movsd    xmm0, qword ptr [reloc @RWD112]
       F20F114020           movsd    qword ptr [rax+32], xmm0
       488B82D8010000       mov      rax, qword ptr [rdx+472]

G_M2790_IG04:
       F20F1005E9020000     movsd    xmm0, qword ptr [reloc @RWD120]
       F20F114028           movsd    qword ptr [rax+40], xmm0
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       F20F1005DD020000     movsd    xmm0, qword ptr [reloc @RWD128]
       F20F114010           movsd    qword ptr [rax+16], xmm0
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       F20F1005D1020000     movsd    xmm0, qword ptr [reloc @RWD136]
       F20F114018           movsd    qword ptr [rax+24], xmm0
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       F20F1005C5020000     movsd    xmm0, qword ptr [reloc @RWD144]
       F20F114020           movsd    qword ptr [rax+32], xmm0
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       F20F1005B9020000     movsd    xmm0, qword ptr [reloc @RWD152]
       F20F114028           movsd    qword ptr [rax+40], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       F20F1005AD020000     movsd    xmm0, qword ptr [reloc @RWD160]
       F20F114010           movsd    qword ptr [rax+16], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       F20F1005A1020000     movsd    xmm0, qword ptr [reloc @RWD168]
       F20F114018           movsd    qword ptr [rax+24], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       F20F100595020000     movsd    xmm0, qword ptr [reloc @RWD176]
       F20F114020           movsd    qword ptr [rax+32], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       F20F100589020000     movsd    xmm0, qword ptr [reloc @RWD184]
       F20F114028           movsd    qword ptr [rax+40], xmm0
       488B82F0010000       mov      rax, qword ptr [rdx+496]
       F20F10057D020000     movsd    xmm0, qword ptr [reloc @RWD192]
       F20F1100             movsd    qword ptr [rax], xmm0
       660F57C0             xorpd    xmm0, xmm0
       660F57C9             xorpd    xmm1, xmm1
       660F57D2             xorpd    xmm2, xmm2
       F20F101D6D020000     movsd    xmm3, qword ptr [reloc @RWD200]
       660F28E3             movapd   xmm4, xmm3
       660F57DB             xorpd    xmm3, xmm3
       F20F10DC             movsd    xmm3, xmm4
       0F28E3               movaps   xmm4, xmm3
       660F14E3             unpcklpd  xmm4, xmm3
       F20F101D5A020000     movsd    xmm3, qword ptr [reloc @RWD208]
       660F28EB             movapd   xmm5, xmm3
       660F57DB             xorpd    xmm3, xmm3
       F20F10DD             movsd    xmm3, xmm5
       0F28EB               movaps   xmm5, xmm3
       660F14EB             unpcklpd  xmm5, xmm3
       488D0424             lea      rax, bword ptr [rsp]
       F20F101D43020000     movsd    xmm3, qword ptr [reloc @RWD216]
       F20F1118             movsd    qword ptr [rax], xmm3
       F20F101D3F020000     movsd    xmm3, qword ptr [reloc @RWD224]
       F20F115808           movsd    qword ptr [rax+8], xmm3
       F20F101D3A020000     movsd    xmm3, qword ptr [reloc @RWD232]
       F20F115810           movsd    qword ptr [rax+16], xmm3
       F20F101D35020000     movsd    xmm3, qword ptr [reloc @RWD240]
       F20F115818           movsd    qword ptr [rax+24], xmm3
       B902000000           mov      ecx, 2

G_M2790_IG05:
       4C8B82D8010000       mov      r8, qword ptr [rdx+472]
       4C63C9               movsxd   r9, ecx
       49C1E103             shl      r9, 3
       4D03C1               add      r8, r9
       66410F2818           movapd   xmm3, xmmword ptr [r8]
       4D8BC1               mov      r8, r9
       4C0382E0010000       add      r8, qword ptr [rdx+480]
       66410F2830           movapd   xmm6, xmmword ptr [r8]
       4D8BC1               mov      r8, r9
       4C0382E8010000       add      r8, qword ptr [rdx+488]
       66410F2838           movapd   xmm7, xmmword ptr [r8]
       660F59DC             mulpd    xmm3, xmm4
       660F59F4             mulpd    xmm6, xmm4
       660F59FC             mulpd    xmm7, xmm4
       460F104408F0         movups   xmm8, xmmword ptr [rax+r9-16]
       66440F59C5           mulpd    xmm8, xmm5
       450F28C8             movaps   xmm9, xmm8
       66440F59CB           mulpd    xmm9, xmm3
       66410F58C1           addpd    xmm0, xmm9
       450F28C8             movaps   xmm9, xmm8
       66440F59CE           mulpd    xmm9, xmm6
       66410F58C9           addpd    xmm1, xmm9
       450F28C8             movaps   xmm9, xmm8
       66440F59CF           mulpd    xmm9, xmm7
       66410F58D1           addpd    xmm2, xmm9
       4D8BC1               mov      r8, r9
       4C0382F0010000       add      r8, qword ptr [rdx+496]
       440F29442420         movaps   xmmword ptr [rsp+20H], xmm8
       450F1100             movups   xmmword ptr [r8], xmm8
       4D8BC1               mov      r8, r9
       4C0382D8010000       add      r8, qword ptr [rdx+472]
       66410F2918           movapd   xmmword ptr [r8], xmm3
       4D8BC1               mov      r8, r9
       4C0382E0010000       add      r8, qword ptr [rdx+480]
       66410F2930           movapd   xmmword ptr [r8], xmm6
       4C038AE8010000       add      r9, qword ptr [rdx+488]
       66410F2939           movapd   xmmword ptr [r9], xmm7
       83C102               add      ecx, 2
       83F906               cmp      ecx, 6
       0F8C41FFFFFF         jl       G_M2790_IG05

G_M2790_IG06:
       660F7CC1             haddpd   xmm0, xmm1
       660F5EC5             divpd    xmm0, xmm5
       0F28CA               movaps   xmm1, xmm2
       660F7CCA             haddpd   xmm1, xmm2
       0F28D1               movaps   xmm2, xmm1
       660F5ED5             divpd    xmm2, xmm5
       488B82D8010000       mov      rax, qword ptr [rdx+472]
       F20F10C8             movsd    xmm1, xmm0
       F20F1108             movsd    qword ptr [rax], xmm1
       660F73D808           psrldq   xmm0, 8
       488B82E0010000       mov      rax, qword ptr [rdx+480]
       F20F1100             movsd    qword ptr [rax], xmm0
       488B82E8010000       mov      rax, qword ptr [rdx+488]
       F20F1110             movsd    qword ptr [rax], xmm2
       48B978563412F0DEBC9A mov      rcx, 0x9ABCDEF012345678
       48394C2438           cmp      qword ptr [rsp+38H], rcx
       7405                 je       SHORT G_M2790_IG07
       E826A7315F           call     CORINFO_HELP_FAIL_FAST

G_M2790_IG07:
       90                   nop      

G_M2790_IG08:
       0F28742470           movaps   xmm6, qword ptr [rsp+70H]
       0F287C2460           movaps   xmm7, qword ptr [rsp+60H]
       440F28442450         movaps   xmm8, qword ptr [rsp+50H]
       440F284C2440         movaps   xmm9, qword ptr [rsp+40H]
       4881C488000000       add      rsp, 136
       5E                   pop      rsi
       5F                   pop      rdi
       C3                   ret      

; Total bytes of code 1115, prolog size 65 for method NBodyHWIntrinsics.NBody:Initialize(long):this
; ============================================================
; Assembly listing for method NBodyHWIntrinsics.NBody:Energy():double:this
; Emitting BLENDED_CODE for X64 CPU with SSE2
; optimized code
; rsp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T48] (  9,  9   )   byref  ->  rcx         this
;  V01 loc0         [V01,T40] (  4, 13   )    long  ->  [rsp+0x18]  
;  V02 loc1         [V02,T41] (  4, 13   )    long  ->   r9        
;  V03 loc2         [V03,T42] (  4, 13   )    long  ->  r11        
;  V04 loc3         [V04,T43] (  4, 13   )    long  ->  rsi        
;  V05 loc4         [V05,T44] (  4, 13   )    long  ->  rdi        
;  V06 loc5         [V06,T45] (  4, 13   )    long  ->  [rsp+0x10]  
;  V07 loc6         [V07,T46] (  4, 13   )    long  ->  rbp        
;  V08 loc7         [V08,T27] (  9, 45   )  simd16  ->  mm0        
;  V09 loc8         [V09,T49] (  2,  5   )  simd16  ->  [rsp+0x00]  
;  V10 loc9         [V10,T47] (  4, 13   )     int  ->  r14        
;  V11 loc10        [V11,T26] (  5, 57   )     int  ->  r15        
;  V12 loc11        [V12,T28] (  6, 40   )  simd16  ->  mm1        
;  V13 loc12        [V13,T18] ( 16, 84   )  simd16  ->  mm3        
;  V14 loc13        [V14,T35] (  5, 20   )  simd16  ->  mm4        
;  V15 loc14        [V15,T36] (  5, 20   )  simd16  ->  mm5        
;  V16 loc15        [V16,T37] (  2, 20   )  simd16  ->  mm4        
;  V17 loc16        [V17,T38] (  2, 20   )  simd16  ->  mm5        
;  V18 loc17        [V18,T39] (  2, 20   )  simd16  ->  mm6        
;  V19 loc18        [V19,T19] (  6, 84   )     int  ->  r12        
;# V20 OutArgs      [V20    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V21 tmp1         [V21,T50] (  3,  3   )  simd16  ->  mm1        
;  V22 tmp2         [V22,T03] (  7,192   )     int  ->  r13        
;  V23 tmp3         [V23,T04] (  7,192   )  simd16  ->  mm10        
;  V24 tmp4         [V24,T00] ( 12,384   )  simd16  ->  mm11        
;  V25 tmp5         [V25,T01] (  9,288   )  simd16  ->  registers  
;  V26 tmp6         [V26,T02] (  7,224   )  simd16  ->  mm13        
;  V27 tmp7         [V27,T14] (  2, 96   )  simd16  ->  mm7        
;  V28 tmp8         [V28,T15] (  2, 96   )  simd16  ->  mm8        
;  V29 tmp9         [V29,T16] (  2, 96   )  simd16  ->  mm9        
;  V30 tmp10        [V30,T17] (  2, 96   )  simd16  ->  mm3        
;  V31 tmp11        [V31,T51] (  2, 32   )  double  ->  mm2        
;  V32 tmp12        [V32,T05] (  6,192   )  simd16  ->  mm0        
;  V33 tmp13        [V33,T20] (  2, 64   )  simd16  ->  mm10        
;  V34 tmp14        [V34,T09] (  2,128   )  simd16  ->  mm13        
;  V35 tmp15        [V35,T21] (  2, 64   )  simd16  ->  mm14        
;  V36 tmp16        [V36,T22] (  2, 64   )  simd16  ->  mm15        
;  V37 tmp17        [V37,T23] (  2, 64   )  simd16  ->  mm2        
;* V38 tmp18        [V38    ] (  0,  0   )  simd16  ->  zero-ref   
;  V39 tmp19        [V39,T06] (  5,160   )  simd16  ->  mm12        
;  V40 tmp20        [V40,T07] (  5,160   )  simd16  ->  mm13        
;  V41 tmp21        [V41,T24] (  2, 64   )  simd16  ->  mm11        
;  V42 tmp22        [V42,T25] (  2, 64   )  simd16  ->  mm2        
;  V43 tmp23        [V43,T10] (  3, 96   )  simd16  ->  mm12        
;  V44 tmp24        [V44,T11] (  3, 96   )  simd16  ->  mm12        
;  V45 tmp25        [V45,T12] (  3, 96   )  simd16  ->  mm12        
;  V46 tmp26        [V46,T13] (  3, 96   )  simd16  ->  mm12        
;  V47 tmp27        [V47,T33] (  2, 32   )  simd16  ->  mm2        
;  V48 tmp28        [V48,T34] (  2, 32   )  simd16  ->  mm10        
;  V49 cse0         [V49,T08] (  5,160   )    long  ->  rdx        
;  V50 cse1         [V50,T29] (  3, 34   )    long  ->  rcx        
;  V51 cse2         [V51,T30] (  3, 34   )    long  ->  rax        
;  V52 cse3         [V52,T31] (  3, 34   )    long  ->   r8        
;  V53 cse4         [V53,T32] (  3, 34   )    long  ->  r10        
;
; Lcl frame size = 200

G_M55664_IG01:
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       57                   push     rdi
       56                   push     rsi
       55                   push     rbp
       53                   push     rbx
       4881ECC8000000       sub      rsp, 200
       0F29B424B0000000     movaps   qword ptr [rsp+B0H], xmm6
       0F29BC24A0000000     movaps   qword ptr [rsp+A0H], xmm7
       440F29842490000000   movaps   qword ptr [rsp+90H], xmm8
       440F298C2480000000   movaps   qword ptr [rsp+80H], xmm9
       440F29542470         movaps   qword ptr [rsp+70H], xmm10
       440F295C2460         movaps   qword ptr [rsp+60H], xmm11
       440F29642450         movaps   qword ptr [rsp+50H], xmm12
       440F296C2440         movaps   qword ptr [rsp+40H], xmm13
       440F29742430         movaps   qword ptr [rsp+30H], xmm14
       440F297C2420         movaps   qword ptr [rsp+20H], xmm15

G_M55664_IG02:
       488B81C0010000       mov      rax, qword ptr [rcx+448]
       488BD0               mov      rdx, rax
       4C8B81C8010000       mov      r8, qword ptr [rcx+456]
       4D8BC8               mov      r9, r8
       4C8B91D0010000       mov      r10, qword ptr [rcx+464]
       4D8BDA               mov      r11, r10
       488BB1D8010000       mov      rsi, qword ptr [rcx+472]
       488BB9E0010000       mov      rdi, qword ptr [rcx+480]
       488B99E8010000       mov      rbx, qword ptr [rcx+488]
       488B89F0010000       mov      rcx, qword ptr [rcx+496]
       488BE9               mov      rbp, rcx
       660F57C0             xorpd    xmm0, xmm0
       F20F100D2E030000     movsd    xmm1, qword ptr [reloc @RWD00]
       660F28D1             movapd   xmm2, xmm1
       660F57C9             xorpd    xmm1, xmm1
       F20F10CA             movsd    xmm1, xmm2
       0F28D1               movaps   xmm2, xmm1
       660F14D1             unpcklpd  xmm2, xmm1
       4533F6               xor      r14d, r14d
       41BF02000000         mov      r15d, 2

G_M55664_IG03:
       660F284D00           movapd   xmm1, xmmword ptr [rbp]
       660F281E             movapd   xmm3, xmmword ptr [rsi]
       660F2827             movapd   xmm4, xmmword ptr [rdi]
       660F282B             movapd   xmm5, xmmword ptr [rbx]
       0F28F3               movaps   xmm6, xmm3
       660F59F3             mulpd    xmm6, xmm3
       0F28DE               movaps   xmm3, xmm6
       0F28F4               movaps   xmm6, xmm4
       660F59F4             mulpd    xmm6, xmm4
       0F28E6               movaps   xmm4, xmm6
       0F28F5               movaps   xmm6, xmm5
       660F59F5             mulpd    xmm6, xmm5
       0F28EE               movaps   xmm5, xmm6
       660F58DC             addpd    xmm3, xmm4
       660F58DD             addpd    xmm3, xmm5
       660F59D9             mulpd    xmm3, xmm1
       0F28E2               movaps   xmm4, xmm2
       660F59E3             mulpd    xmm4, xmm3
       0F28DC               movaps   xmm3, xmm4
       660F58C3             addpd    xmm0, xmm3
       660F2822             movapd   xmm4, xmmword ptr [rdx]
       66410F2829           movapd   xmm5, xmmword ptr [r9]
       66410F2833           movapd   xmm6, xmmword ptr [r11]
       4533E4               xor      r12d, r12d

G_M55664_IG04:
       4183FC01             cmp      r12d, 1
       750A                 jne      SHORT G_M55664_IG05
       4183FF03             cmp      r15d, 3
       0F8414020000         je       G_M55664_IG13

G_M55664_IG05:
       4585E4               test     r12d, r12d
       7509                 jne      SHORT G_M55664_IG06
       0F28D9               movaps   xmm3, xmm1
       660F14D9             unpcklpd  xmm3, xmm1
       EB07                 jmp      SHORT G_M55664_IG07

G_M55664_IG06:
       0F28D9               movaps   xmm3, xmm1
       660F15D9             unpckhpd  xmm3, xmm1

G_M55664_IG07:
       0F28FC               movaps   xmm7, xmm4
       440F28C5             movaps   xmm8, xmm5
       440F28CE             movaps   xmm9, xmm6
       458BEF               mov      r13d, r15d
       4183FD06             cmp      r13d, 6
       0F8DD7010000         jge      G_M55664_IG12
       4889542418           mov      qword ptr [rsp+18H], rdx
       48895C2410           mov      qword ptr [rsp+10H], rbx
       0F291424             movaps   xmmword ptr [rsp], xmm2

G_M55664_IG08:
       4963D5               movsxd   rdx, r13d
       48C1E203             shl      rdx, 3
       488D1C11             lea      rbx, [rcx+rdx]
       66440F1013           movupd   xmm10, xmmword ptr [rbx]
       488D1C10             lea      rbx, [rax+rdx]
       66440F101B           movupd   xmm11, xmmword ptr [rbx]
       498D1C10             lea      rbx, [r8+rdx]
       66440F1023           movupd   xmm12, xmmword ptr [rbx]
       4903D2               add      rdx, r10
       66440F102A           movupd   xmm13, xmmword ptr [rdx]
       440F28F7             movaps   xmm14, xmm7
       66450F5CF3           subpd    xmm14, xmm11
       450F28DE             movaps   xmm11, xmm14
       450F28F0             movaps   xmm14, xmm8
       66450F5CF4           subpd    xmm14, xmm12
       450F28E6             movaps   xmm12, xmm14
       450F28F1             movaps   xmm14, xmm9
       66450F5CF5           subpd    xmm14, xmm13
       450F28EE             movaps   xmm13, xmm14
       66440F59D3           mulpd    xmm10, xmm3
       450F28F3             movaps   xmm14, xmm11
       66450F59F3           mulpd    xmm14, xmm11
       450F28DE             movaps   xmm11, xmm14
       450F28F4             movaps   xmm14, xmm12
       66450F59F4           mulpd    xmm14, xmm12
       450F28E6             movaps   xmm12, xmm14
       450F28F5             movaps   xmm14, xmm13
       66450F59F5           mulpd    xmm14, xmm13
       450F28EE             movaps   xmm13, xmm14
       66450F58DC           addpd    xmm11, xmm12
       450F28E5             movaps   xmm12, xmm13
       66450F58E3           addpd    xmm12, xmm11
       450F28DC             movaps   xmm11, xmm12
       F2440F1025DD010000   movsd    xmm12, qword ptr [reloc @RWD08]
       66450F28EC           movapd   xmm13, xmm12
       66450F57E4           xorpd    xmm12, xmm12
       F2450F10E5           movsd    xmm12, xmm13
       450F28EC             movaps   xmm13, xmm12
       66450F14EC           unpcklpd  xmm13, xmm12
       F2440F1025C4010000   movsd    xmm12, qword ptr [reloc @RWD16]
       66450F28F4           movapd   xmm14, xmm12
       66450F57E4           xorpd    xmm12, xmm12
       F2450F10E6           movsd    xmm12, xmm14
       450F28F4             movaps   xmm14, xmm12
       66450F14F4           unpcklpd  xmm14, xmm12
       F2440F1025AB010000   movsd    xmm12, qword ptr [reloc @RWD24]
       66450F28FC           movapd   xmm15, xmm12
       66450F57E4           xorpd    xmm12, xmm12
       F2450F10E7           movsd    xmm12, xmm15
       450F28FC             movaps   xmm15, xmm12
       66450F14FC           unpcklpd  xmm15, xmm12
       F2440F102592010000   movsd    xmm12, qword ptr [reloc @RWD32]
       66410F28D4           movapd   xmm2, xmm12
       66450F57E4           xorpd    xmm12, xmm12
       F2440F10E2           movsd    xmm12, xmm2
       410F28D4             movaps   xmm2, xmm12
       66410F14D4           unpcklpd  xmm2, xmm12
       66450F5AE3           cvtpd2ps  xmm12, xmm11
       450F52E4             rsqrtps  xmm12, xmm12
       450F5AE4             cvtps2pd  xmm12, xmm12
       66450F59DC           mulpd    xmm11, xmm12
       66450F59DC           mulpd    xmm11, xmm12
       66450F5CEB           subpd    xmm13, xmm11
       450F28DF             movaps   xmm11, xmm15
       66450F59DD           mulpd    xmm11, xmm13
       66450F58DE           addpd    xmm11, xmm14
       450F28F5             movaps   xmm14, xmm13
       66450F59F5           mulpd    xmm14, xmm13
       66440F59F2           mulpd    xmm14, xmm2
       410F28D6             movaps   xmm2, xmm14
       66410F58D3           addpd    xmm2, xmm11
       450F28DC             movaps   xmm11, xmm12
       66450F59DD           mulpd    xmm11, xmm13
       66440F59DA           mulpd    xmm11, xmm2
       410F28D3             movaps   xmm2, xmm11
       66410F58D4           addpd    xmm2, xmm12
       66440F59D2           mulpd    xmm10, xmm2
       4183FD05             cmp      r13d, 5
       7407                 je       SHORT G_M55664_IG10
       66410F5CC2           subpd    xmm0, xmm10

G_M55664_IG09:
       EB30                 jmp      SHORT G_M55664_IG11

G_M55664_IG10:
       F2410F10D2           movsd    xmm2, xmm10
       66440F28D2           movapd   xmm10, xmm2
       660F57D2             xorpd    xmm2, xmm2
       F2410F10D2           movsd    xmm2, xmm10
       450F57D2             xorps    xmm10, xmm10
       66450F28DA           movapd   xmm11, xmm10
       66450F57D2           xorpd    xmm10, xmm10
       F2450F10D3           movsd    xmm10, xmm11
       66440F14D2           unpcklpd  xmm10, xmm2
       66410F5CC2           subpd    xmm0, xmm10

G_M55664_IG11:
       4183C502             add      r13d, 2
       4183FD06             cmp      r13d, 6
       0F8C45FEFFFF         jl       G_M55664_IG08
       488B542418           mov      rdx, qword ptr [rsp+18H]
       488B5C2410           mov      rbx, qword ptr [rsp+10H]
       0F281424             movaps   xmm2, xmmword ptr [rsp]

G_M55664_IG12:
       41FFC4               inc      r12d
       41FFC7               inc      r15d
       4183FC02             cmp      r12d, 2
       0F8CDCFDFFFF         jl       G_M55664_IG04

G_M55664_IG13:
       4183C602             add      r14d, 2
       4883C510             add      rbp, 16
       4883C610             add      rsi, 16
       4883C710             add      rdi, 16
       4883C310             add      rbx, 16
       4883C210             add      rdx, 16
       4983C110             add      r9, 16
       4983C310             add      r11, 16
       4183FE06             cmp      r14d, 6
       0F8C58FDFFFF         jl       G_M55664_IG03

G_M55664_IG14:
       0F28D8               movaps   xmm3, xmm0
       660F7CD8             haddpd   xmm3, xmm0
       0F28C3               movaps   xmm0, xmm3

G_M55664_IG15:
       0F28B424B0000000     movaps   xmm6, qword ptr [rsp+B0H]
       0F28BC24A0000000     movaps   xmm7, qword ptr [rsp+A0H]
       440F28842490000000   movaps   xmm8, qword ptr [rsp+90H]
       440F288C2480000000   movaps   xmm9, qword ptr [rsp+80H]
       440F28542470         movaps   xmm10, qword ptr [rsp+70H]
       440F285C2460         movaps   xmm11, qword ptr [rsp+60H]
       440F28642450         movaps   xmm12, qword ptr [rsp+50H]
       440F286C2440         movaps   xmm13, qword ptr [rsp+40H]
       440F28742430         movaps   xmm14, qword ptr [rsp+30H]
       440F287C2420         movaps   xmm15, qword ptr [rsp+20H]
       4881C4C8000000       add      rsp, 200
       5B                   pop      rbx
       5D                   pop      rbp
       5E                   pop      rsi
       5F                   pop      rdi
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       C3                   ret      

; Total bytes of code 970, prolog size 89 for method NBodyHWIntrinsics.NBody:Energy():double:this
; ============================================================
-0,169074641
; Assembly listing for method NBodyHWIntrinsics.NBody:Advance(int,double):this
; Emitting BLENDED_CODE for X64 CPU with SSE2
; optimized code
; rsp based frame
; fully interruptible
; Final local variable assignments
;
;  V00 this         [V00,T19] ( 12,208   )   byref  ->  rcx         this
;  V01 arg1         [V01,T58] (  4, 18   )     int  ->  [rsp+0x138]  
;  V02 arg2         [V02,T60] (  3,  3   )  double  ->  mm2        
;  V03 loc0         [V03,T42] (  5,113   )  simd16  ->  [rsp+0x30]  
;  V04 loc1         [V04,T51] (  5, 66   )    long  ->   r8        
;  V05 loc2         [V05,T52] (  5, 66   )    long  ->  r10        
;  V06 loc3         [V06,T53] (  5, 66   )    long  ->  rsi        
;  V07 loc4         [V07,T43] (  7, 98   )    long  ->  [rsp+0x28]  
;  V08 loc5         [V08,T54] (  4, 50   )    long  ->  [rsp+0x20]  
;  V09 loc6         [V09,T55] (  4, 50   )    long  ->  [rsp+0x18]  
;  V10 loc7         [V10,T56] (  4, 50   )    long  ->  r15        
;  V11 loc8         [V11,T46] (  6, 74   )     int  ->  r12        
;  V12 loc9         [V12,T44] (  7, 98   )     int  ->  r13        
;  V13 loc10        [V13,T45] (  2, 80   )  simd16  ->  [rsp+0x00]  
;  V14 loc11        [V14,T31] (  6,144   )  simd16  ->  mm2        
;  V15 loc12        [V15,T32] (  6,144   )  simd16  ->  mm3        
;  V16 loc13        [V16,T33] (  6,144   )  simd16  ->  mm4        
;  V17 loc14        [V17,T11] ( 10,256   )  simd16  ->  mm5        
;  V18 loc15        [V18,T29] (  4,160   )  simd16  ->  mm6        
;  V19 loc16        [V19,T30] (  4,160   )  simd16  ->  mm7        
;  V20 loc17        [V20,T10] (  6,288   )     int  ->  rdx        
;  V21 loc18        [V21,T05] (  7,448   )  simd16  ->  mm8        
;  V22 loc19        [V22,T06] (  7,448   )  simd16  ->  mm9        
;  V23 loc20        [V23,T07] (  7,448   )  simd16  ->  mm10        
;  V24 loc21        [V24,T00] ( 10,640   )  simd16  ->  mm13        
;  V25 loc22        [V25,T12] (  4,256   )  simd16  ->  mm11        
;  V26 loc23        [V26,T13] (  4,256   )  simd16  ->  mm11        
;# V27 OutArgs      [V27    ] (  1,  1   )  lclBlk ( 0) [rsp+0x00]  
;  V28 tmp1         [V28,T57] (  3, 48   )     int  ->  rax        
;  V29 tmp2         [V29,T15] (  2,256   )  simd16  ->  mm0        
;  V30 tmp3         [V30,T16] (  2,256   )  simd16  ->  mm1        
;  V31 tmp4         [V31,T59] (  3,  3   )  simd16  ->  mm1        
;  V32 tmp5         [V32,T02] (  4,512   )  simd16  ->  mm11        
;  V33 tmp6         [V33,T17] (  2,256   )  simd16  ->  mm12        
;  V34 tmp7         [V34,T03] (  4,512   )  simd16  ->  mm13        
;* V35 tmp8         [V35    ] (  0,  0   )  simd16  ->  zero-ref   
;  V36 tmp9         [V36,T20] (  3,192   )  simd16  ->  mm12        
;  V37 tmp10        [V37,T04] (  4,512   )  simd16  ->  mm14        
;  V38 tmp11        [V38,T14] (  4,256   )  simd16  ->  mm15        
;  V39 tmp12        [V39,T34] (  2,128   )  simd16  ->  mm11        
;  V40 tmp13        [V40,T35] (  2,128   )  simd16  ->  mm0        
;  V41 tmp14        [V41,T36] (  2,128   )  simd16  ->  mm14        
;  V42 tmp15        [V42,T21] (  3,192   )  simd16  ->  mm11        
;  V43 tmp16        [V43,T18] (  2,256   )  simd16  ->  mm12        
;  V44 tmp17        [V44,T37] (  2,128   )  simd16  ->  mm14        
;  V45 tmp18        [V45,T38] (  2,128   )  simd16  ->  mm15        
;  V46 tmp19        [V46,T39] (  2,128   )  simd16  ->  mm1        
;* V47 tmp20        [V47    ] (  0,  0   )  simd16  ->  zero-ref   
;  V48 tmp21        [V48,T08] (  5,320   )  simd16  ->  mm11        
;  V49 tmp22        [V49,T09] (  5,320   )  simd16  ->  mm12        
;  V50 tmp23        [V50,T40] (  2,128   )  simd16  ->  mm13        
;  V51 tmp24        [V51,T41] (  2,128   )  simd16  ->  mm1        
;  V52 tmp25        [V52,T22] (  3,192   )  simd16  ->  mm11        
;  V53 tmp26        [V53,T23] (  3,192   )  simd16  ->  mm11        
;  V54 tmp27        [V54,T24] (  3,192   )  simd16  ->  mm11        
;  V55 tmp28        [V55,T25] (  3,192   )  simd16  ->  mm11        
;  V56 cse0         [V56,T26] (  3,192   )    long  ->  rbp        
;  V57 cse1         [V57,T27] (  3,192   )    long  ->  rbp        
;  V58 cse2         [V58,T28] (  3,192   )    long  ->  rbp        
;  V59 cse3         [V59,T01] (  8,512   )    long  ->  rbx        
;  V60 cse4         [V60,T47] (  3, 68   )    long  ->  rdi        
;  V61 cse5         [V61,T48] (  3, 68   )    long  ->  rax        
;  V62 cse6         [V62,T49] (  3, 68   )    long  ->   r9        
;  V63 cse7         [V63,T50] (  3, 68   )    long  ->  r11        
;
; Lcl frame size = 232

G_M31513_IG01:
       4157                 push     r15
       4156                 push     r14
       4155                 push     r13
       4154                 push     r12
       57                   push     rdi
       56                   push     rsi
       55                   push     rbp
       53                   push     rbx
       4881ECE8000000       sub      rsp, 232
       0F29B424D0000000     movaps   qword ptr [rsp+D0H], xmm6
       0F29BC24C0000000     movaps   qword ptr [rsp+C0H], xmm7
       440F298424B0000000   movaps   qword ptr [rsp+B0H], xmm8
       440F298C24A0000000   movaps   qword ptr [rsp+A0H], xmm9
       440F29942490000000   movaps   qword ptr [rsp+90H], xmm10
       440F299C2480000000   movaps   qword ptr [rsp+80H], xmm11
       440F29642470         movaps   qword ptr [rsp+70H], xmm12
       440F296C2460         movaps   qword ptr [rsp+60H], xmm13
       440F29742450         movaps   qword ptr [rsp+50H], xmm14
       440F297C2440         movaps   qword ptr [rsp+40H], xmm15

G_M31513_IG02:
       660F57C9             xorpd    xmm1, xmm1
       F20F10CA             movsd    xmm1, xmm2
       0F28C1               movaps   xmm0, xmm1
       660F14C1             unpcklpd  xmm0, xmm1
       E9B9030000           jmp      G_M31513_IG09

G_M31513_IG03:
       488B81C0010000       mov      rax, qword ptr [rcx+448]
       4C8BC0               mov      r8, rax
       4C8B89C8010000       mov      r9, qword ptr [rcx+456]
       4D8BD1               mov      r10, r9
       4C8B99D0010000       mov      r11, qword ptr [rcx+464]
       498BF3               mov      rsi, r11
       488BB9D8010000       mov      rdi, qword ptr [rcx+472]
       488BDF               mov      rbx, rdi
       488BA9E0010000       mov      rbp, qword ptr [rcx+480]
       4C8BB1E8010000       mov      r14, qword ptr [rcx+488]
       4C8BB9F0010000       mov      r15, qword ptr [rcx+496]
       4533E4               xor      r12d, r12d
       41BD02000000         mov      r13d, 2

G_M31513_IG04:
       F2410F120F           movddup  xmm1, xmmword ptr [r15]
       0F290C24             movaps   xmmword ptr [rsp], xmm1
       F2410F1210           movddup  xmm2, xmmword ptr [r8]
       F2410F121A           movddup  xmm3, xmmword ptr [r10]
       F20F1226             movddup  xmm4, xmmword ptr [rsi]
       F20F122B             movddup  xmm5, xmmword ptr [rbx]
       F20F127500           movddup  xmm6, xmmword ptr [rbp]
       4C89742418           mov      qword ptr [rsp+18H], r14
       F2410F123E           movddup  xmm7, xmmword ptr [r14]
       418BD5               mov      edx, r13d
       C1EA1F               shr      edx, 31
       4103D5               add      edx, r13d
       83E2FE               and      edx, -2
       458BF5               mov      r14d, r13d
       442BF2               sub      r14d, edx
       418BD5               mov      edx, r13d
       412BD6               sub      edx, r14d
       83FA06               cmp      edx, 6
       0F8D83020000         jge      G_M31513_IG07
       0F29442430           movaps   xmmword ptr [rsp+30H], xmm0
       48895C2428           mov      qword ptr [rsp+28H], rbx
       48896C2420           mov      qword ptr [rsp+20H], rbp

G_M31513_IG05:
       4863DA               movsxd   rbx, edx
       48C1E303             shl      rbx, 3
       488D2C18             lea      rbp, [rax+rbx]
       66440F284500         movapd   xmm8, xmmword ptr [rbp]
       498D2C19             lea      rbp, [r9+rbx]
       66440F284D00         movapd   xmm9, xmmword ptr [rbp]
       498D2C1B             lea      rbp, [r11+rbx]
       66440F285500         movapd   xmm10, xmmword ptr [rbp]
       66440F59C2           mulpd    xmm8, xmm2
       66440F59CB           mulpd    xmm9, xmm3
       66440F59D4           mulpd    xmm10, xmm4
       450F28D8             movaps   xmm11, xmm8
       66450F59D8           mulpd    xmm11, xmm8
       450F28E1             movaps   xmm12, xmm9
       66450F59E1           mulpd    xmm12, xmm9
       450F28EA             movaps   xmm13, xmm10
       66450F59EA           mulpd    xmm13, xmm10
       66450F58DC           addpd    xmm11, xmm12
       66450F58DD           addpd    xmm11, xmm13
       450F28EB             movaps   xmm13, xmm11
       F2440F101D37030000   movsd    xmm11, qword ptr [reloc @RWD00]
       66450F28E3           movapd   xmm12, xmm11
       66450F57DB           xorpd    xmm11, xmm11
       F2450F10DC           movsd    xmm11, xmm12
       66450F5AE5           cvtpd2ps  xmm12, xmm13
       450F53E4             rcpps    xmm12, xmm12
       450F5AE4             cvtps2pd  xmm12, xmm12
       450F28F3             movaps   xmm14, xmm11
       66450F14F3           unpcklpd  xmm14, xmm11
       450F28DD             movaps   xmm11, xmm13
       66450F59DC           mulpd    xmm11, xmm12
       450F28FE             movaps   xmm15, xmm14
       66450F5CFB           subpd    xmm15, xmm11
       450F28DF             movaps   xmm11, xmm15
       66450F59DF           mulpd    xmm11, xmm15
       410F28C6             movaps   xmm0, xmm14
       66410F58C7           addpd    xmm0, xmm15
       66450F58F3           addpd    xmm14, xmm11
       66410F59C6           mulpd    xmm0, xmm14
       66410F59C4           mulpd    xmm0, xmm12
       F2440F101DDE020000   movsd    xmm11, qword ptr [reloc @RWD08]
       66450F28E3           movapd   xmm12, xmm11
       66450F57DB           xorpd    xmm11, xmm11
       F2450F10DC           movsd    xmm11, xmm12
       450F28E3             movaps   xmm12, xmm11
       66450F14E3           unpcklpd  xmm12, xmm11
       F2440F101DC5020000   movsd    xmm11, qword ptr [reloc @RWD16]
       66450F28F3           movapd   xmm14, xmm11
       66450F57DB           xorpd    xmm11, xmm11
       F2450F10DE           movsd    xmm11, xmm14
       450F28F3             movaps   xmm14, xmm11
       66450F14F3           unpcklpd  xmm14, xmm11
       F2440F101DAC020000   movsd    xmm11, qword ptr [reloc @RWD24]
       66450F28FB           movapd   xmm15, xmm11
       66450F57DB           xorpd    xmm11, xmm11
       F2450F10DF           movsd    xmm11, xmm15
       450F28FB             movaps   xmm15, xmm11
       66450F14FB           unpcklpd  xmm15, xmm11
       F2440F101D93020000   movsd    xmm11, qword ptr [reloc @RWD32]
       66410F28CB           movapd   xmm1, xmm11
       66450F57DB           xorpd    xmm11, xmm11
       F2440F10D9           movsd    xmm11, xmm1
       410F28CB             movaps   xmm1, xmm11
       66410F14CB           unpcklpd  xmm1, xmm11
       66450F5ADD           cvtpd2ps  xmm11, xmm13
       450F52DB             rsqrtps  xmm11, xmm11
       450F5ADB             cvtps2pd  xmm11, xmm11
       66450F59EB           mulpd    xmm13, xmm11
       66450F59EB           mulpd    xmm13, xmm11
       66450F5CE5           subpd    xmm12, xmm13
       450F28EF             movaps   xmm13, xmm15
       66450F59EC           mulpd    xmm13, xmm12
       66450F58EE           addpd    xmm13, xmm14
       450F28F4             movaps   xmm14, xmm12
       66450F59F4           mulpd    xmm14, xmm12
       66440F59F1           mulpd    xmm14, xmm1
       410F28CE             movaps   xmm1, xmm14
       66410F58CD           addpd    xmm1, xmm13
       450F28EB             movaps   xmm13, xmm11
       66450F59EC           mulpd    xmm13, xmm12
       450F28E5             movaps   xmm12, xmm13
       66440F59E1           mulpd    xmm12, xmm1
       410F28CC             movaps   xmm1, xmm12

G_M31513_IG06:
       66410F58CB           addpd    xmm1, xmm11
       440F28E8             movaps   xmm13, xmm0
       66440F59E9           mulpd    xmm13, xmm1
       0F28442430           movaps   xmm0, xmmword ptr [rsp+30H]
       66440F59E8           mulpd    xmm13, xmm0
       0F280C24             movaps   xmm1, xmmword ptr [rsp]
       440F28D9             movaps   xmm11, xmm1
       66450F59DD           mulpd    xmm11, xmm13
       488D2C1F             lea      rbp, [rdi+rbx]
       450F28E3             movaps   xmm12, xmm11
       66450F59E0           mulpd    xmm12, xmm8
       66440F287500         movapd   xmm14, xmmword ptr [rbp]
       66450F5CF4           subpd    xmm14, xmm12
       66440F297500         movapd   xmmword ptr [rbp], xmm14
       488BEB               mov      rbp, rbx
       4803A9E0010000       add      rbp, qword ptr [rcx+480]
       450F28E3             movaps   xmm12, xmm11
       66450F59E1           mulpd    xmm12, xmm9
       66440F287500         movapd   xmm14, xmmword ptr [rbp]
       66450F5CF4           subpd    xmm14, xmm12
       66440F297500         movapd   xmmword ptr [rbp], xmm14
       488BEB               mov      rbp, rbx
       4803A9E8010000       add      rbp, qword ptr [rcx+488]
       66450F59DA           mulpd    xmm11, xmm10
       66440F286500         movapd   xmm12, xmmword ptr [rbp]
       66450F5CE3           subpd    xmm12, xmm11
       66440F296500         movapd   xmmword ptr [rbp], xmm12
       480399F0010000       add      rbx, qword ptr [rcx+496]
       450F28DD             movaps   xmm11, xmm13
       66440F591B           mulpd    xmm11, xmmword ptr [rbx]
       450F28E3             movaps   xmm12, xmm11
       66450F59E0           mulpd    xmm12, xmm8
       66410F58EC           addpd    xmm5, xmm12
       450F28C3             movaps   xmm8, xmm11
       66450F59C1           mulpd    xmm8, xmm9
       66410F58F0           addpd    xmm6, xmm8
       450F28C3             movaps   xmm8, xmm11
       66450F59C2           mulpd    xmm8, xmm10
       66410F58F8           addpd    xmm7, xmm8
       83C202               add      edx, 2
       83FA06               cmp      edx, 6
       0F290C24             movaps   xmmword ptr [rsp], xmm1
       0F8C23010000         jl       G_M31513_IG11
       488B5C2428           mov      rbx, qword ptr [rsp+28H]
       488B6C2420           mov      rbp, qword ptr [rsp+20H]

G_M31513_IG07:
       0F28CD               movaps   xmm1, xmm5
       660F7CCD             haddpd   xmm1, xmm5
       F20F110B             movsd    xmmword ptr [rbx], xmm1
       0F28CD               movaps   xmm1, xmm5
       660F7CCD             haddpd   xmm1, xmm5
       F20F110B             movsd    xmmword ptr [rbx], xmm1
       0F28CD               movaps   xmm1, xmm5
       660F7CCD             haddpd   xmm1, xmm5
       F20F110B             movsd    xmmword ptr [rbx], xmm1
       660F59E8             mulpd    xmm5, xmm0
       660F58D5             addpd    xmm2, xmm5
       0F28CE               movaps   xmm1, xmm6
       660F59C8             mulpd    xmm1, xmm0
       660F58D9             addpd    xmm3, xmm1
       0F28CF               movaps   xmm1, xmm7
       660F59C8             mulpd    xmm1, xmm0
       660F58E1             addpd    xmm4, xmm1
       0F28CA               movaps   xmm1, xmm2
       660F7CCA             haddpd   xmm1, xmm2
       F2410F1108           movsd    xmmword ptr [r8], xmm1
       0F28D3               movaps   xmm2, xmm3
       660F7CD3             haddpd   xmm2, xmm3
       F2410F1112           movsd    xmmword ptr [r10], xmm2
       0F28DC               movaps   xmm3, xmm4
       660F7CDC             haddpd   xmm3, xmm4
       F20F111E             movsd    xmmword ptr [rsi], xmm3
       4585E4               test     r12d, r12d
       7506                 jne      SHORT G_M31513_IG08
       41BC01000000         mov      r12d, 1

G_M31513_IG08:
       41FFC4               inc      r12d
       41FFC5               inc      r13d
       4983C708             add      r15, 8
       4883C308             add      rbx, 8
       4883C508             add      rbp, 8
       4C8B742418           mov      r14, qword ptr [rsp+18H]
       4983C608             add      r14, 8
       4983C008             add      r8, 8
       4983C208             add      r10, 8
       4883C608             add      rsi, 8
       4183FC06             cmp      r12d, 6
       0F8C94FCFFFF         jl       G_M31513_IG04
       8B942438010000       mov      edx, dword ptr [rsp+138H]

G_M31513_IG09:
       8BC2                 mov      eax, edx
       8D50FF               lea      edx, [rax-1]
       89942438010000       mov      dword ptr [rsp+138H], edx
       85C0                 test     eax, eax
       0F8F33FCFFFF         jg       G_M31513_IG03

G_M31513_IG10:
       0F28B424D0000000     movaps   xmm6, qword ptr [rsp+D0H]
       0F28BC24C0000000     movaps   xmm7, qword ptr [rsp+C0H]
       440F288424B0000000   movaps   xmm8, qword ptr [rsp+B0H]
       440F288C24A0000000   movaps   xmm9, qword ptr [rsp+A0H]
       440F28942490000000   movaps   xmm10, qword ptr [rsp+90H]
       440F289C2480000000   movaps   xmm11, qword ptr [rsp+80H]
       440F28642470         movaps   xmm12, qword ptr [rsp+70H]
       440F286C2460         movaps   xmm13, qword ptr [rsp+60H]
       440F28742450         movaps   xmm14, qword ptr [rsp+50H]
       440F287C2440         movaps   xmm15, qword ptr [rsp+40H]
       4881C4E8000000       add      rsp, 232
       5B                   pop      rbx
       5D                   pop      rbp
       5E                   pop      rsi
       5F                   pop      rdi
       415C                 pop      r12
       415D                 pop      r13
       415E                 pop      r14
       415F                 pop      r15
       C3                   ret      

G_M31513_IG11:
       0F29442430           movaps   xmmword ptr [rsp+30H], xmm0
       E969FCFFFF           jmp      G_M31513_IG05

; Total bytes of code 1194, prolog size 95 for method NBodyHWIntrinsics.NBody:Advance(int,double):this
; ============================================================
NaN
